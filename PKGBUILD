# Maintainer: Davi da Silva Böger <dsboger at gmail dot com>

pkgname=terminix-git
_pkgname=terminix
pkgver=0.60.1.r1.b8a4f7b
pkgrel=1
pkgdesc="A tiling terminal emulator based on GTK+ 3 (git master)"
arch=('x86_64')
url="http://github.com/gnunn1/terminix"
license=('MPL')
depends=('gtk3' 'vte3' 'dconf' 'gsettings-desktop-schemas' 'gtkd-dmd>=3.3.0')
optdepends=('python2-nautilus: for "Open Terminix Here" support in nautilus'\
            'vte3-notification: for desktop notifications support')
makedepends=('git' 'dmd' 'pkg-config')
provides=('terminix')
conflicts=('terminix')
source=('git+https://github.com/gnunn1/terminix')
sha512sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd ${_pkgname}
  chmod u+x autogen.sh
  ./autogen.sh
}

build() {
  cd ${_pkgname}
  ./configure --prefix=/usr
  make DCFLAGS='-O -inline -release -version=StdLoggerDisableTrace'
}

package() {
  cd ${_pkgname}
  make DESTDIR=${pkgdir} install
}

