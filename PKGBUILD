# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=helvum-git
pkgver=0.1.0.r13.g3fccff0
pkgrel=1
pkgdesc='GTK-based patchbay for pipewire, inspired by the JACK tool catia'
arch=('x86_64' 'aarch64')
url='https://gitlab.freedesktop.org/ryuukyu/helvum'
license=('GPL3')
depends=('gtk4' 'pipewire')
makedepends=('git' 'rust')
provides=('helvum')
conflicts=('helvum')
source=('git+https://gitlab.freedesktop.org/ryuukyu/helvum.git')
sha256sums=('SKIP')

pkgver() {
  cd helvum
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd helvum

  cargo update
  cargo build \
    --release
}

package() {
  cd helvum

  cargo install \
    --no-track \
    --root "$pkgdir/usr" \
    --path "$srcdir/helvum"
}
