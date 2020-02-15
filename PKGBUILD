# Maintainer: Patrick Wu <wotingwu@live.com>

pkgname=wslu-git
pkgver=vrolling
pkgrel=2
pkgdesc="A collection of utilities for Windows 10 Linux Subsystems"
arch=('any')
url='https://github.com/wslutilities/wslu'
license=('GPL3')
depends=('bc' 'imagemagick' 'bash-completion')
makedepends=('git' 'make' 'gzip')
conflicts=('wslu')
provides=('wslu')
source=("git+https://github.com/wslutilities/wslu.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/wslu"

# VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
# are not available, is recommended.

# Git, tags available
	printf "%s" "$(git describe --tags --long | sed 's/v\([0-9.]\+\)-\([0-9]\+\)-\(.*\)$/\1r\2.\4/')"

}

build() {
  cd wslu
  make
}

package() {
  cd wslu

  install -Dm 755 out/* -t "${pkgdir}"/usr/bin/
  install -Dm 555 docs/* -t "${pkgdir}"/usr/share/man/man1/
  install -Dm 555 src/etc/* -t "${pkgdir}"/usr/share/wslu/
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/wslu/
}

# vim: ts=2 sw=2 et:
