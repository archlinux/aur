# Maintainer: Ludovico Massaccesi <lmassach at gmail dot com>
pkgname=cosmic-ext-connected-git
pkgver=0.5.2.r5.ge18b9f9
pkgrel=1
pkgdesc="Cosmic extension for KDEConnect support"
arch=('x86_64')
url="https://github.com/nwxnw/cosmic-ext-connected"
license=('GPL-3.0-or-later')
depends=('cosmic-session'
         'kdeconnect'
         'gtk3'
         'openssl')
makedepends=('git' 'rust' 'cmake' 'just' 'sed') # 'typescript' 'findutils'
optdepends=()
provides=()
conflicts=()
source=('git+https://github.com/nwxnw/cosmic-ext-connected.git#branch=main')
sha256sums=('SKIP')

pkgver() {
  cd cosmic-ext-connected
  git describe --long --tags | sed -e 's/\([^-]*-g\)/r\1/;s/-/./g' -e 's/v\([0-9]\)/\1/g'
}

prepare() {
  cd cosmic-ext-connected
}

build() {
  cd cosmic-ext-connected
  cargo build --release
}

package() {
  cd cosmic-ext-connected
  mkdir -p "$pkgdir"/usr
  just prefix="$pkgdir/usr" install
}
