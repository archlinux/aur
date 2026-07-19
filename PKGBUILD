# Maintainer: oversea-suite
pkgname=guierm-git
pkgver=r2.04819ac
pkgrel=1
pkgdesc="GUI frontend for GERM (GEneral Resource Monitor)"
arch=('any')
url="https://github.com/oversea-suite/guierm"
license=('LGPLv2.1')
depends=('python' 'python-pyqt6' 'probed')
optdepends=('germ: for the CLI')
provides=('guierm')
conflicts=('guierm')
source=("guierm-source::git+https://github.com/oversea-suite/guierm.git")
sha256sums=('SKIP')

pkgver() {
    cd guierm-source
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd guierm-source
    install -Dm644 guierm.py     "$pkgdir/usr/lib/guierm/guierm.py"
    install -Dm644 mainwindow.py "$pkgdir/usr/lib/guierm/mainwindow.py"
    install -Dm644 mainwindow.ui "$pkgdir/usr/lib/guierm/mainwindow.ui"

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/guierm" <<'EOF'
#!/bin/sh
exec python /usr/lib/guierm/guierm.py "$@"
EOF

    install -Dm644 guierm.desktop "$pkgdir/usr/share/applications/guierm.desktop"
}
