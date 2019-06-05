# Maintainer: Philipp Schaffrath <aur at philipp dot schaffrath dot email>

pkgname=giph-git
pkgver=v1.0.r0.gd7eccda
pkgrel=1
pkgdesc='gif recorder that records the desktop, a window or a selection'
url='https://github.com/phisch/giph'
license=('MIT')
arch=('any')
depends=('bash' 'ffmpeg' 'xdotool')
optdepends=('slop: for interactive selection'
            'libnotify: for error and success notifications')
makedepends=('git')
provides=('giph')
conflicts=('giph')
source=("$pkgname::git://github.com/phisch/giph.git")
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
    make DESTDIR="${pkgdir}" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}