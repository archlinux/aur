# Contributor: moparisthebest <admin dot archlinux AT moparisthebest dot com>

pkgname=cryptsetup-multidisk-ssh
pkgver=1.0
pkgrel=1
pkgdesc='Handle multiple encrypted root devices with ssh shell'
arch=('any')
license=('GPL3')
depends=('cryptsetup')
optdepends=('mkinitcpio-dropbear: Allow the encryptssh hook to unlock a root container remotely using dropbear'
            'mkinitcpio-tinyssh: Allow the encryptssh hook to unlock a root container remotely using tinyssh')

author='moparisthebest'
url="https://github.com/$author/$pkgname"
source=("https://github.com/$author/$pkgname/archive/v$pkgver.tar.gz" "https://github.com/$author/$pkgname/releases/download/v$pkgver/v$pkgver.tar.gz.asc")
validpgpkeys=('81F1C22DD41109D4A9C0A7B5B070F8D97D1A0BBA') # moparisthebest <admin AT moparisthebest.com>
sha256sums=('a886feb187c398048f49e15b4ead113caa5dfb568ed842e9bbdc556f9bdff079'
            'SKIP')

package() {
	cd "${pkgname}-$pkgver"
	install -Dm644 encrypt_hook     "${pkgdir}"/usr/lib/initcpio/hooks/encrypt-multidisk-ssh
	install -Dm644 encrypt_install  "${pkgdir}"/usr/lib/initcpio/install/encrypt-multidisk-ssh
	install -Dm744 cryptsetup_shell "${pkgdir}/usr/share/$pkgname/bin/cryptsetup_shell"
	install -Dm744 query_password   "${pkgdir}/usr/share/$pkgname/bin/query_password"
	install -Dm644 readme.md        "${pkgdir}/usr/share/$pkgname/readme.md"
	install -Dm644 LICENSE          "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
