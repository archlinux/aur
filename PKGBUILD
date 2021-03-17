# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=austin-git
pkgver=v2.1.1.r0.g2f29bd7
pkgrel=1
pkgdesc='Python frame stack sampler for CPython'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/P403n1x87/austin'
license=('GPL3')
makedepends=('git')
conflicts=('austin')
provides=("austin")

source=('git+https://github.com/P403n1x87/austin')
sha1sums=('SKIP')

pkgver() {
    cd austin
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd austin
    autoreconf --install
    mkdir build
}

build() {
    cd austin/build
    ../configure --prefix=/usr
    make
}

package() {
    cd austin/build
    make DESTDIR="$pkgdir" install
}
