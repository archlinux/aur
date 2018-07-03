# Maintainer: Bas Bleeker <bubbel@kpnplanet.nl>
pkgname=fping-git
pkgver=r469.b2d3517
pkgrel=1
pkgdesc="A utility to ping multiple hosts at once - development version"
arch=(x86_64)
url="http://www.fping.org/"
license=('Custom')
groups=()
depends=('glibc')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=('fping')
conflicts=('fping')
source=("$pkgname"::'git://github.com/schweikert/fping.git#branch=develop')
md5sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    ./autogen.sh
    ./configure --prefix=/usr --sbindir=/usr/bin
    make
}

check() {
    cd "${pkgname}"
    make -k check
}

package() {
    cd "${pkgname}"
    make DESTDIR="$pkgdir/" install
}
