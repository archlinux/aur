# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Benjamin A. Shelton <zancarius@gmail.com>
# Contributor: p2k <Patrick.Schneider@uni-ulm.de>

_pypiname=anyjson
pkgname=python-$_pypiname
pkgver=0.3.3
pkgrel=17
pkgdesc="Wraps the best available JSON implementation available in a common interface"
arch=(any)
url="https://pypi.python.org/pypi/$_pypiname"
license=('BSD')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=(
  "https://files.pythonhosted.org/packages/source/a/$_pypiname/$_pypiname-${pkgver}.tar.gz"
  $_pypiname-$pkgver-python3.11.patch
)
sha256sums=('37812d863c9ad3e35c0734c42e0bf0320ce8c3bed82cd20ad54cb34d158157ba'
            '7123bebae5ea24f7e7032f0bfaf7d05a055dd21ad3047ee913eb3351ebbc6440')
b2sums=('196596b832bddf7969fa9f77f7b78e37bf7fbc93dacb2790615555072b1b504b70d43e50bd968969abe92b6503b79d392f344b72b663fc3be700a0e4053c278f'
        'a8c58c6f24bedf9f5b1707cf6cf212ebba3b1eff5884e86b96b899e63c73a4c45c7bb7d0c943d64d1cb3c6de8915adc26e9a61a77a7cc866a942c89437031f17')

prepare() {
  patch -Np1 -d $_pypiname-$pkgver -i ../$_pypiname-$pkgver-python3.11.patch
}
build() {
  cd "$_pypiname-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pypiname-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
