# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Aaron Griffin <aaron@archlinux.org>

pkgname=iputils-minimal-git
pkgver=20200821
pkgrel=1
pkgdesc="Network monitoring tools, including ping"
arch=('x86_64')
license=('GPL')
url="http://www.skbuff.net/iputils/"
depends=('libcap' 'libidn2')
makedepends=('git' 'meson')
provides=(iputils)
conflicts=('netkit-base' 'arping' 'netkit-tftpd' 'iputils')
replaces=('netkit-base')
source=("git+https://github.com/iputils/iputils.git")
sha1sums=('SKIP')

pkgver() {
  cd iputils
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd iputils

  arch-meson iputils -DBUILD_RARPD=false -DBUILD_TFTPD=false -DBUILD_ARPING=false -DBUILD_PING=false -DBUILD_RDISC=false -DENABLE_RDISC_SERVER=false -DBUILD_TRACEPATH=false -DBUILD_TRACEROUTE6=false -DBUILD_NINFOD=false -DNINFOD_MESSAGES=false -DBUILD_MANS=false -DBUILD_HTML_MANS=false "_build"
  ninja $NINJAFLAGS -C iputils
}

package() {
  cd iputils

  DESTDIR="$pkgdir" ninja $NINJAFLAGS install -C iputils
}
