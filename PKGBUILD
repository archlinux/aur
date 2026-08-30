# Maintainer: alexvermaning0 <alex.boot@outlook.com>
pkgname=openmediabridge-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="media bridge for Resonite VR with MPRIS, synced lyrics, OBS overlay and Discord status"
arch=('x86_64')
url="https://github.com/alexvermaning0/OpenMediaBridge"
license=('Apache-2.0')
depends=('playerctl')
provides=('openmediabridge')
conflicts=('openmediabridge')
options=('!strip')
source=("OpenMediaBridge-Linux.zip::https://github.com/alexvermaning0/OpenMediaBridge/releases/download/${pkgver}/OpenMediaBridge-Linux.zip"
        "LICENSE::https://raw.githubusercontent.com/alexvermaning0/OpenMediaBridge/${pkgver}/LICENSE")
sha256sums=('31a92af7e89507c78814d707905f7ad19eabbfad26ccf9446f7f8d182176a10b'
            '50e6751797c50dedd75ef1b8a0d9e42f5f8472e9fbce91f34718e9f97b0c780a')

package() {
    install -Dm755 "${srcdir}/OpenMediaBridge" "${pkgdir}/usr/lib/openmediabridge/OpenMediaBridge"
    install -Dm755 "${srcdir}/libe_sqlite3.so" "${pkgdir}/usr/lib/openmediabridge/libe_sqlite3.so"
    install -Dm644 "${srcdir}/LICENSE"         "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/openmediabridge" << 'EOF'
#!/bin/bash
export LD_LIBRARY_PATH="/usr/lib/openmediabridge${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
export OPENMEDIABRIDGE_DATA_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/openmediabridge"
exec /usr/lib/openmediabridge/OpenMediaBridge "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/openmediabridge"
}
