# Maintainer: Alexey D. <lq07829icatm@rambler.ru>

pkgname=psi-plus-l10n-git
pkgver=0.16.457
pkgrel=1
pkgdesc="Language packs for Psi+"
arch=('any')
url="http://psi-plus.com"
license=('GPL2')
makedepends=('qt4')
depends=('psi-plus-git')
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
		lrelease-qt4 "$langfile"
	done
}

package() {
	cd psi-plus-l10n/translations

	install -v -dm755 "$pkgdir/usr/share/psi-plus/translations"
	install -v -m644 *.qm "$pkgdir/usr/share/psi-plus/translations"
}
