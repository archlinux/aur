# Maintainer:  Yamada Hayao <hayao@fascode.net>

_pkgname=filezilla
pkgname="${_pkgname}-unstable-bin"
pkgver="3.54.0_rc1"
pkgrel="2"
pkgdesc='Free, open source FTP, FTPS and SFTP client (Pre-built binary)'
arch=('i686' 'x86_64')
url='https://filezilla-project.org'
license=('GPL')
depends=('pugixml' 'wxgtk3' 'xdg-utils' 'gmp' 'gnutls' 'nettle' 'sqlite')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

# x86_64
source_x86_64=("https://download.filezilla-project.org/client/FileZilla_${pkgver//_/-}_x86_64-linux-gnu.tar.bz2")
sha512sums_x86_64=('b40b5a041bd319e792bb615b07753ec620661b567a205c6fc067b7fb4c255234baa784fef6b9d2ac2fc503c0efa7e7f1e618f1faab9ffda7d2501c0e5f9a4c7a')

# i686
source_i686=("https://download.filezilla-project.org/client/FileZilla_${pkgver//_/-}_i686-linux-gnu.tar.bz2")
sha512sums_i686=('400b6968660097aa818eb10a218e95077ddb734a4761660e32e8ccec45f3c8ed4014958a7de6eb3bdb9b1f065ab904d6be3afe711d0ea0c4150c19ec067f3648')


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
