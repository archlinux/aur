# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=mapbbcode-share-git
pkgver=2015.12.18
pkgrel=2
pkgdesc='Web backend for mapbbcode.'
arch=('any')
url='https://github.com/MapBBCode/share.mapbbcode.org'
license=('WTFPL' 'BSD-2' 'BSD-3' 'MIT')
source=("git+https://github.com/MapBBCode/share.mapbbcode.org.git")
sha256sums=('SKIP')
depends=('php')
makedepends=('git')
backup=('etc/webapps/mapbbcode-share-git/config.php')

package() {
    _srcdir="${srcdir}/share.mapbbcode.org"
    _pkgdirmain="${pkgdir}/usr/share/webapps/mapbbcode-share-git"
    _docdir="${pkgdir}/usr/share/doc/mapbbcode-share-git"
    _etcdir="${pkgdir}/etc/webapps/mapbbcode-share-git"

    install -d "${_pkgdirmain}"
    install -d "${pkgdir}/usr/share/doc/mapbbcode-share-git"

    for _file in $(ls "${_srcdir}"/*.php); do
        install -m644 ${_file} "${_pkgdirmain}/"
    done
    rm "${_pkgdirmain}/config.php"
    cp -r "${_srcdir}/formats" "${_pkgdirmain}/"
    cp -r "${_srcdir}/lib" "${_pkgdirmain}/"
    install -m644 "${_srcdir}/help.txt" "${_pkgdirmain}/help.txt"

    install -Dm644 "${_srcdir}/README.md" "${_docdir}/README.md"
    install -Dm644 "${_srcdir}/CHANGELOG.md" "${_docdir}/CHANGELOG.md"
    install -Dm644 "${_srcdir}/help.txt" "${_docdir}/help.txt"

    install -Dm644 "${_srcdir}/.htaccess" "${_etcdir}/apache.example.htaccess"
    install -Dm644 "${_srcdir}/.nginx-vhost.conf" "${_etcdir}/nginx.example.conf"
    install -Dm644 "${_srcdir}/config.php" "${_etcdir}/config.php"
    ln -s "/etc/webapps/mapbbcode-share-git/config.php" "${_pkgdirmain}/config.php"
}
