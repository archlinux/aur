# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=redo-c
pkgver=0.3
pkgrel=3
pkgdesc="An implementation of the redo build system in portable C with zero dependencies"
arch=('x86_64')
url="https://github.com/leahneukirchen/redo-c"
license=('custom:CC0-1.0')
depends=('glibc')
makedepends=('git')
provides=('redo')
conflicts=('redo-sh' 'redo-jdebp' 'redo-python')
options=('!lto')
_commit='c19b03dc4c656109833c3af6924bfb314c9fbfdc'
source=(
  "$pkgname::git+$url.git#commit=$_commit"
  'LICENSE'
)
b2sums=('SKIP'
        '989dcffd3bfcd3f02ee92064f1a293ab8bf33f8993538b960e7ef4a43669e056fe8abc3c5bc05ab57d10089895872a3d06821e55db2df6bd88418ab1ac1ea29b')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  cc $CFLAGS -o redo redo.c $LDFLAGS
}

package() {
  cd "$pkgname"

  # binaries
  install -vDm755 -t "$pkgdir/usr/bin" redo
  ln -sf /usr/bin/redo "$pkgdir/usr/bin/redo-ifcreate"
  ln -sf /usr/bin/redo "$pkgdir/usr/bin/redo-ifchange"
  ln -sf /usr/bin/redo "$pkgdir/usr/bin/redo-always"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" ../LICENSE
}
