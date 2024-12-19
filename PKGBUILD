# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Eric BÃ©langer <eric@archlinux.org>

pkgname=lib32-procps-ng
pkgver=4.0.5
pkgrel=1
pkgdesc='Utilities for monitoring your system and its processes (32-bit)'
url='https://sourceforge.net/projects/procps-ng/'
license=(GPL LGPL)
arch=(x86_64)
depends=('procps-ng' 'lib32-glibc')
provides=('libproc2.so')
source=("https://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-${pkgver}.tar.xz"{,.asc})
sha256sums=('c2e6d193cc78f84cd6ddb72aaf6d5c6a9162f0470e5992092057f5ff518562fa'
            'SKIP')
validpgpkeys=('5D2FB320B825D93904D205193938F96BDF50FEA5') # Craig Small <csmall@debian.org>

build() {
  cd "${srcdir}"/procps-ng-${pkgver}

  export CC='gcc -m32'
  ./configure --exec-prefix=/ \
              --prefix=/usr \
              --sysconfdir=/etc \
              --libdir=/usr/lib32 \
              --sbindir=/usr/bin \
              --without-ncurses
  make
}

package() {
  cd "${srcdir}"/procps-ng-${pkgver}
  
  make DESTDIR="${pkgdir}" install

  rm -r "${pkgdir}"/bin
  rm -r "${pkgdir}"/usr/{bin,include,share}
}

