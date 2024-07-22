# Maintainer: Saurabh Kushwah <saurabh2023@glbajajgroup.org>

pkgname=python-gdown
pkgver=5.2.0
pkgrel=1
pkgdesc="Google Drive Public File/Folder Downloader"
arch=('any')
url="https://github.com/wkentaro/gdown"
license=('MIT')
depends=('python' 'python-beautifulsoup4' 'python-filelock' 'python-pysocks' 'python-requests' 'python-six' 'python-tqdm')
makedepends=('git' 'python-build' 'python-hatch-fancy-pypi-readme' 'python-hatch-vcs' 'python-installer' 'python-wheel')
source=(git+https://github.com/wkentaro/gdown.git#tag=v${pkgver})
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/gdown"
  git submodule update --init
}

build() {
  cd "${srcdir}/gdown"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/gdown"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
  install -Dm755 README.md "${pkgdir}/usr/share/doc/${pkgname}"/README.md
}
