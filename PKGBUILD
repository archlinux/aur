# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=pipgrip
pkgver=0.10.2
pkgrel=1
pkgdesc="Lightweight pip dependency resolver with deptree preview functionality based on the PubGrub algorithm"
arch=('any')
url="https://github.com/ddelange/pipgrip"
license=('BSD')
depends=('python-anytree' 'python-click' 'python-packaging' 'python-pip'
         'python-pkginfo' 'python-setuptools' 'python-wheel')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('2a6116e2794357f5f4420c1282c2e7a37f0bc8c571b6af90ee6a8ea1f89c7461')

prepare() {
  cd "$pkgname-$pkgver"

  # Relax requirements
  sed -i 's/pkginfo>=1.4.2,<1.8/pkginfo>=1.4.2/g' requirements/prod.txt
  sed -i 's/setuptools_scm<7/setuptools_scm/g' setup.py
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
