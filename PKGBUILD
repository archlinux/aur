# Maintainer: Vincent B. <vb@luminar.eu.org>
pkgname=titdb-git
_pkgname=trackpad-is-too-damn-big
pkgver=v1.0.0.r5.g78e3e47
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
            '9553f82b476c45a84c5f911b508adc39dbd28b2ed20f3e300f3c0c77c1a44fd3')

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
