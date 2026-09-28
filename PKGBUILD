# Maintainer: Natsuki <299474069+iamanuclearwarhead@users.noreply.github.com>
pkgname=hyprquip-git
pkgver=0.1.0.r3.g6ea4897
pkgrel=1
pkgdesc="hyprland's official splash texts on any shell: desktop overlay, cli, hyprlock, waybar, fastfetch"
arch=('any')
url="https://github.com/iamanuclearwarhead/hyprquip"
license=('BSD-3-Clause')
depends=('bash' 'coreutils' 'sed')
optdepends=('quickshell: splash on the desktop'
            'hyprland: hyprquip --session reads the splash hyprland picked')
makedepends=('git')
provides=('hyprquip')
conflicts=('hyprquip')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$pkgname"
    DESTDIR="$pkgdir" PREFIX=/usr ./install.sh --system --no-service
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 data/LICENSE.hyprland "$pkgdir/usr/share/licenses/$pkgname/LICENSE.hyprland"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
