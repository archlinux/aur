# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>
# Contributor: Thomas td123 Dziedzic <gostrc@gmail.com>
# Contributor: Ivan c00kiemon5ter Kanakarakis <ivan.kanak@gmail.com>
# Contributor: jht <stefano@inventati.org>

pkgname=clips
pkgver=6.31
pkgrel=1
pkgdesc="A forward-chaining rule-based programming language written in C that also provides procedural and object-oriented programming facilities."
arch=('x86_64')
url="http://clipsrules.sourceforge.net/"
license=('GPL')
depends=('termcap' 'libxaw' 'xbitmaps')
source=("https://downloads.sourceforge.net/project/clipsrules/CLIPS/${pkgver}/${pkgname}_core_source_${pkgver//.}.tar.gz"
		"https://downloads.sourceforge.net/project/clipsrules/CLIPS/${pkgver}/${pkgname}_documentation_${pkgver//.}.tar.gz"
		"https://downloads.sourceforge.net/project/clipsrules/CLIPS/${pkgver}/examples_${pkgver//.}.tar.gz"
		"https://downloads.sourceforge.net/project/clipsrules/CLIPS/${pkgver}/feature_tests_${pkgver//.}.tar.gz")
sha256sums=('665b393f1dad63e95ce1ae696899298ef7da25e0d52a2d06c1046cddce07b398'
            '07c7205e4a8bfedc60b70539c95f7432ed97334a2eaf113d19b87155dedb8ebf'
            '00dbc8c60db5f62426a9483fc8ed0f1ac1157056cf5313bb07898d19502f9ab4'
            'fad33842efd4abbf713ad715746e53c09fcda0a4f1f2fd1aeccef5650c0aac10')

build() {
	cd "${pkgname}_core_source_${pkgver//.}/core"
	make
}

package() {
	install -Dm755 ${pkgname}_core_source_${pkgver//.}/core/clips \
		${pkgdir}/usr/bin/clips
	install -d "${pkgdir}/usr/share/${pkgname}"
	install -d "${pkgdir}/usr/share/doc/${pkgname}/pdf"
	cp ${pkgname}_documentation_${pkgver//.}/*.pdf \
		${pkgdir}/usr/share/doc/${pkgname}/pdf/
	cp -a examples_${pkgver//.} \
		${pkgdir}/usr/share/${pkgname}/examples
	cp -a feature_tests_${pkgver//.} \
		${pkgdir}/usr/share/${pkgname}/feature_tests
}
# vim:set ts=4 sw=4:
