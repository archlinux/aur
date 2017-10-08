# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=pmsg
pkgver=0.2
pkgrel=1
pkgdesc='Prompt notifications at certain intervals'
arch=('any')
url='http://github.com/xyproto/pmsg'
license=('GPL2')
optdepends=('zsh: for zsh support'
            'bash: for bash support'
            'fish: for fish support')
depends=('python')
makedepends=('setconf')
source=('git+https://github.com/xyproto/pmsg.git#commit=05a1428774160f7f1801751e0d498bfe35f468a2')
md5sums=('SKIP')

prepare() {
  setconf $pkgname/install.sh SOURCE_DIR=/usr/share/$pkgname
  setconf $pkgname/install.sh PREFIX=/
  setconf $pkgname/install.sh BIN_DIR=usr/bin
  setconf $pkgname/install.sh INSTALL_BINARY=0
}

package() {
  cd "$pkgname"

  install -Dm755 install.sh "$pkgdir/usr/bin/pmsg_setup"
  install -Dm755 pmsg "$pkgdir/usr/bin/pmsg"
  install -Dm644 time.example.conf "$pkgdir/usr/share/pmsg/time.example.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/pmsg/LICENSE"
}

# vim: ts=2 sw=2 et:
