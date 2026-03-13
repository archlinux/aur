# Maintainer: aksr <aksr at t-com dot me>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: Sven Schneider <archlinux.sandmann@googlemail.com>
# Contributor: Thomas td123 Dziedzic <gostrc@gmail.com>
# Contributor: Ivan c00kiemon5ter Kanakarakis <ivan.kanak@gmail.com>
# Contributor: jht <stefano@inventati.org>
pkgname=clips
pkgver=6.4.2
pkgrel=1
pkgdesc='A forward-chaining rule-based programming language written in C that also provides procedural and object-oriented programming facilities.'
arch=('x86_64')
url='https://www.clipsrules.net/'
license=('MIT')
depends=('termcap' 'libxaw' 'xbitmaps')
source=("https://downloads.sourceforge.net/project/clipsrules/CLIPS/${pkgver}/${pkgname}_core_source_${pkgver//.}.tar.gz"
        "https://downloads.sourceforge.net/project/clipsrules/CLIPS/${pkgver}/${pkgname}_documentation_${pkgver//.}.tar.gz"
        "https://downloads.sourceforge.net/project/clipsrules/CLIPS/${pkgver}/${pkgname}_examples_${pkgver//.}.tar.gz"
        "https://downloads.sourceforge.net/project/clipsrules/CLIPS/${pkgver}/${pkgname}_feature_tests_${pkgver//.}.tar.gz")
sha256sums=('608a1eb2fc6e9caff30d63d684095f0bca7108f2294d21ee6f5617427c10455a'
            '999cde999d918671847a44b2981711f7ef0d614effed16e8e70ca8617a5fe605'
            '0d19ee82765de7fff605029ec51ac0c4423555a181f46404f926db8e467a97a4'
            'ec4fb738029380bf57cae9969a39c9f5a3fd2d09d8275e633190ec6b1d9841e6')

build() {
	cd "${pkgname}_core_source_${pkgver//.}/core"
	make
}

package() {
	install -D -m755 ${pkgname}_core_source_${pkgver//.}/core/clips $pkgdir/usr/bin/clips
	mkdir -p $pkgdir/usr/share/{$pkgname/examples/,doc/$pkgname/pdf}
	install -D -m644 "${pkgname}_documentation_${pkgver//.}/"*.pdf "$pkgdir/usr/share/doc/$pkgname"/pdf/
	cp -a ${pkgname}_examples_${pkgver//.}/* $pkgdir/usr/share/$pkgname/examples
	cp -a ${pkgname}_feature_tests_${pkgver//.} $pkgdir/usr/share/$pkgname/feature_tests
}
