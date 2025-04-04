# Maintainer: grufo <madmurphy333 AT gmail DOT com>
# Primary source: https://wiki.gnome.org/attachments/Projects(2f)GtkSourceView(2f)LanguageDefinitions/gnuplot.lang

pkgname='gedit-gnuplot'
pkgver='1.0.0'
pkgrel=1
pkgdesc='gnuplot color highlighting for gedit'
arch=('any')
url='https://wiki.gnome.org/Projects/GtkSourceView/LanguageDefinitions'
license=('GPL')
depends=('gedit')
source=('gnuplot.lang'
        'gp-files.patch')
sha256sums=('ffce11a5edbe0b0360090c5f039ff7e12d67844c7ae4f8936da357f19aa1cbc0'
            'df90b5e873ecba1c209b47532b2669ad119db43db493d7cc45e4606d686d4820')

prepare() {

	cd "${srcdir}"
	mkdir -p "${srcdir}/patched"
	cp "${srcdir}/gnuplot.lang" "${srcdir}/patched/gnuplot.lang"
	(cd "${srcdir}/patched" && patch < "${srcdir}/gp-files.patch")

}

package() {

	cd "${srcdir}"

	install -dm755 "${pkgdir}/usr/share/libgedit-gtksourceview-300"

	install -Dm644 "${srcdir}/patched/gnuplot.lang" \
		"${pkgdir}/usr/share/libgedit-gtksourceview-300/language-specs/gnuplot.lang"
}

