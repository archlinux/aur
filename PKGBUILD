# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>
# Contributor: Thomas td123 Dziedzic <gostrc@gmail.com>
# Contributor: Ivan c00kiemon5ter Kanakarakis <ivan.kanak@gmail.com>
# Contributor: jht <stefano@inventati.org>
pkgname=clips
pkgver=6.40
pkgrel=1
pkgdesc="A forward-chaining rule-based programming language written in C that also provides procedural and object-oriented programming facilities."
arch=('x86_64')
url="https://www.clipsrules.net/"
license=('GPL')
depends=('termcap' 'libxaw' 'xbitmaps')
source=("https://downloads.sourceforge.net/project/clipsrules/CLIPS/${pkgver}/${pkgname}_core_source_${pkgver//.}.tar.gz"
		"https://downloads.sourceforge.net/project/clipsrules/CLIPS/${pkgver}/${pkgname}_documentation_${pkgver//.}.tar.gz"
		"https://downloads.sourceforge.net/project/clipsrules/CLIPS/${pkgver}/${pkgname}_examples_${pkgver//.}.tar.gz"
        "https://downloads.sourceforge.net/project/clipsrules/CLIPS/${pkgver}/${pkgname}_feature_tests_${pkgver//.}.tar.gz")
sha256sums=('ad6037a6a5b5e55a2871b94abed58bb710acc443022cb19096d3b8fe83a125df'
            'f116816748dde1394b055ce7c919557e80cb40fbbc0649e03bf9122fc4d9955c'
            '743e82314c75ab9638717c3621a75a39b41c62d1feb6a56c498847b8389c66d6'
            '8354ed3e2bbc54b98df6cd1e48196d3f28f342296bb6551d4b598967ff254bdf')

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
	cp -a ${pkgname}_examples_${pkgver//.} \
		${pkgdir}/usr/share/${pkgname}/examples
	cp -a ${pkgname}_feature_tests_${pkgver//.} \
		${pkgdir}/usr/share/${pkgname}/feature_tests
}
# vim:set ts=4 sw=4 et:
