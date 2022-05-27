# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=pipgrip
pkgver=0.8.2
pkgrel=1
pkgdesc="Lightweight pip dependency resolver with deptree preview functionality based on the PubGrub algorithm"
arch=('any')
url="https://github.com/ddelange/pipgrip"
license=('BSD')
depends=('python-anytree' 'python-click' 'python-pip' 'python-packaging' 'python-pkginfo'
         'python-setuptools' 'python-wheel')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('e8ae2009fca122dc4410b28b31505eb447dffc600b74347e75d911543eb65e88')

prepare() {
  cd "$pkgname-$pkgver"

  # Relax pkginfo requirement
  sed -i 's/pkginfo>=1.4.2,<1.8/pkginfo>=1.4.2/g' requirements/prod.txt
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
