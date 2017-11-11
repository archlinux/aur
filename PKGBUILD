# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libyaml-git
pkgver=0.1.7.r44.g660242d
pkgrel=2
pkgdesc="C library for parsing and emitting YAML"
arch=('i686' 'x86_64')
url="https://pyyaml.org/wiki/LibYAML"
license=('MIT')
depends=('glibc')
makedepends=('git')
provides=('libyaml')
conflicts=('libyaml')
options=('staticlibs')
source=("git+https://github.com/yaml/libyaml.git")
sha256sums=('SKIP')


pkgver() {
  cd "libyaml"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "libyaml"

  ./bootstrap
  ./configure --prefix="/usr"
  make
}

check() {
  cd "libyaml"

  make check
}

package() {
  cd "libyaml"

  make DESTDIR="$pkgdir" install
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/libyaml/LICENSE"
}
