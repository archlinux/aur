# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=chord
pkgname="${_pkgname}-bin"
pkgver=0.2.40
pkgrel=3
pkgdesc="Chord - A Modern Music Player"
arch=('x86_64')
url="https://github.com/PeterDing/chord"
license=('MIT')
conflicts=("${_pkgname}")
depends=(hicolor-icon-theme gcc-libs libxkbcommon dbus gtk3 alsa-lib glibc libxdamage at-spi2-core expat nspr mesa cairo libxcb \
  libxcomposite gdk-pixbuf2 libx11 libxfixes pango nodejs libdrm libxrandr libcups glib2 libxext nss)
options=()
source=("${_pkgname}-${pkgver}.pacman::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.pacman"
  "LICENSE::${url}/raw/master/LICENSE")
sha256sums=('5eaf015a5634c29b0dcf3192b226eaa96f7a247ccd23af366dffdd6204e41378'
            'aab9ba9322a4e18a0018d15f83b99c7b10d77d5e301579fc249efef89bc2836c')
package() {
    sed 's/Categories=Music/Categories=AudioVideo/g' -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    cp --parents -a {opt,usr} "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -rf "${pkgdir}/opt/chord/resources/app/node_modules/ajv/scripts/info" "${pkgdir}/opt/chord/resources/app/node_modules/sshpk/man/man1"
}