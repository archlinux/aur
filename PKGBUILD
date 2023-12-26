# Maintainer: jlaunay
pkgname=waybar-updates-git
pkgver=0.2.10.r17.gb12e7df
pkgrel=1
pkgdesc="Tiny Waybar module to check Arch Linux updates from official repositories and AUR"
arch=('any')
url="https://github.com/L11R/waybar-updates"
license=("MIT")
depends=('bash' 'coreutils' 'pacman-contrib' 'gettext' 'curl' 'jq' 'libnotify')
provides=('waybar-updates')
source=("git+https://github.com/L11R/${pkgname/-git}.git")
sha256sums=('SKIP')

build() {
    cd "${pkgname/-git}"
    make all
}

pkgver() {
  cd "${pkgname/-git}"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${pkgname/-git}"
    make DESTDIR="$pkgdir/" PREFIX=/usr MANDIR=/usr/share/man install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

