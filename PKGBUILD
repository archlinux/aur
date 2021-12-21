# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: CyrIng <xfreq[at]cyring[dot]fr>
# Contributor: CyrIng <xfreq[at]cyring[dot]fr>
pkgname=xfreq-git
pkgver=2.1.66
pkgrel=2
pkgdesc="Processor Monitoring w/ Turbo Boost, Temps, C-States, Features, Tasks scheduling"
arch=(x86_64)
url="http://github.com/cyring/xfreq/"
license=('GPL2')
depends=(libx11)
makedepends=(git)
conflicts=(xfreq-2.0-git)
source=("git+https://github.com/cyring/xfreq.git")
md5sums=('SKIP')
install=readme.install

_gitname=xfreq

prepare() {
  cd ${_gitname}
  sed -i -e "s:LIB4x86_FLAGS=:LIB4x86_FLAGS=$LDFLAGS :" cli/Makefile
  sed -i -e "s:LIB4x86_FLAGS=:LIB4x86_FLAGS=$LDFLAGS :" gui/Makefile
  sed -i -e "s:LIB4x86_FLAGS=:LIB4x86_FLAGS=$LDFLAGS :" svr/Makefile
}

build() {
  cd ${_gitname}
  make LDFLAGS="$LDFLAGS" -j1
}

package() {
  cd ${_gitname}
  install -Dm755 svr/bin/xfreq-intel "${pkgdir}/usr/bin/xfreq-intel"
  install -Dm644 svr/xfreq-intel.service "${pkgdir}/usr/lib/systemd/system/xfreq-intel.service"
  install -m755 cli/bin/xfreq-cli "${pkgdir}/usr/bin/xfreq-cli"
  install -m755 gui/bin/xfreq-gui "${pkgdir}/usr/bin/xfreq-gui"
}
