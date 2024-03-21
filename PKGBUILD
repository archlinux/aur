# Maintainer:TurtleRuss <tttturtleruss@gmail.com> 
pkgname=hustmirror-cli
pkgver=1.1.1
pkgrel=1
epoch=
pkgdesc="The command line tool (hustmirror-cli) is a small tool that can help you quickly change sources to HUST mirror sources."
arch=('x86_64')
license=('GPL')
url='https://gitee.com/hustmirror/hustmirror-cli'
groups=()
depends=()
makedepends=('make')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-stable.tar.gz::${url}/repository/archive/stable.tar.gz"
        "$pkgname-stable.patch"
		"$pkgname-makefile.patch")
noextract=()
sha256sums=('SKIP'
            'a08dfc1246edcb721505d717dff36abdaa4aee0f1a74c02d4eece69f563cb5e8'
			'b63df2685509bbdd82a97c0b73e4891d013a6a91c19fc029ed79ce9fc35b4710')
validpgpkeys=()

prepare() {
	cd "$pkgname-stable"
	patch -p1 -i "$srcdir/$pkgname-stable.patch"
	patch -p1 -i "$srcdir/$pkgname-makefile.patch"
	echo "$pkgdir/usr/local/bin"
	mkdir -p "$pkgdir/usr/local/bin"
}

build() {
	cd "$pkgname-stable"
	make
}

package() {
	cd "$pkgname-stable"
	echo $pkgdir
	make DESTDIR="$pkgdir/" install
}
