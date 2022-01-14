# Contributor: Anton Kudelin <kudelin at protonmail dot com>
# Maintainer: Pika Kolendo <pikakolendo02[a]gmail.c0m>
pkgname='multiwfn-bin'
_PkgName='Multiwfn'
pkgver=3.7
pkgrel=1
pkgdesc="A program for realizing electronic wavefunction analysis, stable binary version"
arch=('x86_64')
url="http://sobereva.com/multiwfn"
license=('custom')
depends=('openmotif'
         'libglvnd')
provides=('multiwfn')
source=("${url}/misc/${_PkgName}_${pkgver}_bin_Linux.zip")
sha256sums=('7a6573e6e340a5b24b755b676fb23dd51649924ab5b65643778591c1589c68f7')

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/etc/profile.d"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -a "${srcdir}/${_PkgName}_${pkgver}_bin_Linux/"* "${pkgdir}/opt/${pkgname}"
    chmod +x "${pkgdir}/opt/${pkgname}/${_PkgName}"
    ln -s "/opt/${pkgname}/${_PkgName}" "${pkgdir}/usr/bin/${_PkgName}"
    ln -s "/opt/${pkgname}/${_PkgName}" "${pkgdir}/usr/bin/${pkgname%%-bin}"
    ln -s "/opt/${pkgname}/settings.ini" "${pkgdir}/etc/multiwfn"
    echo "export Multiwfnpath=/opt/multiwfn-bin" > "${pkgdir}/etc/profile.d/${pkgname%%-bin}.sh"
    cp -a "${srcdir}/${_PkgName}_${pkgver}_bin_Linux/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    echo '
> please add this line to your .bashrc
[ -r /etc/profile.d/multiwfn.sh ] && . /etc/profile.d/multiwfn.sh
'
}
