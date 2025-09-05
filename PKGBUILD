# Maintainer: Vincent B. <vb@luminar.eu.org>
pkgname=titdb-git
_pkgname=trackpad-is-too-damn-big
pkgver=v1.0.0.r6.gb4397dc
pkgrel=1
epoch=
pkgdesc="Trackpad Is Too Damn Big (TITDB) is a utility designed to customize trackpad behavior on Linux"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/tascvh/trackpad-is-too-damn-big"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('git+https://github.com/tascvh/trackpad-is-too-damn-big'
        titdb.service)
sha256sums=('SKIP'
            'b0ce5607bd4aa5e09128c9a182819c67a357188db5d6d15c3f3a41e04c74361f')

noextract=()

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"

  git submodule init
  git submodule update
}

build() {
  cd "$srcdir/$_pkgname"

  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  cmake --build .
}

package() {
  cd "$srcdir/$_pkgname"

  install -D -m755 build/titdb "$pkgdir/usr/bin/titdb"
  install -D -m644 "$srcdir/titdb.service" "$pkgdir/usr/lib/systemd/system/titdb.service"
}

# vim:set ts=2 sw=2 et:
