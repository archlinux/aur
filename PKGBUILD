# Maintainer: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Eric BÃ©langer <eric@archlinux.org>

pkgname=lib32-procps-ng
pkgver=3.3.17
pkgrel=1
pkgdesc='Utilities for monitoring your system and its processes (32-bit)'
url='https://sourceforge.net/projects/procps-ng/'
license=(GPL LGPL)
arch=(x86_64)
depends=('procps-ng' 'lib32-glibc')
provides=('libprocps.so')
source=("https://downloads.sourceforge.net/project/procps-ng/Production/procps-ng-${pkgver}.tar.xz")
sha256sums=('4518b3e7aafd34ec07d0063d250fd474999b20b200218c3ae56f5d2113f141b4')

build() {
  cd "${srcdir}"/procps-${pkgver}

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
  cd "${srcdir}"/procps-${pkgver}
  
  make DESTDIR="${pkgdir}" install

  rm -r "${pkgdir}"/bin
  rm -r "${pkgdir}"/usr/{bin,include,share}
}

