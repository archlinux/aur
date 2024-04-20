# Maintainer: Ariel Abreu <facekapow@outlook.com>

pkgname='gitify-bin'
pkgver='5.4.0'
pkgrel=1
pkgdesc='GitHub notifications on your menu bar'
arch=('x86_64')
url='https://www.gitify.io/'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libutil-linux' 'libappindicator-gtk3' 'libsecret')
source=(
	"$pkgname-$pkgver.deb::https://github.com/gitify-app/gitify/releases/download/v$pkgver/gitify_${pkgver}_amd64.deb"
	"LICENSE::https://raw.githubusercontent.com/gitify-app/gitify/v$pkgver/LICENSE"
)
sha512sums=(
	'7abcc02ff1b9e862d9ecf65e902105215646688aa091bcd2bf8c756b10a417b985cd2ecc3fa1d1af34f3e5afe6e6b9f8522b17ed8f9ce4918a998fb6e4e003ba'
	'ae194a5181f67d44dacb880e611e952f6b24943425ebccfba870f5c0367cbfbab3bf5549332344a298a580536ac1c65e6bfa77a0787102e3c10be00f9d4c7626'
)
noextract=("$pkgname-$pkgver.deb")
options=('!strip')

package() {
	cd "$pkgdir"

	ar p "$srcdir/$pkgname-$pkgver.deb" data.tar.xz | tar xJ

	chmod u+s "${pkgdir}/opt/Gitify/chrome-sandbox"

	install -d -m755 "${pkgdir}/usr/bin"
	ln -s /opt/Gitify/gitify "${pkgdir}/usr/bin"

	install -d -m755 "${pkgdir}/usr/share/licenses/gitify-bin"
	install -m644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/gitify-bin/LICENSE"
}
