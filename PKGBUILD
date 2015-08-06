# Maintainer: Ari Mizrahi <codemunchies at debugsecurity dot com>
# Contributor: ArchAssault Project <https://www.archassault.org>

pkgname=fang
pkgver=git
pkgrel=3
pkgdesc="A multi service threaded MD5 cracker"
arch=('any')
url=('https://github.com/evilsocket/fang')
license=('GPL2')
makedepends=('git')
depends=('python2')
source=('git+https://github.com/evilsocket/fang')
md5sums=('SKIP')
backup=('etc/fang.conf')

prepare() {
  cd "$srcdir/fang"

  # Follow standards, put config files in /etc.
  sed -i 's|fang\.conf|/etc/fang.conf|' fang.py

  # Fix shebang header.
  sed -i 's|python$|python2|' fang.py
}

package() {
  cd "$srcdir/fang"

  install -dm755 "$pkgdir/etc"
  install -dm755 "$pkgdir/usr/bin"

  install -m755 fang.py "$pkgdir/usr/bin/fang"
  install -m644 fang.conf "$pkgdir/etc/fang.conf"
}
