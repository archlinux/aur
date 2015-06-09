#Maintainer: Lone_Wolf <lonewolf@xs4all.nl>
# Contributor: Steven She <mintcoffee@gmail.com>
# Contributor: vbPadre <vbPadre@gmail.com>
pkgbase=cndrvcups-lb-cpca
pkgname=cndrvcups-lb-cpca
_pkgbase=cndrvcups-lb
pkgver=2.90
pkgrel=3
pkgdesc="cpca module for Canon UFR II /LIPSLX Printer Driver"
arch=('x86_64')
url="http://support-au.canon.com.au/contents/AU/EN/0100270808.html"
license=('custom')
depends=('cndrvcups-common-lb')
makedepends=('autoconf' 'automake')
conflicts=('cndrvcups-lb-bin' 'cndrvcups-lb<=2.90-2')
source=(Linux_UFRII_PrinterDriver_V290_uk_EN.tar.gz::'http://pdisp01.c-wss.com/gdl/WWUFORedirectTarget.do?id=MDEwMDAwMjcwODEx&cmp=ABS&lang=EN')
options=('!emptydirs' '!strip' '!libtool')
sha512sums=('23181155f5719fa0a9c216c058be749b5faaa8ee745d260eba2e5e284ef4ff161e344289a7c301a2d74cc919c5031763b0daf41cd07686cfdce188492a9b34b2')
         
# build instructions are adapted from upstream cndrvcups-lb.spec file
prepare() {
    cd "${srcdir}"/Linux_UFRII_PrinterDriver_V290_uk_EN/Sources
    tar xf "${_pkgbase}"-"${pkgver}"-1.tar.gz -C "${srcdir}"
}

build() {
    
    cd "${srcdir}"/"${_pkgbase}"-"${pkgver}"/cpca
    autoreconf -fi
    ./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --libdir=/usr/lib
    make
}

package() {
    
    cd "${srcdir}"/"${_pkgbase}"-"${pkgver}"/cpca  
    make install DESTDIR="${pkgdir}"

    install -m755 -d "${pkgdir}"/usr/share/licenses/"${pkgname}"
    install -m644 "${srcdir}"/"${_pkgbase}"-"${pkgver}"/L*-ufr2-"${pkgver}"* "${pkgdir}"/usr/share/licenses/"${pkgname}/"

    install -m644 "${srcdir}"/"${_pkgbase}"-"${pkgver}"/LICENSE-lipslx-"${pkgver}".txt "${pkgdir}"/usr/share/licenses/"${pkgname}/"
}    
