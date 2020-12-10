# Maintainer: Hunter Peavey < printf "srht@die.bots" | sed "s/die.bots/krathalan.net/g" >

pkgname=gmnisrv-git
_pkgname=gmnisrv
pkgrel=2
pkgver=r58.70fadc2
pkgdesc="A high-performance Gemini server for POSIX systems"
url="https://git.sr.ht/~sircmpwn/gmnisrv"
arch=("any")
license=("GPL")
source=("gmnisrv::git+${url}")
depends=("openssl" "mailcap")
makedepends=("git" "scdoc")

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"

    mkdir build && cd build
    ../configure --prefix=/usr
    make PREFIX="/usr"
}

package() {
    cd gmnisrv/build
    make PREFIX="/usr" DESTDIR="$pkgdir" install
}

md5sums=('SKIP')
