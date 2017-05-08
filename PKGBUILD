# Maintainer: Alexey Korobtsov <korobcoff@gmail.com>

pkgname=psi-l10n-git
pkgver=0.16_translations_20170508
pkgrel=1
pkgdesc="Language packs for Psi-git"
arch=('any')
url="http://psi.im"
license=('GPL2')
makedepends=('git' 'qt5-base')
depends=('psi-git')
options=('!strip' '!zipman')
source=('git://github.com/psi-im/psi-translations.git')
md5sums=('SKIP')

pkgver() {
echo  0.16_translations_$(date +"%Y%m%d")
}

build() {

	cd $srcdir/psi-translations
	for langfile in $(ls */*.ts); do
		lrelease-qt5 "$langfile"
	done
}

package() {
	mkdir $srcdir/dist
	cp $srcdir/psi-translations/*/*.qm $srcdir/dist
	cd $srcdir/dist

	install -v -dm755 "$pkgdir/usr/share/psi/translations"
	install -v -m644 *.qm "$pkgdir/usr/share/psi/translations"
}
