# Maintainer:  Michael Kogan <michael dot kogan at gmx dot net>

pkgname=graphthing
pkgver=1.3.2
pkgrel=4
pkgdesc="A tool that allows you to create, manipulate and study graphs"
arch=('i686' 'x86_64')
url="http://graph.seul.org/"
license=('GPL')
depends=('wxgtk' 'libpng12' 'libjpeg7')
source=("http://graph.seul.org/$pkgname-$pkgver.tar.gz" "stuff.patch")
md5sums=('486df5c84ec85ff8470d6304c1a69c98' '82fd31e240984e9aef34258e545a08d2')
sha1sums=('e9cb8e238ac510be881de8eb8ad1078725019627' '5394f5b93607da337a2b737bc38a6b0174d67d84')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	patch -p1 -i "$srcdir/stuff.patch" 
	./configure --prefix=/usr
	sed -i 's|/usr/bin/install|install|' src/GNUmakefile || return 1
	sed -i 's|/usr/bin/install|install|' GNUmakefile || return 1
	sed -i 's|/usr/bin|$(DESTDIR)/usr/bin|' src/GNUmakefile || return 1
	sed -i 's|${prefix}|$(DESTDIR)/${prefix}|' GNUmakefile || return 1
	make || return 1
	make DESTDIR="$pkgdir" install || return 1
}
