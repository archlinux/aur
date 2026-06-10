# Maintainer: Blake Blair <contact@blakeblair.dev>
pkgname=steamlogscrubber
pkgver=0.1.0
pkgrel=1
pkgdesc="Steam and Proton log scrubber for safe support sharing"
arch=("any")
url="https://github.com/blakeblair/steamlogscrubber"
license=("GPL-3.0-or-later")
depends=("python")
optdepends=(
  "python-py7zr: 7z archive output support"
  "python-zstandard: zstd/tar.zst archive output support"
)
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cf91eb2c9caba5067b69732c768d2c9eb74559bc1f1d6a82b373e032a1132399')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
