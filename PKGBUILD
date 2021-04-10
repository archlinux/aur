# Maintainer: Frédéric Mangano <fmang+aur mg0.fr>

pkgname=wish
pkgver=1.3
pkgrel=1
pkgdesc='Japanese-to-English dictionary software, command-line and web interface'
arch=('any')
url='https://github.com/fmang/wish'
license=('PerlArtistic')

depends=('perl' 'perl-cgi-fast' 'perl-term-readline-gnu' 'perl-uri')
makedepends=('git' 'sassc')
optdepends=('spawn-fcgi')

source=("https://github.com/fmang/wish/archive/v$pkgver.tar.gz" 'wish-fcgi.service')
sha256sums=('cd3cab2068120b5942f80a0b3ed16609984a661fd14460a6f55bcfeb9a4aa693'
            '1e973469bf9c5b37b9240a95364cec6128d325703f96a1db28b33406c3666aa7')

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh
	./configure --prefix=/usr --libexecdir=/usr/lib
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 "$srcdir/wish-fcgi.service" "$pkgdir/usr/lib/systemd/system/wish-fcgi.service"
}
