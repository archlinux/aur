# Maintainer: aksr <aksr at t-com dot me>
pkgname=troff2page-git
pkgver=r258.746c8b4
pkgrel=1
epoch=
pkgdesc="A Lua program for making Web pages and Info documents from troff documents."
arch=('i686' 'x86_64')
url="https://github.com/ds26gte/troff2page"
license=('custom:MIT')
groups=()
depends=('groff')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=("${pkgname%-*}")
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+$url")
noextract=()
md5sums=('SKIP')

GROFF_TMAC_PATH="/usr/lib/groff/site-tmac"

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  git submodule init
  git submodule update
  mkdir -p "$pkgdir/$GROFF_TMAC_PATH"
  cp mpca/pca*.tmac "$pkgdir/$GROFF_TMAC_PATH"
  install -D -m755 troff2page "$pkgdir/usr/bin/troff2page"
  install -D -m644 man/man1/troff2page.1 "$pkgdir/usr/share/man/man1/troff2page.1"
}

