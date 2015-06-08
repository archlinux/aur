# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Previous maintainer: Lucy <lucy@luz.lu>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=pkgconf
pkgver=0.9.11
pkgrel=2
pkgdesc='Light pkg-config replacement'
url='https://github.com/pkgconf/pkgconf'
arch=('i686' 'x86_64')
license=('custom:ISC')
conflicts=('pkg-config' 'pkgconfig')
provides=('pkg-config' 'pkgconfig')
replaces=('pkg-config' 'pkgconfig')
depends=('glibc')
source=("https://github.com/pkgconf/pkgconf/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('6649762eee0d222e1d231e6b4ab2e4596a23788f3341b040eea404d4c85731c1')

build() {                                                                       
    cd "$srcdir/$pkgname-$pkgname-$pkgver" 
	./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    ln -s /usr/bin/pkgconf "$pkgdir/usr/bin/pkg-config"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
