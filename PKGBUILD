# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=pipgrip
pkgver=0.8.0
pkgrel=2
pkgdesc="Lightweight pip dependency resolver with deptree preview functionality based on the PubGrub algorithm"
arch=('any')
url="https://github.com/ddelange/pipgrip"
license=('BSD')
depends=('python-anytree' 'python-click' 'python-pip' 'python-packaging' 'python-pkginfo'
         'python-setuptools' 'python-wheel')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('2ecf32bc30d245145de5ae0f4ea6b7e3e1ae2deff7b6317931a4a470185560d4')

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
