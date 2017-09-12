# Maintainer: Jose Riha <jose1711 gmail com>
_pkgname=slabikar
pkgname=latex-${_pkgname}-font
pkgver=1
pkgrel=1
pkgdesc="Handwritten Czech/Slovak font slabikar"
arch=('any')
url="http://petr.olsak.net/ftp/olsak/slabikar/"
license=('LPPL')
depends=('texlive-core')
install="${pkgname}.install"
base_url="http://petr.olsak.net/ftp/olsak/slabikar/"
source=("${base_url}README"
        "${base_url}slabi.pdf"
        "${base_url}slabi.tex"
        "${base_url}slabikar.mf"
        "${base_url}slabikar.pfb"
        "${base_url}slabikar.tfm"
        "${base_url}ukazka.tex"
	)

md5sums=('5a5f423bc814a89b204158021e3ccfef'
         '595f74f20f5d6ab0fcb6511c44cdeeae'
         'a94fdeb01142c6bae60ac51627a5b5ab'
         '42952a0c246cd675e2de43098e95df33'
         '77f82f966e1877c86aa783b118ffe8fa'
         'ab2941416f6c883b1dd2c040abaa8357'
         '990def34b958b28acfb511f31bd78d2d')

prepare() {
	cd $srcdir
	recode latin2..utf8 ukazka.tex
	sed -i '1,3d' ukazka.tex
}

package() {
    cd $srcdir
    install -Dm644 slabikar.mf ${pkgdir}/usr/share/texmf-dist/fonts/source/public/${_pkgname}/slabikar.mf
    install -Dm644 slabikar.tfm ${pkgdir}/usr/share/texmf-dist/fonts/tfm/public/${_pkgname}/slabikar.tfm
    install -Dm644 slabikar.pfb ${pkgdir}/usr/share/texmf-dist/fonts/type1/public/${_pkgname}/slabikar.pfb
    install -d ${pkgdir}/usr/share/doc/${_pkgname}
    install -Dm644 ukazka.tex slabi.pdf README ${pkgdir}/usr/share/doc/${_pkgname}/
}
