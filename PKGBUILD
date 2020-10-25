# Maintainer: Hunter Peavey < printf "srht@die.bots" | sed "s/die.bots/krathalan.net/g" >

pkgname=gmnisrv-git
pkgrel=1
pkgver=r48.1fe1078
pkgdesc="A high-performance Gemini server for POSIX systems"
url="https://git.sr.ht/~sircmpwn/gmni"
arch=("any")
license=("GPL")
source=("gmnisrv::git+https://git.sr.ht/~sircmpwn/gmnisrv")
depends=('openssl')
makedepends=('git' 'scdoc')

pkgver() {
    cd gmnisrv
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd gmnisrv

    mkdir build && cd build
    ../configure --prefix=/usr
    make PREFIX="/usr"
}

package() {
    cd gmnisrv/build
    make PREFIX="/usr" DESTDIR="$pkgdir" install
}

md5sums=('SKIP')
