# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>
# Previous maintainer: Swift Geek <swiftgeek@gmail.com>

pkgname=earlyoom-git
pkgver=1.6.2.r35.g788fe49
pkgrel=1
pkgdesc="Early OOM Daemon for Linux"
arch=('i686' 'x86_64')
url="https://github.com/rfjakob/earlyoom"
license=('MIT')
depends=('glibc')
makedepends=('git' 'pandoc')
#checkdepends=('go')
provides=('earlyoom')
conflicts=('earlyoom')
backup=("etc/default/earlyoom")
source=("git+https://github.com/rfjakob/earlyoom.git")
sha256sums=('SKIP')


pkgver() {
  cd "earlyoom"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "earlyoom"

  make
}

check() {
  cd "earlyoom"

  #make test
}

package() {
  cd "earlyoom"

  make \
    DESTDIR="$pkgdir" \
    PREFIX="/usr" \
    earlyoom.service \
    install-bin \
    install-default \
    install-man
    # install
  install -Dm644 "earlyoom.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/earlyoom"
}
