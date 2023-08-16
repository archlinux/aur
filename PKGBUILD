# Maintainer: nezu <nezu@nezu.cc>
pkgname=csgo-checker-bin
_pkgname=csgo-checker
pkgver=1.4.4
pkgrel=1
pkgdesc="Check CS:GO accounts for bans/cooldowns/wins/ranks (bin)"
arch=('x86_64')
url="https://github.com/dumbasPL/csgo-checker"
license=('GPL3')
depends=(gtk3 libxss nss)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname-$pkgver.tar.gz::https://github.com/dumbasPL/$_pkgname/releases/download/v$pkgver/${_pkgname}_x64-$pkgver.tar.gz"
		"https://raw.githubusercontent.com/dumbasPL/$_pkgname/v$pkgver/LICENSE"
		"https://raw.githubusercontent.com/dumbasPL/$_pkgname/v$pkgver/icons/icon.png"
		"$_pkgname.desktop")
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=('515daf883e67a79e8f971de2805b244e3ffbea3acc1dd5ff89c175ea25caf84a'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '9b5ed80bc338cd3e637c4893994fe7ec43278b65ecbdf2099348f767f13abc6b'
            'ca864ac4e882e43e5c6314029d2e40f1f2520e9418819483e6a47b684e7ce011')

package() {
	install -dm755 "${pkgdir}/opt/$_pkgname"
	tar xzf $pkgname-$pkgver.tar.gz -C "$pkgdir"/opt/$_pkgname --strip-components=1
	install -dm755 "${pkgdir}/usr/bin"
	ln -s /opt/$_pkgname/$_pkgname "$pkgdir"/usr/bin

	install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$_pkgname

	install -Dm644 "$srcdir/$_pkgname.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
