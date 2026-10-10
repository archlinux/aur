# Maintainer: czyt <czytcn@gmail.com>
pkgname=con-bin
pkgver=0.1.0.beta.124
pkgrel=1
pkgdesc="The Native Terminal Emulator with a builtin AI Harness"
arch=('x86_64')
url="https://con.nowledge.co"
license=('MIT')
depends=('libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'gcc-libs')
provides=('con')
conflicts=('con')
options=('!strip')
_upstream_ver="0.1.0-beta.124"
source_x86_64=("con-${_upstream_ver}-linux-x86_64.tar.gz::https://github.com/nowledge-co/con-terminal/releases/download/v${_upstream_ver}/con-${_upstream_ver}-linux-x86_64.tar.gz")
sha256sums_x86_64=('8e0dfe2a9e7032ea8c2671f83f88e2c41c8f78cea5875e047f4ce119f56ca22a')

package() {
    cd "con-${_upstream_ver}-linux-x86_64"

    install -Dm755 con "${pkgdir}/usr/bin/con"
    install -Dm755 con-cli "${pkgdir}/usr/bin/con-cli"
    # Upstream ships the icon as co.nowledge.con.png, matching Icon= in the desktop entry
    install -Dm644 co.nowledge.con.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/co.nowledge.con.png"

    # Fix Exec path in desktop entry (upstream ships /usr/local/bin)
    sed 's|Exec=/usr/local/bin/con|Exec=/usr/bin/con|' co.nowledge.con.desktop \
        | install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/con.desktop"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/con-bin/LICENSE"
}
