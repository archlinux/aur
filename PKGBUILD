# Contributor: Sara <sara at archlinux dot us>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=minmad-git
pkgver=0.r30.07062b3
pkgrel=1
pkgdesc='A small libmad/oss mp3 player.'
arch=('i686' 'x86_64')
url='http://repo.or.cz/w/minmad.git'
license=('custom:BSD')
makedepends=('git')
optdepends=('oss: sound support')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git://repo.or.cz/minmad.git"
	"minmad.1")
md5sums=('SKIP'
         '747b33cb091949b2bbcce4a483fee9a2')
sha1sums=('SKIP'
          '062322bf7d0df03b7587f2a4e87d0625fd5d0ec3')
sha256sums=('SKIP'
            'c13f3ee8ffe9f45d9b14f888cd035816cec5ab145c4f25a0610ec538e3044ed4')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	make all
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 minmad $pkgdir/usr/bin/minmad
	install -D -m644 ../minmad.1 $pkgdir/usr/share/man/man1/minmad.1
	install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/minmad.1
}
