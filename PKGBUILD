# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Pascal Wittmann <mail@pascal-wittmann.de>

pkgname=latex-tuddesign-thesis
pkgver=0.0.20140703_B
pkgrel=4
pkgdesc='Corporate-design for LaTeX from Technische Universität Darmstadt'
arch=('any')
url='https://www.intern.tu-darmstadt.de/arbeitsmittel/corporate_design_vorlagen/index.de.jsp'
license=('custom')
depends=('texlive-core' 'latex-tuddesign' 'latex-tuddesign-fonts')
source=(local://${pkgname//dd/d}\_${pkgver//./}.zip
		affidavit.patch)
sha512sums=('8dff1b4896107b1b784b4b047546dd8f0a91f2caf4c97f8d3971af6c1800ba7f3198bc157c1d2cd702cdcf030d9509d12c5b5e65048b066cb7930be2b9dc1fee'
            'f9b45aa9b710aa3b359606f18c9980d5c9c8730e809ce6f07b6f4f7f8e08fd8ac1178dd4153fb39fe98740b0e0244b36eefbbf634767ee9008f8a14d64ddcbdf')

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
