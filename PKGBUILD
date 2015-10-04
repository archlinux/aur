# Maintainer: Stephan Conrad <stephan@conrad.pics>
pkgname=modsecurity
pkgver=2.9.0
pkgrel=1
epoch=
pkgdesc=""
arch=('x86_64' 'i386')
url=""
license=('ASLv2')
groups=()
depends=(
	'apache'
	'apr'
	'apr-util'
	'pcre'
	'libxml2'
	'lua'
	'curl'
)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://www.modsecurity.org/tarball/2.9.0/$pkgname-$pkgver.tar.gz"
		'lua_5.3.patch'
        )
noextract=()
md5sums=('ecf42d21f26338443d7111891851628c'
         'e932d70f975e6acccd0583a6e91818d1')
validpgpkeys=()

prepare() {
        cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/lua_5.3.patch"
}

build() {
        cd "$pkgname-$pkgver"
         ./configure --with-apxs=/usr/bin/apxs --enable-htaccess-config
        make
}

package() {
        cd "$pkgname-$pkgver"
        make DESTDIR="$pkgdir/" install
}

