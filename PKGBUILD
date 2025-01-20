# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Eric BÃ©langer <eric@archlinux.org>

pkgname=lib32-procps-ng
pkgver=4.0.5
pkgrel=1
pkgdesc='Utilities for monitoring your system and its processes (32-bit)'
url='https://gitlab.com/procps-ng/procps'
license=(GPL LGPL)
arch=(x86_64)
depends=('procps-ng' 'lib32-glibc')
makedepends=('git')
provides=('libproc2.so')
source=("git+https://gitlab.com/procps-ng/procps.git#tag=v${pkgver}?signed")
sha256sums=('640ad0085ee013efb94877072cfa7c0c025884dc8cc398e331b7efb6ebaefc01')
validpgpkeys=('5D2FB320B825D93904D205193938F96BDF50FEA5') # Craig Small <csmall@debian.org>

prepare() {
  cd procps

  ./autogen.sh
}

build() {
  cd procps

  export CC='gcc -m32'
  ./configure \
    --exec-prefix=/ \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libdir=/usr/lib32 \
    --sbindir=/usr/bin \
    --without-ncurses
  make
}

package() {
  cd procps
  
  make DESTDIR="${pkgdir}" install

  rm -r "${pkgdir}"/bin
  rm -r "${pkgdir}"/usr/{bin,include,share}
}

