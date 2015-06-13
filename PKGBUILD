# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=mozjpeg-git
pkgver=20131001
pkgrel=1
pkgdesc="A fork of libjpeg-turbo with jpgcrush built in."
url="https://github.com/mozilla/mozjpeg/"
license=("GPL")
arch=('i686' 'x86_64')
makedepends=('git' 'nasm')
depends=()
source=('git+https://github.com/mozilla/mozjpeg.git')
md5sums=('SKIP')
_gitname=mozjpeg

provides=('libjpeg=8.0.2' 'turbojpeg' 'libjpeg-turbo')
conflicts=('libjpeg-turbo')

pkgver() {
    cd "$_gitname"
    git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build()
{
    cd "$_gitname"
    autoreconf -fiv
    ./configure --prefix=/usr --mandir=/usr/share/man
}

# takes forever
#check()
#{
#    cd "$_gitname"
#    make test
#}

package() {
    cd "$_gitname"
    make DESTDIR="$pkgdir" docdir="/usr/share/doc/$pkgname" install
    # license?
    install -m644 jpegint.h "$pkgdir/usr/include"
}

