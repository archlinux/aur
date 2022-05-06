# Maintainer: Philipp Schaffrath <philipp dot schaffrath at gmail dot com>

pkgname=giph-git
pkgver=1.1.1.r6.g6cee978
pkgrel=1
pkgdesc='video recorder that records the desktop, a window or a selection'
url='https://github.com/phisch/giph'
license=('MIT')
arch=('any')
depends=('bash' 'ffmpeg' 'xdotool')
optdepends=('slop: for interactive selection'
            'libnotify: for error and success notifications'
            'procps-ng: for pgrep used in the --stop flag')
makedepends=('git')
provides=('giph')
conflicts=('giph')
source=("$pkgname::git+https://github.com/phisch/giph.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
    cd "$pkgname"
    make DESTDIR="${pkgdir}" PREFIX="/usr" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}