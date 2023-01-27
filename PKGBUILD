# Maintainer: éclairevoyant
# Contributor: juantascon <juantascon dot aur at horlux dot org>
# Contributor: damir <damir at archlinux dot org>

pkgname=pal
pkgver=0.4.3
pkgrel=7
pkgdesc="A command-line calendar program."
arch=('i686' 'x86_64')
url="https://palcal.sourceforge.net"
license=('GPL2')
depends=('pkg-config' 'glib2' 'readline' 'gettext')
optdepends=('texlive-core: PS/PDF/DVI calendars')
source=(
	"https://master.dl.sourceforge.net/project/palcal/$pkgname/$pkgver/$pkgname-$pkgver.tgz"
	0001-respect-cflags.patch
	0002-remove-hacky-cast.patch
	0003-replace-deprecated-constants.patch
	0004-use-g_memdup2.patch
	0005-fix-pointer-comparison.patch
)
b2sums=('3d2629b534a644a3f760f64176340ffd73c0f33b6717e726662d6888a8007160a2978560f1e5f40140f128036e57a53e5b3c930fa07802f7170c1dc6fbce745d'
        'c205beed29c17c39e839c61bd7205cb93cb6823e6eb5fa78f4caa8f8f37477e23c3d613d54f0d8b39e40e0b1f3be1d9c9395fe5e00968290d972cf3b27f7b012'
        'b01f37a293f8d6271d5515372b57fab1da30b4b3a9398ba6d0ea52382f370db1bfb053a4607a4eb1dc9e5f7c3121de6058a9a81d0a43f90ffcbb477b49dc30aa'
        '9700348c30a576759cf79e18e3ab660bd58131849870fbde0e59e630667dfb6a8f75dfca2290ca08842b30029764c9fe833bd86683bf0097de788a533fc663f5'
        '0d6bbcd6b149306280f14c869cfc27e8073cba87785de13b53676f102c6a632d12c2e12bb7403a78824e603032388ee67414e49d3a95609d948849329d87b5a8'
        '832a30a51e324b24bf0e383dfb55cffe345756a1df2fc3c04443b087bbfed16c3043c4bdd7a674f57439d8a03be45ef6cd3d9685663d43ac13cc805e7262fab0')

prepare() {
	cd $pkgname-$pkgver
	patch -Np1 -i ../0001-respect-cflags.patch
	patch -Np1 -i ../0002-remove-hacky-cast.patch
	patch -Np1 -i ../0003-replace-deprecated-constants.patch
	patch -Np1 -i ../0004-use-g_memdup2.patch
	patch -Np1 -i ../0005-fix-pointer-comparison.patch
}

build() {
	make -C $pkgname-$pkgver/src CFLAGS="$CFLAGS -Wno-format-security"
}

package() {
	make -C $pkgname-$pkgver/src DESTDIR="$pkgdir" install-no-rm 
}
