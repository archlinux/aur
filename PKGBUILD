# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Pascal Wittmann <mail@pascal-wittmann.de>

pkgname=latex-tuddesign-thesis
pkgver=0.0.20140703_B
pkgrel=3
pkgdesc='Corporate-design for LaTeX from Technische Universität Darmstadt'
arch=('any')
url='https://www.intern.tu-darmstadt.de/arbeitsmittel/corporate_design_vorlagen/index.de.jsp'
license=('custom')
depends=('texlive-core' 'latex-tuddesign' 'latex-tuddesign-fonts')
source=(local://${pkgname//dd/d}\_${pkgver//./}.zip
		affidavit.patch)
sha512sums=('8dff1b4896107b1b784b4b047546dd8f0a91f2caf4c97f8d3971af6c1800ba7f3198bc157c1d2cd702cdcf030d9509d12c5b5e65048b066cb7930be2b9dc1fee'
            'bf8f69d77047cd88501ce2c9ec894fb3c949f665a827c3e2cdfdb5f5dac922c54dab71de3693fab417b1492d8c4bba77cfaf5d03018febabda6203cfb585161e')

prepare() {
	cd ${pkgname//dd/d}_${pkgver//./}
	patch -p1 < "${srcdir}/affidavit.patch"
}

package() {
    cd ${pkgname//dd/d}_${pkgver//./}/texmf
    install -dm755 "${pkgdir}/usr/share/texmf/"

    for subdir in doc tex; do
        cp -r ${subdir} "${pkgdir}/usr/share/texmf/"
    done

    cd "${pkgdir}/usr/share/texmf"
    find . -type d -exec chmod 755 {} \;
    find . -type f -exec chmod 644 {} \;
}
