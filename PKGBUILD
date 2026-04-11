# Maintainer: NGDtuanh <ntanhpro1221@gmail.com>
pkgname=spine-trial
pkgver=4.3.64.beta
pkgrel=6
pkgdesc="2D skeletal animation tool by Esoteric Software (Trial)"
arch=('x86_64')
url="https://esotericsoftware.com"
license=('custom')
depends=('xorg-xrandr')
options=('!strip')
source=("SpineTrial.tar.gz::https://jp.esotericsoftware.com/launcher/linux"
        "spine_badge.svg::http://esotericsoftware.com/files/branding/spine_badge.svg")
sha256sums=('SKIP'
            'SKIP')

package() {
    install -dm755 "${pkgdir}/opt/spine-trial"
    cp -r "${srcdir}/SpineTrial/." "${pkgdir}/opt/spine-trial/"
    chmod +x "${pkgdir}/opt/spine-trial/SpineTrial.sh"

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/spine-trial" <<'EOF'
#!/bin/sh
exec /opt/spine-trial/SpineTrial.sh "$@"
EOF
    chmod +x "${pkgdir}/usr/bin/spine-trial"

    install -Dm644 "${srcdir}/spine_badge.svg" "${pkgdir}/usr/share/pixmaps/spine-trial.svg"

    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/spine-trial.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Spine Trial
Exec=spine-trial
Icon=spine-trial
Categories=Graphics;
EOF
}
