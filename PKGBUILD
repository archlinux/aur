# Maintainer: Dave Reisner <d@falconindy.com>

pkgname=asp-git
pkgver=r29.991717a
pkgrel=1
pkgdesc="Arch Linux build source file management (git version)"
arch=('any')
url="http://github.com/falconindy/asp"
license=('MIT')
depends=('awk' 'bash' 'git')
makedepends=('asciidoc')
conflicts=('asp')
provides=('asp')
source=("git://github.com/falconindy/asp")
md5sums=('SKIP')

pkgver() {
  cd 'asp'

  # change this once there's a tag
  printf 'r%s.%s\n' "$(git rev-list HEAD | wc -l)" "$(git describe --always)"
}

build() {
  make -C asp
}

package() {
  make -C asp PREFIX=/usr DESTDIR="$pkgdir" install

  install -Dm644 asp/LICENSE "$pkgdir/usr/share/licenses/asp/LICENSE"
}

# vim: ft=sh syn=sh et
