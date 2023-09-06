# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>
# Contributor: Thomas td123 Dziedzic <gostrc@gmail.com>
# Contributor: Ivan c00kiemon5ter Kanakarakis <ivan.kanak@gmail.com>
# Contributor: jht <stefano@inventati.org>
pkgname=clips
pkgver=6.4.1
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
sha256sums=('aa4f3bb8b15964bf4734f365c9587e32996bddd3f50bfcf53b95154beae76ee3'
            '367ed086adbcd805cf31ab3fc8a8ce7e5b92d022f1da5d49eb86011b402a7c68'
            'bba83b6e38f671d4112c859f3007535b100610236e2da26412798bbef65a62fa'
            '4af5b8835b1881faf72c28c4d57252974077d6aa290598eb8e541a4f17d550ff')

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
