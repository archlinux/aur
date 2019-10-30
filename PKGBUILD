#Original author: Jason Ferrara <jason.ferrara [at] jacquette.com>
#Maintainer: Kirill Gagarski <kirill.gagarski [at] gmail.com>
pkgname=jmtpfs-git
pkgver=v0.5
pkgrel=3
license=('GPL')
pkgdesc="mtpfs with better support for Android"
arch=('x86_64')
url="https://github.com/JasonFerrara/jmtpfs"
depends=('fuse' 'file' 'libmtp')
makedepends=('git')
provides=('jmtpfs')
conflicts=("jmtpfs")
source=("git+https://github.com/JasonFerrara/jmtpfs")
_gitname=jmtpfs
md5sums=('SKIP')

pkgver() {
    cd $_gitname
    echo $(git describe --always | sed 's/-/./g')
}

build() {
    cd $_gitname
    ./configure CXXFLAGS=-lpthread --prefix=/usr/
    make
}

package() {
    cd $_gitname
    make DESTDIR="$pkgdir/" install
}
