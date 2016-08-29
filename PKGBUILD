# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: Scott Lawrence <bytbox@gmail.com>

pkgname=sloc
pkgver=0.3.1
pkgrel=2
pkgdesc='Simple source-lines-of-code counter'
arch=('i686' 'x86_64')
url=http://git.bytbox.net/sloc/
license=('MIT')
depends=('go')
optdepends=('perl-datetime' 'perl-json' 'perl-switch' 'gnuplot')
makedepends=(git)
source=("sloc::git+http://git.bytbox.net/sloc/#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd sloc
  ./gen-man.sh

  cd sloc
  go build -o sloc
}

package() {
  cd sloc
  install -Dm755 sloc/sloc "$pkgdir"/usr/bin/sloc
  install -Dm755 reposloc "$pkgdir"/usr/bin/reposloc
  install -Dm644 reposloc.1 "$pkgdir"/usr/share/man/man1/reposloc.1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
