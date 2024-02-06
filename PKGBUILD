# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=gdown
pkgver=5.1.0
pkgrel=1
pkgdesc="Download a large file from Google Drive"
arch=('any')
url="https://github.com/wkentaro/gdown"
license=('MIT')
depends=('python' 'python-tqdm' 'python-filelock' 'python-pysocks' 'python-six' 'python-beautifulsoup4' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-wheel' 'git' 'python-hatch-vcs' 'python-hatch-fancy-pypi-readme')
source=(git+https://github.com/wkentaro/gdown.git#tag=v${pkgver})
sha512sums=('SKIP')

prepare() {
  cd "${pkgname}"

  git submodule update --init
}

build() {
  cd "${pkgname}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
  install -Dm755 README.md "${pkgdir}/usr/share/doc/${pkgname}"/README.md
}
# vim:set ts=2 sw=2 et:
