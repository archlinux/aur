# Maintainer: Fabian Piribauer <fabian.piribauer@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Original Carlos Silva <r3pek@r3pek.org>

pkgname=piper-git
pkgver=0.2.902.r16.g5a44f97
pkgrel=1
pkgdesc='Piper is a GUI interface to ratbagd, the system daemon for configurable mice'
arch=('i686' 'x86_64')
url='https://github.com/libratbag/piper'
license=('GPL')
depends=('python3' 'python-gobject>=3.0' 'libratbag' 'python-evdev' 'python-lxml' 'python-cairo')
makedepends=('meson')
options=(!emptydirs)
source=("${pkgname}::git+https://github.com/libratbag/piper.git")
sha256sums=('SKIP')
conflicts=('piper')
provides=('piper')

pkgver() {
  cd "${pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    meson builddir --prefix=/usr/
    ninja -C builddir
}

package() {
    cd "${srcdir}/${pkgname}"
    DESTDIR="${pkgdir}" ninja -C builddir install
}
