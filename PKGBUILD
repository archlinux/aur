# Maintainer: Sean Greenslade <aur AT seangreenslade DOT com>
# Contributor: Lars Rustand <rustand dot lars at gmail dot com>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: Eric Belanger <eric at archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227 at archlinux.us>
# Contributor: Wesley Merkel <ooesili at gmail.com>
# Contributor: sekret <sekret at posteo.se>

_pkgname=htop
pkgname=$_pkgname-solarized
pkgver=3.0.2
pkgrel=1
pkgdesc="Interactive process viewer with solarized patch"
arch=('i686' 'x86_64' 'armv7h')
url='https://htop.dev/'
license=('GPL')
depends=('ncurses' 'libncursesw.so' 'libnl')
optdepends=('lsof: show files opened by a process'
            'strace: attach to a running process')
provides=('htop')
conflicts=('htop')
options=('!emptydirs')
source=("https://github.com/htop-dev/htop/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        'htop-solarized.patch')
sha256sums=('b4744a3bea279f2a3725ed8e5e35ffd9cb10d66673bf07c8fe21feb3c4661305'
            'd602046cf90caed976061a09c34c8156de5023b93245de53b6ae115651b78ccb')

prepare() {
  cd "$_pkgname-$pkgver"

  autoreconf -fi

  # Solarized patch
  patch -p1 -N -i "${srcdir}/htop-solarized.patch"
}

build() {
  cd "$_pkgname-$pkgver"

  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --enable-cgroup \
      --enable-delayacct \
      --enable-openvz \
      --enable-unicode \
      --enable-vserver

  make
}

package() {
  make -C "$_pkgname-$pkgver" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
