pkgname=hyprlev-git
pkgver=0.01.5
pkgrel=1
pkgdesc="Hyprlev Hyprland rice and configuration pack"
arch=('any')
url="https://github.com/Pikalev15/hyprlev"
license=('GPL-3.0')
depends=('bash')
makedepends=('git')
provides=('hyprlev')
conflicts=('hyprlev')

install=hyprlev-git.install
source=("git+https://github.com/Pikalev15/hyprlev.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/hyprlev"
    git describe --tags --abbrev=0 | sed 's/^v//'
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
