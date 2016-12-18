# Maintainer: Davi da Silva Böger <dsboger at gmail dot com>

pkgname=terminix-git
_pkgname=terminix
pkgver=1.4.0.rc3.r0.5ec4074
pkgrel=1
pkgdesc="A tiling terminal emulator based on GTK+ 3 (git master)"
arch=('x86_64')
url="http://github.com/gnunn1/terminix"
license=('MPL')
depends=('libx11' 'gtkd>=3.3.0' 'vte3' 'dconf' 'gsettings-desktop-schemas')
optdepends=('python2-nautilus: for "Open Terminix Here" support in nautilus'\
            'vte3-notification: for desktop notifications support'\
			'vte3-terminix-git: for notifications, triggers and badges support'
			'libsecret: for the password manager')
makedepends=('git' 'ldc')
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
  make DC='ldmd' DCFLAGS='-disable-linker-strip-dead -O -inline -release -version=StdLoggerDisableTrace'
}

package() {
  cd ${_pkgname}
  make DESTDIR=${pkgdir} install
}

