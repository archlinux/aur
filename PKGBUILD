# Maintainer: Pika Kolendo <pikakolendo02[a]gmail.c0m>
pkgname='multiwfn-bin'
_pkgname='Multiwfn'
pkgver=3.7
pkgrel=4
pkgdesc="A program for realizing electronic wavefunction analysis, stable binary version"
arch=('x86_64')
url="http://sobereva.com/multiwfn"
license=('custom')
depends=('openmotif'
         'libglvnd')
provides=('multiwfn')
install="${pkgname}.install"
backup=('etc/Multiwfn/settings.ini')
source=("${url}/misc/${_pkgname}_${pkgver}_bin_Linux.zip")
sha256sums=('7a6573e6e340a5b24b755b676fb23dd51649924ab5b65643778591c1589c68f7')

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/etc/${_pkgname}"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -a "${srcdir}/${_pkgname}_${pkgver}_bin_Linux/"* "${pkgdir}/opt/${pkgname}"
    mv "${pkgdir}/opt/${pkgname}/settings.ini" "${pkgdir}/etc/${_pkgname}/"
    chmod +x "${pkgdir}/opt/${pkgname}/${_pkgname}"
    cat << EOF > "${pkgdir}/usr/bin/${_pkgname}"
export KMP_STACKSIZE=200M
export Multiwfnpath=/etc/${_pkgname}
ulimit -s unlimited
/opt/${pkgname}/${_pkgname} "\$@"
EOF
    chmod +x "${pkgdir}/usr/bin/${_pkgname}"
    ln -s "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%%-bin}"
    cp -a "${srcdir}/${_pkgname}_${pkgver}_bin_Linux/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
