pkgname=panrun
pkgver=r14.2e08db5
pkgrel=1
pkgdesc='Script that looks at the YAML metadata in a markdown file and runs pandoc for you.'
arch=('i686' 'x86_64')
url='https://github.com/mb21/panrun'
license=('MIT')
depends=('ruby' 'pandoc')
makedepends=('git')
source=('git+https://github.com/mb21/panrun')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$pkgname"
}

package() {
  cd "$pkgname"
  install -D -m775 panrun "$pkgdir/usr/bin/panrun"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
