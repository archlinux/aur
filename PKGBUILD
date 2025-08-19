# Maintainer: Samuobe samuobe@ik.me

pkgname=arch-store
pkgver=2.0.0
pkgrel=1
pkgdesc="A graphical app for managing your programs with pacman, AUR, flatpak, and appimage"
arch=('any')
license=('GPL3')
depends=('python' 'python-pyqt6')
makedepends=('git' 'python-setuptools')
source=("https://github.com/Samuobe/Arch-Store/archive/refs/tags/V2.0.0.tar.gz")
md5sums=('SKIP')

package() {
    install -d "$pkgdir/usr/share/arch-store"
    cp -r "$srcdir/Arch-Store-$pkgver/"* "$pkgdir/usr/share/arch-store/"

    install -dm1777 "$pkgdir/usr/local/share/arch-store/data"

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/arch-store" <<EOF
#!/bin/sh
exec python3 /usr/share/arch-store/main.py "\$@"
EOF

    install -Dm644 "$srcdir/Arch-Store-$pkgver/icon.png" "$pkgdir/usr/share/pixmaps/arch-store.png"
    install -Dm644 "$srcdir/Arch-Store-$pkgver/arch-store.desktop" "$pkgdir/usr/share/applications/arch-store.desktop"
}
