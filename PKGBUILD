# Maintainer: Testudo Aquatilis
pkgname=nagelfar
_pkgver_main=1
_pkgver_sub=2
_pkgver_subsub=4
pkgver="${_pkgver_main}.${_pkgver_sub}.${_pkgver_subsub}"
_pkgver="${_pkgver_main}${_pkgver_sub}${_pkgver_subsub}"
pkgrel=1
epoch=
pkgdesc="Tcl syntax checker"
arch=('any')
url="http://nagelfar.sourceforge.net/"
license=('GPL')
groups=()
depends=("tcl")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://downloads.sourceforge.net/nagelfar/Rel_${_pkgver}/${pkgname}${_pkgver}.tar.gz")
noextract=()
md5sums=("bbc6e0ab459bdafcc322e3e956edadf4")
validpgpkeys=()

package() {
    # lib
    lib_path="/usr/lib/${pkgname}"
    install -d -m755 "${pkgdir}/${lib_path}"

    # textsearch package
    for file_path in "lib/textsearch/tcl/textsearch.tcl" "lib/textsearch/pkgIndex.tcl" ; do
        install -D -m644 "${srcdir}/${pkgname}${_pkgver}/${file_path}" "${pkgdir}${lib_path}/${file_path}"
    done

    # packagedb
    for file in "${srcdir}/${pkgname}${_pkgver}/packagedb"/* ; do
        install -D -t "${pkgdir}${lib_path}/packagedb" -m644 "${file}"
    done

    # syntax stuff
    for file in "${srcdir}/${pkgname}${_pkgver}"/{syntax*.tcl,*.syntax} ; do
        install -D -t "${pkgdir}${lib_path}" -m644 "${file}"
    done

    # main
    file="nagelfar.tcl"
    install -D -m755 "${srcdir}/${pkgname}${_pkgver}/${file}" "${pkgdir}${lib_path}/${file}"

    # doc
    doc_path="/usr/share/doc/${pkgname}"
    install -d -m755 "${pkgdir}/${doc_path}"

    for file in "${srcdir}/${pkgname}${_pkgver}/doc"/* ; do
        install -D -t "${pkgdir}${doc_path}/doc" -m644 "${file}"
    done

    # license
    lic_path="/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/${lic_path}"

    file_path="COPYING"
    install -D -m644 "${srcdir}/${pkgname}${_pkgver}/${file_path}" "${pkgdir}${lic_path}/${file_path}"

    # binary
    install -d -m755 "${pkgdir}/usr/bin"
    cd "${pkgdir}/usr/bin"
    ln -s "../lib/${pkgname}/${pkgname}.tcl" "${pkgname}"
}
