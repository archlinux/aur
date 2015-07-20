# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Previous maintainer: Lucy <lucy@luz.lu>
# Contributor: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>

pkgname=pkgconf
pkgver=0.9.12
pkgrel=1
pkgdesc='Light pkg-config replacement'
url='https://github.com/pkgconf/pkgconf'
arch=('i686' 'x86_64')
license=('custom:ISC')
conflicts=('pkg-config' 'pkgconfig' 'pkgconf-git')
provides=('pkg-config' 'pkgconfig')
replaces=('pkg-config' 'pkgconfig')
depends=('glibc')
source=("https://github.com/pkgconf/pkgconf/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('d31a19e22908e5bf277454261222da0640115844f7a62672dbe9e92061d547c5')

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
