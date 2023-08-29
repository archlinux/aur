# Maintainer: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: A.T.W.A. <arch.atwa@gmail.com>
# Contributor: Janne Heß <jannehess@gmail.com>

pkgname=archivemount
pkgver=0.9.1
pkgrel=3
pkgdesc="FUSE based filesystem for mounting compressed archives"
arch=('i686' 'x86_64')
url="https://www.cybernoia.de/software/archivemount.html"
license=('GPL2')
depends=('fuse' 'libarchive')
makedepends=('automake' 'git' 'gcc' 'autoconf')
_githash=78c306538065de9b14f48cfc2024f50f843d3b29
_gituser=cybernoid
source=("https://github.com/$_gituser/$pkgname/archive/$_githash.zip")
sha256sums=('SKIP')

prepare() {
    cd "${pkgname}-${_githash}"
    autoreconf -f || true
    automake -f --add-missing
    autoreconf -f
}

build() {
    cd "${pkgname}-${_githash}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${pkgname}-${_githash}"
    make DESTDIR="${pkgdir}" install
}
