# Maintainer:  Yamada Hayao <hayao@fascode.net>

_pkgname="filezilla"
pkgname="${_pkgname}-bin"
pkgver="3.55.1"
pkgrel="1"
pkgdesc='Free, open source FTP, FTPS and SFTP client (Pre-built binary)'
arch=('i686' 'x86_64')
url='https://filezilla-project.org'
license=('GPL')
depends=('pugixml' 'wxgtk3' 'xdg-utils' 'gmp' 'gnutls' 'nettle' 'sqlite')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

# x86_64
source_x86_64=("https://download.filezilla-project.org/client/FileZilla_${pkgver}_x86_64-linux-gnu.tar.bz2")
sha512sums_x86_64=('45bfa2369e0440c9dd6cf42cf64884e806e45136e3af121231ba390b84f95294a1d72a01c73af19773f1f2c6e21d5e9911e4e6a89c6a2843a4fdf7696a20533e')

# i686
source_i686=("https://download.filezilla-project.org/client/FileZilla_${pkgver}_i686-linux-gnu.tar.bz2")
sha512sums_i686=('bc3b1cd4dde67378f20a427367565a65decda0ade17e90222239500fdb4ac08f6e6eec508fe8a0c409728de6d98169e76acd37f5b6f31be21601bd0a15f50340')


package() {
    mkdir -p "${pkgdir}/opt/" "${pkgdir}/usr/bin/"
    cp -r "${srcdir}/FileZilla3" "${pkgdir}/opt/"

    mv "${pkgdir}/opt/FileZilla3/share" "${pkgdir}/usr/"

    local _fullpath _filename _make_link
    function _make_link () {
        ln -s "${1}" "${2}"
        echo "Created symlink ${1} -> ${2}"
    }

    for _fullpath in "${pkgdir}/opt/FileZilla3/bin/"* ;do
        _filename="$(basename "${_fullpath}")"
        _make_link "/opt/FileZilla3/bin/${_filename}" "${pkgdir}/usr/bin/${_filename}" 
    done
}
