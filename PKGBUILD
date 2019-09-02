# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=latex-tuda-ci
pkgver=1.01
pkgrel=2
pkgdesc='TUDa-CI for LaTeX from Technische Universität Darmstadt'
arch=('any')
url='https://github.com/tudace/tuda_latex_templates'
license=('custom')
depends=('latex-tuda-ci-logos')
replaces=('latex-tuddesign' 'latex-tuddesign-thesis' 'latex-tuddesign-fonts')
source=("https://github.com/tudace/tuda_latex_templates/archive/v${pkgver}.tar.gz")
sha512sums=('27ae601c7d644a36917430e7638babd59514e2e9cea51fd0ed1de22ffbb9b9c0599381eb7a9e581ca29a9f673fbd22cc81cb17a3de6331b09d2b75b6485c57b3')

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

    cd "${srcdir}/tuda_latex_templates-1.01"
    install -Dm644 LICENSE_info "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -r example "${pkgdir}/usr/share/texmf/doc/latex/tuda-ci/"
    cp -r tex "${pkgdir}/usr/share/texmf/tex/latex/tuda-ci/"
}
