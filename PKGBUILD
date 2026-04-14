pkgname=hyprlev-git
pkgver=r49.ed30c63
pkgrel=1
pkgdesc="Hyprlev Hyprland rice and configuration pack"
arch=('any')
url="https://github.com/Pikalev15/hyprlev"
license=('MIT')
depends=('bash')
makedepends=('git')
provides=('hyprlev')
conflicts=('hyprlev')

source=("git+https://github.com/Pikalev15/hyprlev.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/hyprlev"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/hyprlev"

    install -dm755 "$pkgdir/usr/share/hyprlev"
    cp -r * "$pkgdir/usr/share/hyprlev/"

    install -dm755 "$pkgdir/usr/bin"

    cat > "$pkgdir/usr/bin/hyprlev-install" << EOF
#!/bin/bash
cd /usr/share/hyprlev || exit 1
bash install.sh
EOF

    chmod +x "$pkgdir/usr/bin/hyprlev-install"
}
