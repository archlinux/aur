# Maintainer: 2ion <dev@2ion.de>
pkgname=playtime-git
pkgver=1.4
pkgrel=1
pkgdesc="Pretty-print media file duration indices"
arch=('any')
url="https://github.com/2ion/playtime"
license=('GPL3')
depends=('mediainfo' 'bash' 'util-linux' 'file')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('playtime::git+https://github.com/2ion/playtime.git#branch=master')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --tags | sed 's/ver_//;s/_/./g;s/-/.r/;s/-/./'
}

check() {
  cd "$srcdir/${pkgname%-git}"
  bash -n playtime
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm644 README.mkd "$pkgdir"/usr/share/doc/playtime/README.mkd
  install -Dm755 playtime "$pkgdir"/usr/bin/playtime
}
