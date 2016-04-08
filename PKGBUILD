pkgname=psi-plus-l10n-qt5-git
pkgver=0.16.543.523.3
pkgrel=1
pkgdesc="Language packs for Psi+ (Qt 5.x build)"
arch=('any')
url="http://psi-plus.com"
license=('GPL2')
makedepends=('qt5-tools')
depends=('psi-plus-qt5-git')
options=('!strip' '!zipman')
source=('git://github.com/psi-plus/psi-plus-l10n.git')
md5sums=('SKIP')

pkgver() {
	cd psi-plus-l10n
	
	git describe --tags | cut -d - -f 1-2 --output-delimiter=.
}

build() {
	cd psi-plus-l10n/translations

	for langfile in *.ts; do
		lrelease-qt5 "$langfile"
	done
}

package() {
	cd psi-plus-l10n/translations

	install -v -dm755 "$pkgdir/usr/share/psi-plus/translations"
	install -v -m644 *.qm "$pkgdir/usr/share/psi-plus/translations"
}
