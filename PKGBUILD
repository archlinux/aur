# Maintainer:  Yamada Hayao <hayao@fascode.net>

_pkgname="filezilla"
pkgname="${_pkgname}-bin"
pkgver="3.55.0"
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
sha512sums_x86_64=('b9b78f385c7cafc2ab5df494b531547e3a883532163a97452a177470e0ae5f39837b3f69921f00a51d8c848f0a33643eb1bfe9f62336806d2d5e28e40de8bf49')

# i686
source_i686=("https://download.filezilla-project.org/client/FileZilla_${pkgver}_i686-linux-gnu.tar.bz2")
sha512sums_i686=('c2e60602a06e1b09f9a02a9f780011ae4481ffe2ac9cb4aeefafe4e75905bbc935013c9853d204f2e9b9914f6b9cc6f833eaba9e9f6b50c7c5180c5499668c8a')


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
