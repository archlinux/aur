# Maintainer: Andrea Pascal <andrea@anodium.net>

pkgbase=python-pylsl-git
pkgname=(python-pylsl-git python2-pylsl-git)
_pkgname=${pkgname%-git}
_name=${_pkgname#python-}
pkgver=1.13.1.r4.gd003cba
pkgrel=1
pkgdesc='Python interface to the Lab Streaming Layer'
url='https://github.com/labstreaminglayer/liblsl-Python'
arch=('any')
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('liblsl')
makedepends=('git')
optdepends=('python-mne: Viewer V2'
            'python-vispy: Viewer V2')
source=("$_name::git+https://github.com/labstreaminglayer/liblsl-Python.git")
sha384sums=('SKIP')

pkgver() {
    cd "$srcdir/$_name"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd "$srcdir/$_name"
  python setup.py build
  python2 setup.py build
}

check(){
  cd "$srcdir/$_name"
  python setup.py check -m -s
  python2 setup.py check -m -s
}

package_python-pylsl-git() {
  makedepends=('python-setuptools')
  cd "$srcdir/$_name"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_python2-pylsl-git() {
  makedepends=('python2-setuptools')
  cd "$srcdir/$_name"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
