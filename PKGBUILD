# Maintainer: Grey Christoforo <first name at last name dot net>

pkgbase=('python-picamera-git')
pkgname=('python-picamera-git' 'python2-picamera-git')
_module='picamera'
pkgver=r926.93a0808
pkgrel=1
pkgdesc="A pure Python interface for the Raspberry Pi camera module."
url="http://picamera.readthedocs.io/"
depends=()
makedepends=('python-setuptools' 'python2-setuptools')
license=('BSD')
arch=('any')
source=("git://github.com/waveform80/picamera.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_module"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cp -a "${srcdir}/${_module}"{,-python2}
}

build() {
    cd "${srcdir}/${_module}"
    python setup.py build

    cd "${srcdir}/${_module}-python2"
    python2 setup.py build
}

package_python-picamera-git() {
    depends+=('python')
    cd "${srcdir}/${_module}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python2-picamera-git() {
    depends+=('python2')
    cd "${srcdir}/${_module}-python2"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
