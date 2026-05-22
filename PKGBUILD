# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=gdown
pkgver=6.0.0
pkgrel=1
pkgdesc="Download a large file from Google Drive"
arch=('any')
url="https://github.com/wkentaro/gdown"
license=('MIT')
depends=('python' 'python-tqdm' 'python-filelock' 'python-pysocks' 'python-beautifulsoup4' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-wheel' 'git' 'python-hatch-vcs' 'python-hatch-fancy-pypi-readme')
source=(git+https://github.com/wkentaro/gdown.git#tag=v${pkgver})
sha512sums=('51d42a71878d01b9b2c730cb46f87626f206667d0293f7a6ae4cd41eaf90c32908dd7251b1255d9a2028c425cb6a01fce998e04b7c06684a103df13681fa934c')

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
