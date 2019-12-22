# Maintainer: Andre Schröder <andre.schroedr at gmail dot com>

# All my PKGBUILDs are managed at https://github.com/schra/pkgbuilds

pkgname=x11docker
pkgver=6.5.0
pkgrel=1
pkgdesc='Run GUI applications and desktops in Docker. Focus on security.'
arch=('any')
url='https://github.com/mviereck/x11docker'
license=('MIT')
install=x11docker.install

# these are the core and recommended dependencies from
# https://github.com/mviereck/x11docker/wiki/dependencies
depends=(bash docker xpra xorg-server-xephyr xorg-xinit xorg-xauth xclip
         xorg-xhost xorg-xrandr xorg-xdpyinfo)

optdepends=('cups: --printer support'
            'kwin: --kwin, --kwin-xwayland support'
            'nxagent: --nxagent support'
            'pulseaudio: --pulseaudio support'
            'weston: --weston, --xpra-xwayland, --weston-xwayland, --xdummy-xwayland support'
            'xdotool: --xpra-xwayland, --xdummy-xwayland support'
            'xorg-server-xvfb: --xvfb support'
            'xorg-server-xwayland: --xpra-xwayland, --weston-xwayland, --kwin-xwayland, --xwayland, --xdummy-xwayland support'
            'xorg-server: --xorg, --xdummy support')

source=(https://github.com/mviereck/x11docker/archive/v$pkgver.tar.gz)
sha256sums=(94d2140021b1473a8c7a4ba5a1eafba04d5ee984116bbb515ec6a0eb7d508f52)

package() {
  cd "$pkgname-$pkgver"

  # I don't use `x11docker --install` on purpose here since it wasn't designed
  # for packaging but rather for directly installing the program.

  # I don't install `x11docker-gui` since I don't use it and it depends on
  # another program that I had to package first.

  install -Dm755 x11docker              -t "$pkgdir/usr/bin"
  install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE.txt            -t "$pkgdir/usr/share/licenses/$pkgname"
}
