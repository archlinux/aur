# Maintainer: Christopher Fair <christopherpatrickfair@gmail.com>

pkgname=triplea
_tag=2026-11.16.15918
pkgver=2026.11.16.15918
pkgrel=1
pkgdesc='An online multiplayer turn based strategy game and board game engine.'
arch=('any')
_appname='game-headed'
url='https://triplea-game.org/'
license=('GPL-3.0-or-later')
install=${pkgname}.install
depends=('gtk-update-icon-cache' 'java-runtime')
source=("${pkgname}-${_tag}.zip::https://github.com/triplea-game/triplea/releases/download/${_tag}/${_appname}.zip")
sha256sums=('6dfeaf541c3401bb88ab94be66eb77cb25791315f6e1bfa67fed0c97d146b275')

package() {
    install -d "${pkgdir}/usr/share/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    cp -a "${srcdir}/bin" "${pkgdir}/usr/share/${pkgname}/"
    cp -a "${srcdir}/assets" "${pkgdir}/usr/share/${pkgname}/"
    install -Dm644 "${srcdir}/.triplea-root" "${pkgdir}/usr/share/${pkgname}/.triplea-root"

    cat > "${pkgdir}/usr/bin/triplea" << EOF
#!/usr/bin/bash
cd /usr/share/${pkgname}
exec java -jar /usr/share/${pkgname}/bin/${_appname}-${_tag}.jar "\$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/triplea"
}
