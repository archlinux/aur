# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=latex-tuda-ci
pkgver=1.10
pkgrel=2
pkgdesc='TUDa-CI for LaTeX from Technische Universität Darmstadt'
arch=('any')
url='https://github.com/tudace/tuda_latex_templates'
license=('custom')
depends=('latex-tuda-ci-logos')
replaces=('latex-tuddesign' 'latex-tuddesign-thesis' 'latex-tuddesign-fonts')
source=("https://github.com/tudace/tuda_latex_templates/archive/v${pkgver}.tar.gz")
sha512sums=('96318585df1284f18f008a59cd6f81c80ac4adfc794c310e333e7a62e4dd0046004c819351a526220e7b2b44c88ae851ba5557c18b7b88b277ef035c441df495')

prepare() {
	chmod +x tuda_latex_templates-${pkgver}/addlicense.sh
}

build() {
	cd tuda_latex_templates-${pkgver}
	./addlicense.sh
}

package() {
    install -dm755 "${pkgdir}/usr/share/texmf/tex/latex/tuda-ci/"
    install -dm755 "${pkgdir}/usr/share/texmf/doc/latex/tuda-ci/"

    cd "${srcdir}/tuda_latex_templates-${pkgver}"
    install -Dm644 LICENSE_info "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -r example "${pkgdir}/usr/share/texmf/doc/latex/tuda-ci/"
    cp -r tex "${pkgdir}/usr/share/texmf/tex/latex/tuda-ci/"
}
