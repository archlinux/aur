# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributor: Christian Hesse <mail@eworm.de>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=htop-devel
_pkgname=htop
pkgver=3.0.0beta5
pkgrel=1
pkgdesc='Interactive process viewer'
arch=('x86_64')
url='https://hisham.hm/htop/'
license=('GPL')
depends=('ncurses' 'libnl')
makedepends=('python')
conflicts=('htop' 'htop-git')
optdepends=('lsof: show files opened by a process'
            'strace: attach to a running process')
options=('!emptydirs')
source=("https://github.com/hishamhm/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('c439add8d6a463699629fc3f0103f55b045d519c31611fa4a68629063238985a')

build() {
  cd "$_pkgname-$pkgver"

  ./autogen.sh

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
