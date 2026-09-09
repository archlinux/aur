# Maintainer: Christopher Snowhill <kode54@gmail.com>
# Contributor: Sven-Hendrik Haase <svenstaro@gmail.com>

pkgname=gdown
pkgver=6.2.0
pkgrel=1
pkgdesc="Download a large file from Google Drive"
arch=('any')
url="https://github.com/wkentaro/gdown"
license=('MIT')
depends=('python' 'python-tqdm' 'python-filelock' 'python-pysocks' 'python-beautifulsoup4' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-wheel' 'git' 'python-hatch-vcs' 'python-hatch-fancy-pypi-readme')
source=(git+https://github.com/wkentaro/gdown.git#tag=v${pkgver})
sha512sums=('4ac288b2a5ae7a6b0eef7a64af64440463b1578c553888b472a88fbd78ac6ae1ce90bf6baa5dcd8f794cef15558eb791a1b5e3b2ac5109445dedd6ed3afd32c4')

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
