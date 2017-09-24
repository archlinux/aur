# Maintainer: Jose Riha <jose1711 gmail com>
_pkgname=slabikar
pkgname=latex-${_pkgname}-font
pkgver=1
pkgrel=2
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

md5sums=('a9fc4fd0c46e519ef0c750fb9ae3eeb4'
         'a88d137e93bde8f82fd906d16e5e7bf7'
         '2e90a35b1ad670787d4b08bb76f1fbd4'
         '59e208a02d98b9b3f4f7cbc37f158cde'
         '290903b3e0ca91dab6219f0f6e97cd65'
         '6a233dcd1330fb28201d58272bf9d6d8'
         '6fb7cac040ee2ccf8ef52bd3610c8688')

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
