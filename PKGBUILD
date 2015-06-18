# Maintener : sputnick <gilles DOT quenot AT gmail DOT com>
# Contributor: Carlos Ruiz <cailovirtual@gmail.com>

pkgname=jigdo
pkgver=0.7.3
pkgrel=4
pkgdesc="Jigsaw Download, or short jigdo, is a tool designed to ease the distribution of very large files over the internet, for example CD or DVD images"
url="http://atterer.org/jigdo/"
license=("GPL2")
arch=('i686' 'x86_64')
depends=('gtk2>=2.4.0' 'bzip2' 'curl')
source=(
    "http://atterer.org/sites/atterer/files/2009-08/$pkgname/$pkgname-$pkgver.tar.bz2"
    "https://raw2.github.com/sputnick-dev/aur/master/$pkgname/$pkgname-$pkgver-gcc43.patch"
)

md5sums=('bbc1d9ac750bb34e0748f0b57157cc72'
     '0133ce4fd63c872a26e1c19b627eb2db')

build() {
   cd $startdir/src/$pkgname-$pkgver
   patch -Np1 -i ../jigdo-0.7.3-gcc43.patch || return 1
   ./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info
   make || return 1
}

package() {
    cd $startdir/src/$pkgname-$pkgver
    make DESTDIR=$pkgdir install || return 1
}
