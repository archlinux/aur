# Maintainer: SyreeseOfficial <syreeseofficial@gmail.com>
pkgname=spordle-git
pkgver=r1.0000000
pkgrel=1
pkgdesc="Multi-game Spanish language practice CLI"
arch=('any')
url="https://github.com/SyreeseOfficial/Spordle"
license=('MIT')
depends=('python' 'alsa-utils')
makedepends=('git')
provides=('spordle')
conflicts=('spordle')
source=("$pkgname::git+https://github.com/SyreeseOfficial/Spordle.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"

    install -dm755 "$pkgdir/usr/lib/spordle"
    cp -r games data spordle.py "$pkgdir/usr/lib/spordle/"

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/spordle" << 'EOF'
#!/bin/bash
exec python3 /usr/lib/spordle/spordle.py "$@"
EOF
}
