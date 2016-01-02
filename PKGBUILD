##
# Maintainer: pyamsoft <pyam(dot)soft(at)gmail(dot)com>
##

pkgname=pstate-frequency
pkgdesc="Easily control Intel p-state driver"
pkgver=2.0.3
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('git')
depends=('coreutils' 'grep')
optdepends=('x86_energy_perf_policy: For the x86_energy_perf_policy-sleep.service')
provides=('pstate-frequency')
conflicts=('pstate-frequency')
license=('GPLv2')
url="https://github.com/pyamsoft/pstate-frequency/archive/${pkgver}.tar.gz"
source=("${url}")
sha256sums=('f2f976ff79711ef9d75a9f2da20999ee8c39b3fd051429a21c29a9d50fa9bf6d')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"

  # Disabled by default to conform to AUR packaging
  # best practices. It is highly recommended that you
  # enable the line to allow for editing the config.mk file
  #
  # make DESTDIR="${pkgdir}" PREFIX="/usr" edit

  make DESTDIR="${pkgdir}" PREFIX="/usr" options
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" clean
  make DESTDIR="${pkgdir}" PREFIX="/usr" bin
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
}

