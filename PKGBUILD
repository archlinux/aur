# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-pyzm-git
_name=pyzm
pkgver=r34.2b46698
pkgrel=1
pkgdesc="ZoneMinder Python API and Logger"
arch=('any')
depends=()
makedepends=('python-setuptools' 'python-nose' 'git')
url="https://github.com/pliablepixels/pyzm"
license=('GPL2')
options=('!emptydirs')
source=(git://github.com/pliablepixels/pyzm.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_name"
  sed -i "s|/etc/zm|/etc/zoneminder|" pyzm/ZMLog.py
}

build() {
  cd "$srcdir/$_name"
  python setup.py build
}

check(){
    cd "$srcdir/$_name"

    # For nosetests
    nosetests
}

package() {
  cd "$srcdir/$_name"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
