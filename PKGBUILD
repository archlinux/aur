# Maintainer: Pika Kolendo <pikakolendo02[a]gmail.c0m>
pkgname='multiwfn-dev-bin'
_pkgname='Multiwfn'
pkgver=3.8.20230504
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
install="${pkgname}.install"
backup=('etc/Multiwfn/settings.ini')
source=("${url}/misc/${_pkgname}_${_pkgver}_dev_bin_Linux.zip")
sha256sums=('08ee618a2badd23440bc730330dab2b9062eee38a4ecab53d30ce2b0919db5a7')

package() {
    export LC_ALL="zh_CN.UTF-8"
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/etc/${_pkgname}"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -a "${srcdir}/${_pkgname}_${_pkgver}_dev_bin_Linux/"* "${pkgdir}/opt/${pkgname}"
    mv "${pkgdir}/opt/${pkgname}/settings.ini" "${pkgdir}/etc/${_pkgname}/"
    chmod +x "${pkgdir}/opt/${pkgname}/${_pkgname}"
    cat << EOF > "${pkgdir}/usr/bin/${_pkgname}"
export OMP_STACKSIZE=200M
export Multiwfnpath=/etc/${_pkgname}
ulimit -s unlimited
/opt/${pkgname}/${_pkgname} "\$@"
EOF
    chmod +x "${pkgdir}/usr/bin/${_pkgname}"
    ln -s "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%%-dev-bin}"
    cp -a "${srcdir}/${_pkgname}_${_pkgver}_dev_bin_Linux/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
