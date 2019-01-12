# Maintainer: Brian Clemens <brian@tiuxo.com>

pkgname=zerotier-one-git
pkgver=1.2.12
pkgrel=1
pkgdesc="Creates virtual Ethernet networks of almost unlimited size."
arch=('x86_64')
url="https://www.zerotier.com/index.html"
license=('GPL3')
depends=('gcc-libs' 'libnatpmp' 'miniupnpc')
makedepends=('ruby-ronn')
conflicts=('zerotier-one')
source=("git+git://github.com/zerotier/ZeroTierOne.git")
sha512sums=('SKIP')

prepare() {
  cd ZeroTierOne
  sed -i 's/sbin/bin/' make-linux.mk debian/zerotier-one.service
}

build() {
  cd ZeroTierOne
  make
}

check() {
  cd ZeroTierOne
  make selftest
  ./zerotier-selftest
}

package() {
  cd ZeroTierOne
  make DESTDIR="$pkgdir" install
  install -Dm644 debian/zerotier-one.service "$pkgdir"/usr/lib/systemd/system/zerotier-one.service
}

