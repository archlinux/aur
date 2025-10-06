# Maintainer: Lysec <itslysec@gmail.com>
# Co-Maintainer: Kevin <github@kev314.dev>

pkgname=noctalia-shell-git
pkgver=2.3.1.r16.g330eac0
pkgrel=1
pkgdesc="A sleek and minimal desktop shell thoughtfully crafted for Wayland, built with Quickshell. (git version)"
arch=('any')
url="https://github.com/noctalia-dev/noctalia-shell"
license=('MIT')

depends=(
  'quickshell'
  'ttf-roboto'
  'inter-font'
  'gpu-screen-recorder'
  'brightnessctl'
  'ddcutil'
)

optdepends=(
  'cliphist: For clipboard history support'
  'matugen-bin: Material You color scheme generation'
  'cava: Audio visualizer component'
  'wlsunset: For supporting NightLight'
)

makedepends=('git')

provides=('noctalia-shell')
conflicts=('noctalia-shell')

source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/noctalia-shell"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
  cd "$srcdir/noctalia-shell"

  # Install shell files to quickshell system config directory
  install -dm755 "$pkgdir/etc/xdg/quickshell/noctalia-shell"
  cp -r ./* "$pkgdir/etc/xdg/quickshell/noctalia-shell/"
}
