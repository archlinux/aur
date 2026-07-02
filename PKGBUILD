# Maintainer: HighError <hierrorua@gmail.com>
pkgname=rudu-bin
_pkgname=rudu
pkgver=0.4.0
pkgrel=2
pkgdesc="Review PRs without losing your mind"
arch=('x86_64')
url="https://github.com/tanvesh01/rudu"
license=('MIT')
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'github-cli' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup3' 'webkit2gtk-4.1')
provides=('rudu')
conflicts=('rudu')
options=('!strip' '!debug')
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/rudu_${pkgver}_amd64.deb"
        "LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")
sha256sums=('ea4225765b6a7133362a6356086b57e89f41a81aed244ab081f7c54323d00490'
            '5058c91b5ccac3a734502456700d1b6d6a9fb31701b9ace706ebc2ec9cba4b14')

package() {
    cd "${srcdir}"
    ar x "${_pkgname}-${pkgver}.deb"
    bsdtar -xpf data.tar.* -C "${pkgdir}/"

    sed -i -e 's|^Categories=.*|Categories=Development;|' \
           -e 's|^Name=.*|Name=Rudu|' \
        "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
