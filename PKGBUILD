# Maintainer: Luis Aranguren <pizzaman@hotmail.com>

pkgname=python-pyzm-git
_name=pyzm
pkgver=0.3.55.r330.357fdbd
pkgrel=1
pkgdesc="ZoneMinder Python API and Logger"
arch=('any')
depends=()
makedepends=('python-setuptools' 'python-nose' 'git')
url="https://github.com/pliablepixels/pyzm"
license=('GPL2')
options=('!emptydirs')
source=(git+https://github.com/pliablepixels/pyzm.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  printf "%s.r%s.%s" "$(awk -F\" 'NR==1{print $2}' pyzm/__init__.py)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
