# Maintainer: Managor <antti.savo@gmail.com>
_pkgname=tldr
pkgname=tldr-pages-git
pkgver=2.3.r6598.g17d7177
pkgrel=1
pkgdesc='The actual tldr pages. Currently compatible only with the python client'
arch=('any')
url=https://github.com/tldr-pages/tldr
license=('CC-BY-4.0')
provides=('tldr-pages')
conflicts=('tldr-pages')
optdepends=('tldr: client for using the pages')
makedepends=('git')
source=("git+https://github.com/tldr-pages/tldr.git")
sha256sums=('SKIP')
options=('!strip' '!debug' 'libtool' '!purge' '!zipman' 'emptydirs' 'staticlibs')

pkgver() {
  cd "$_pkgname"
  git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  install -dm755 "$pkgdir/usr/share/tldr"
  cp -r pages* "$pkgdir/usr/share/tldr/"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
