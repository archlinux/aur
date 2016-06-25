# Maintainer: Julian Orth <ju.orth@gmail.com>

pkgname=spotblock-git
pkgver=r9.a9fc6e2
pkgrel=1
pkgdesc='A spotify ad blocker'
arch=('i686' 'x86_64')
url='https://github.com/mahkoh/spotblock'
license=('GPL3')
depends=('libsystemd' 'libpulse')
source=("$pkgname::git+https://github.com/mahkoh/spotblock")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
	cd "$pkgname/build"
    make DESTDIR="$pkgdir/" install
}
