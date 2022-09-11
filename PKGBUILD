# Contributor: Anton Kudelin <kudelin at protonmail dot com>
# Maintainer: Pika Kolendo <pikakolendo02[a]gmail.c0m>
pkgname='multiwfn-dev-bin'
_PkgName='Multiwfn'
pkgver=3.8_dev20220903
_pkgver=3.8
pkgrel=1
pkgdesc="A program for realizing electronic wavefunction analysis, dev binary version"
arch=('x86_64')
url="http://sobereva.com/multiwfn"
license=('custom')
depends=('openmotif'
         'libglvnd')
provides=('multiwfn')
conflicts=('multiwfn-bin')
source=("${url}/misc/${_PkgName}_${_pkgver}_dev_bin_Linux.zip")
sha256sums=('d850827e874765494e0dd15382747da2489c3927b82edcebe96a21ab72ab82eb')

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/etc/profile.d"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -a "${srcdir}/${_PkgName}_${_pkgver}_dev_bin_Linux/"* "${pkgdir}/opt/${pkgname}"
    chmod +x "${pkgdir}/opt/${pkgname}/${_PkgName}"
    ln -s "/opt/${pkgname}/${_PkgName}" "${pkgdir}/usr/bin/${_PkgName}"
    ln -s "/opt/${pkgname}/${_PkgName}" "${pkgdir}/usr/bin/${pkgname%%-dev-bin}"
    ln -s "/opt/${pkgname}/settings.ini" "${pkgdir}/etc/multiwfn"
    echo "export Multiwfnpath=/opt/multiwfn-bin" > "${pkgdir}/etc/profile.d/${pkgname%%-dev-bin}.sh"
    cp -a "${srcdir}/${_PkgName}_${_pkgver}_dev_bin_Linux/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
