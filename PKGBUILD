# Maintainer: Dunky <braxtinmoss13@gmail.com>

pkgname=rofi-kaomoji
pkgver=r17.e3bbf20
pkgrel=1
pkgdesc="Browse and copy kaomojis using rofi"
arch=('any')
url="https://github.com/Seme4eg/rofi-kaomoji"
license=('MIT')
depends=('rofi' 'wl-clipboard')
makedepends=('git')
provides=('rofi-kaomoji')
conflicts=('rofi-kaomoji')
source=("git+https://github.com/Seme4eg/rofi-kaomoji.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    # Fix hardcoded path to KAOMOJIS.md so it works when installed system-wide
    sed -i 's|moji_path="$(dirname "$0")/KAOMOJIS.md"|moji_path="/usr/share/rofi-kaomoji/KAOMOJIS.md"|' rofi-kaomoji
}

package() {
    cd "$pkgname"
    install -Dm755 rofi-kaomoji "$pkgdir/usr/bin/rofi-kaomoji"
    install -Dm644 KAOMOJIS.md "$pkgdir/usr/share/rofi-kaomoji/KAOMOJIS.md"
    install -Dm644 README.org "$pkgdir/usr/share/doc/$pkgname/README.org"
}
