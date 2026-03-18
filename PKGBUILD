# Maintainer: Winícius Cota <winicius.cota@gmail.com>
pkgname=rofi-bitwarden
pkgver=1.0.0
pkgrel=1
pkgdesc="Bitwarden (rbw) plugin for rofi"
arch=('x86_64')
url="https://github.com/winiciuscota/rofi-bitwarden"
license=('MIT')
depends=('rofi' 'rbw' 'xclip' 'xdotool' 'bash' 'libnotify' 'xdg-utils' 'coreutils')
makedepends=('cmake' 'gcc' 'git')
source=("${pkgname}::git+https://github.com/winiciuscota/rofi-bitwarden.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    mkdir -p build
    cd build
    cmake ..
    make
}

package() {
    cd "$pkgname/build"

    install -Dm755 rbw.so "$pkgdir/usr/lib/rofi/rbw.so"
    install -Dm755 "$srcdir/$pkgname/rofi-bitwarden-helper" "$pkgdir/usr/local/bin/rofi-bitwarden-helper"

    install -Dm644 "$srcdir/$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/$pkgname/LICENSE"   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
