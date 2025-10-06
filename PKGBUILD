# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Alexey Stukalov <astukalov@gmail.com>

pkgname=smartgit
pkgver=24.1.5
_pkgver=$(echo "${pkgver//./_}" | cut -d_ -f -4)
pkgrel=1
pkgdesc='Git client with Hg and SVN support.'
arch=('any')
url="http://www.syntevo.com/smartgit"
license=('LicenseRef-custom')
depends=('desktop-file-utils' 'git' 'gtk3' 'which')
optdepends=('mercurial: hg repositories support')
replaces=('smartgithg')
source=("https://www.syntevo.com/downloads/${pkgname}/${pkgname}-linux-${_pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('62ab9e4dbc00f4a7171091b94de5a43f3ccdc809e7250d7e55062ca99292dbf2'
            'bb5665e9c93640b311dbe8b633da65e3c72a712a3dc9655c3274a3542a688a32')

package() {
    # Install licenses
    install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgname}/licenses"/* "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s /opt/${pkgname}/license.html "${pkgdir}/usr/share/licenses/${pkgname}"
    rmdir "${pkgname}/licenses"
    # Install application files
    install -d -m 755 "${pkgdir}/opt"
    mv "${pkgname}" "${pkgdir}/opt/${pkgname}"
    # Install desktop file
    install -D -m 644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    # Install icon files
    install -d -m 755 "${pkgdir}/usr/share/icons/hicolor"
    cd "${pkgdir}/usr/share/icons/hicolor"
    for _size in 32 48 64 128 256
    do
        install -d "${_size}x${_size}/apps"
        ln -s "/opt/${pkgname}/bin/smartgit-${_size}.png" "${_size}x${_size}/apps/${pkgname}.png"
    done
    # Add symlink to /usr/bin
    chmod 755 "${pkgdir}/opt/${pkgname}/bin/smartgit.sh"
    install -d -m 755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/bin/smartgit.sh" "${pkgdir}/usr/bin/${pkgname}"
}
