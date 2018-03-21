# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>

pkgname=psi-plus-l10n-git
pkgver=1.3.300.0.g60c134e
pkgrel=1
pkgdesc="Language packs for Psi+ (Qt 5.x build)"
arch=('any')
url="https://psi-plus.com"
license=('GPL2')
makedepends=('qt5-tools')
depends=('psi-plus-git')
conflicts=('psi-plus-l10n' 'psi-plus-l10n-qt5-git')
provides=("psi-plus-l10n=$pkgver" "psi-plus-l10n-qt5-git=$pkgver")
options=('!strip' '!zipman')
source=('git://github.com/psi-plus/psi-plus-l10n.git')
md5sums=('SKIP')

pkgver() {
	cd psi-plus-l10n
	
	git describe --long --tags | sed 's/^v//;s/-/./g'
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
