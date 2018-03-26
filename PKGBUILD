# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=pmsg
pkgver=0.8
pkgrel=1
pkgdesc='Prompt notifications at certain intervals'
arch=('any')
url='https://github.com/xyproto/pmsg'
license=('GPL2')
optdepends=('bash: bash support'
            'fish: fish support'
             'zsh: zsh support')
makedepends=('setconf')
depends=('python')
source=("git+https://github.com/xyproto/pmsg.git#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  for opt in \
    SOURCE_DIR=/usr/share/$pkgname \
    PREFIX=/ \
    BIN_DIR=usr/bin \
    INSTALL_BINARY=0
  do
    setconf $pkgname/install.sh $opt
  done
}

package() {
  cd "$pkgname"

  install -Dm755 install.sh "$pkgdir/usr/bin/pmsg_setup"
  install -Dm755 pmsg "$pkgdir/usr/bin/pmsg"
  install -Dm644 time.example.conf "$pkgdir/usr/share/pmsg/time.example.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/pmsg/LICENSE"
}

# vim: ts=2 sw=2 et:
