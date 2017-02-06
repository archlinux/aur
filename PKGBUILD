# Maintainer: archlinux.info:tdy

pkgname=mpv-notify-git
pkgver=r19.019e278
pkgrel=2
pkgdesc="Desktop notifications for the mpv media player"
arch=(any)
url=https://github.com/rohieb/mpv-notify
license=(MIT)
depends=(lua52-socket lua52-posix libnotify imagemagick)
install=$pkgname.install
source=($pkgname::git+https://github.com/rohieb/mpv-notify.git)
sha256sums=(SKIP)

pkgver() {
  cd $pkgname
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  cd $pkgname
  sed -n 4,22p notify.lua > COPYING
}

package() {
  cd $pkgname
  install notify.lua -m 644 -Dt "$pkgdir"/usr/share/${pkgname%-git}/
  install COPYING -m 644 -Dt "$pkgdir"/usr/share/licenses/$pkgname/
}
