# Maintainer: Philipp Joram <mail [at] phijor [dot] me>

_name=qtsass
pkgname=python-$_name
pkgver=0.3.0
pkgrel=2
pkgdesc="Compile SCSS files to Qt stylesheets"
arch=('any')
url="https://github.com/spyder-ide/qtsass"
license=('MIT')
depends=(
  'python-setuptools'
  'python-libsass'
)
makedepends=('python')
source=("$_name-$pkgver::git+https://github.com/spyder-ide/qtsass.git#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
  cd $srcdir/$_name-$pkgver
  # Bug fix: "Add check for deprecated api between 2 and 3 versions"
  git cherry-pick -n cbea8d8
}

build() {
  cd $srcdir/$_name-$pkgver
  python3 setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
