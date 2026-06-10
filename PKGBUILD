# Maintainer: Blake Blair <contact@blakeblair.dev>
pkgname=steamlogscrubber
pkgver=0.2.0
pkgrel=1
pkgdesc="Steam log scrubber with CLI and GUI; Proton logs require PROTON_LOG=1 %command% in Steam launch options."
arch=("any")
url="https://github.com/blakeblair/steamlogscrubber"
license=("GPL-3.0-or-later")
depends=("python" "tk")
optdepends=(
  "python-py7zr: 7z archive output support"
  "python-zstandard: zstd/tar.zst archive output support"
)
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e0078d6ce43b24a3ecff499b47950386f4e13e966d76e0d8575a95f7ebd41282')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
