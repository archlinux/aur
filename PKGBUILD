pkgname=iastfyp
pkgver=1.1.0
pkgrel=1
pkgdesc="IaSTFyP - Ironically a Stress Test For Your PC (turtle + tkinter simulation)"
arch=('x86_64')
url="https://aur.archlinux.org/packages/iastfyp"
license=('GPL')

depends=('python' 'tk')
makedepends=('pyinstaller')

source=("iastfyp.py")

sha256sums=('SKIP')

options=(!debug)

build() {
    cd "$srcdir"

    pyinstaller \
        --noconfirm \
        --clean \
        --onefile \
        --name iastfyp \
        iastfyp.py
}

package() {
    cd "$srcdir"

    # install binary
    install -Dm755 "dist/iastfyp" "$pkgdir/usr/bin/iastfyp"

    # desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/iastfyp.desktop" << EOF
[Desktop Entry]
Name=IaSTFyP
Comment=Ironically a Stress Test For Your PC
Exec=iastfyp
Icon=utilities-system-monitor
Terminal=false
Type=Application
Categories=System;Utility;
EOF
}
