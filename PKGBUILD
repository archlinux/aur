# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: Madotsuki <madotsuki at cock dot li>

_pkgname=utox
_branch=develop
pkgname=$_pkgname-git
pkgver=0.16.1.r220.g5155b879
pkgrel=1
pkgdesc='Lightweight Tox client'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url='https://github.com/uTox/uTox'
license=('GPL3')
depends=('fontconfig'
         'libfilteraudio-git'
         'hicolor-icon-theme'
         'libdbus'
         'libxext'
         'libxrender'
         'openal'
         'toxcore>=1:0.2.1'
         'v4l-utils')
makedepends=('check' 'git')
optdepends=('gtk3: GTK file picker')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url#branch=$_branch")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  git submodule init
  git submodule update
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
