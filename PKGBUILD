# Maintainer: Lysec <itslysec@gmail.com>
# Co-Maintainer: Kevin <github@kev314.dev>
pkgname=noctalia-shell-git
pkgver=2.3.1.r16.g330eac0
pkgrel=2
pkgdesc="A sleek and minimal desktop shell thoughtfully crafted for Wayland, built with Quickshell. (git version)"
arch=('any')
url="https://github.com/noctalia-dev/noctalia-shell"
license=('MIT')
depends=(
  'quickshell'
  'imagemagick'
  'gpu-screen-recorder'
  'brightnessctl'
)
optdepends=(
  'cliphist: For clipboard history support'
  'matugen: Material You color scheme generation'
  'cava: Audio visualizer component'
  'wlsunset: For supporting NightLight'
  'power-profiles-daemon: For power profile management'
  'ddcutil: For external display brightness control'
)
makedepends=('git')
provides=('noctalia-shell')
conflicts=('noctalia-shell')
install="${pkgname}.install"
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/noctalia-shell"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
  cd "$srcdir/noctalia-shell"
  
  install -dm755 "$pkgdir/etc/xdg/quickshell/noctalia-shell"
  cp -r ./* "$pkgdir/etc/xdg/quickshell/noctalia-shell/"
  
  install -Dm644 "Assets/Services/systemd/noctalia.service" \
    "$pkgdir/usr/lib/systemd/user/noctalia.service"
}
