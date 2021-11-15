# Maintainer: Ariel Abreu <facekapow@outlook.com>

pkgname='gitify-bin'
pkgver='4.3.1'
pkgrel=1
pkgdesc='GitHub notifications on your menu bar'
arch=('x86_64')
url='https://www.gitify.io/'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libutil-linux' 'libappindicator-gtk3' 'libsecret')
source=(
	"$pkgname-$pkgver.deb::https://github.com/manosim/gitify/releases/download/v$pkgver/gitify_${pkgver}_amd64.deb"
	"LICENSE::https://raw.githubusercontent.com/manosim/gitify/v$pkgver/LICENSE"
)
sha256sums=(
	'df362b5e6db7937c9cdcf09b1aa40361520f9347ac5ffc7b28e28be868f5bc46'
	'SKIP'
)
noextract=("$pkgname-$pkgver.deb")
options=('!strip')

package() {
	cd "$pkgdir"

	ar p "$srcdir/$pkgname-$pkgver.deb" data.tar.xz | tar xJ

	install -d -m755 "${pkgdir}/usr/bin"
	ln -s /opt/Gitify/gitify "${pkgdir}/usr/bin"

	install -d -m755 "${pkgdir}/usr/share/licenses/gitify-bin"
	install -m644 "$srcdir/LICENSE" "${pkgdir}/usr/share/licenses/gitify-bin/LICENSE"
}
