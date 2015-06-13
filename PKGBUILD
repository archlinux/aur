# Maintainer: Lara Maia <lara@craft.net.br>
pkgname=python-wiringpi2-git
pkgver=86.4ad103c
pkgrel=1
epoch=1
pkgdesc="Python-wrapped version of Gordon Henderson's WiringPI version 2."
url="https://github.com/WiringPi/WiringPi2-Python"
arch=('x86_64' 'i686' 'armv6h')
license=('GPLv3')
depends=('python')
makedepends=('git' 'python-setuptools' 'swig')
conflicts=('python-wiringpi2')
provides=('python-wiringpi2')
source=(git+https://github.com/WiringPi/WiringPi2-Python.git)
md5sums=('SKIP')

pkgver() {
    cd "$srcdir"/WiringPi2-Python
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
    cd "$srcdir"/WiringPi2-Python
    swig -python wiringpi.i
}

build() {
    cd "$srcdir"/WiringPi2-Python
    
    python setup.py build
}

package() {
    cd "$srcdir"/WiringPi2-Python
    
    python setup.py install --prefix=/usr --root=$pkgdir
}

