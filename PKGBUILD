# Maintainer: Daniel M. Capella <polyzen@archlinux.info>
# Contributor: Scott Lawrence <bytbox@gmail.com>

pkgname=sloc
pkgver=0.3.1
pkgrel=3
pkgdesc='Simple source-lines-of-code counter'
arch=('i686' 'x86_64')
url=http://git.bytbox.net/sloc/
license=('MIT')
makedepends=('go')
optdepends=('perl-datetime' 'perl-json' 'perl-switch' 'gnuplot')
source=("sloc-$pkgver.tar.gz::https://github.com/polyzen/sloc/archive/v$pkgver.tar.gz")
sha512sums=('a95fbbba9a4e946536edc00fdd20130884f578892562320c4d9beb8c1123ff589f47b1f2d20b4417f909f0256e4277c3db42552af27822221f2bf4413c0c3930')

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
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/sloc/LICENSE
}

# vim:set ts=2 sw=2 et:
