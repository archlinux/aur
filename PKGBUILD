# Maintainer: Ludovico Massaccesi <lmassach at gmail dot com>
pkgname=cosmic-ext-connected-git
pkgver=0.2.0.r2.g6ed71ef
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
source=('git+https://github.com/nwxnw/cosmic-ext-connected.git#branch=main'
        '00_iced_runtime.patch')
sha256sums=('SKIP'
            'facfda21e0030c7231f169d4aad209de0a444ee9b4369a6443d5ad1fe6fd7dac')

pkgver() {
  cd cosmic-ext-connected
  git describe --long --tags | sed -e 's/\([^-]*-g\)/r\1/;s/-/./g' -e 's/v\([0-9]\)/\1/g'
}

prepare() {
  cd cosmic-ext-connected
  patch -Np1 -i ../00_iced_runtime.patch
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
