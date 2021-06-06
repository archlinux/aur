# Maintainer:  Yamada Hayao <hayao@fascode.net>

_pkgname="filezilla"
pkgname="${_pkgname}-bin"
pkgver="3.54.1"
pkgrel="2"
pkgdesc='Free, open source FTP, FTPS and SFTP client (Pre-built binary)'
arch=('i686' 'x86_64')
url='https://filezilla-project.org'
license=('GPL')
depends=('pugixml' 'wxgtk3' 'xdg-utils' 'gmp' 'gnutls' 'nettle' 'sqlite')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

# x86_64
source_x86_64=("https://download.filezilla-project.org/client/FileZilla_${pkgver}_x86_64-linux-gnu.tar.bz2")
sha512sums_x86_64=('034cb3a2d7258437e3a8b2193c342f818183bf25388b83cb1f5a7b4f81dbe27c67f1d32b5060de60628147ff214fbe0d2f392d4294c7ecbca9d3bcc701da0029')

# i686
source_i686=("https://download.filezilla-project.org/client/FileZilla_${pkgver}_i686-linux-gnu.tar.bz2")
sha512sums_i686=('f0f5c54e9e3d630b75f353a1bde8da40eee1a24deb3ae3663cb1c2a9c5946e96bdd7fbdedc6fd259fa4a3665968960dec241dd7301b489306bc9f1dcf40262f1')


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
