# Maintainer: yuki-san <yuki.from.akita _at_ gmail.com>

pkgname=cmigemo-git
pkgver=rel.1_2.r38.g5c014a8
pkgrel=2
pkgdesc="An implementation of Migemo in C"
arch=( 'i686' 'x86_64' )
url="http://www.kaoriya.net/software/cmigemo/"
license=('MIT' 'custom' )
makedepends=('git' 'nkf' 'curl')
provides=('cmigemo')
conflicts=('cmigemo')
source=("${pkgname%-git}"::'git+https://github.com/koron/cmigemo.git')
md5sums=('SKIP')
options=(!makeflags)

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"

  ./configure --prefix=/usr
  make gcc
  make gcc-dict
}

package() {
  cd "$srcdir/${pkgname%-git}"

  make prefix="$pkgdir"/usr docdir="$pkgdir"/usr/share/doc/cmigemo-git gcc-install
  install -d -m 755 "$pkgdir"/usr/share/licenses/cmigemo-git
  install -c -m 644 doc/LICENSE_j.txt "$pkgdir"/usr/share/licenses/cmigemo-git
}

# vim:set ts=2 sw=2 et:
