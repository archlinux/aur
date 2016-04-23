# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=showcase-git
pkgver=r6
pkgrel=1
pkgdesc='Fullscreen Kiosk application that rotating over a set of html pages'
arch=(i686 x86_64)
url='https://github.com/anatol/showcase'
license=(GPL2)
depends=(gtk3 webkit2gtk libyaml xorg-xinit xorg-server)
optdepends=('xf86-video-intel: for Intel based graphics')
makedepends=(git)
backup=(etc/showcase.yaml)
install=showcase.install
source=(git://github.com/anatol/showcase)
sha1sums=('SKIP')

pkgver() {
  cd showcase
  echo r$(git rev-list --count master)
}

build() {
  cd showcase
  make
}

package() {
  cd showcase
  make install DESTDIR="$pkgdir"
  install -Dm644 xinitrc "$pkgdir"/var/lib/showcase/.xinitrc
}
