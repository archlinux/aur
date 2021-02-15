# Maintainer: Jacob Gogichaishvili <jggsecondary@gmail.com>

_pkgname="zaread"
pkgname="$_pkgname-git"
pkgdesc="A (very) lightweight MS Office file reader"
arch=("any")
url="https://github.com/paoloap/zaread"
license=("GPL")
depends=("zathura" "libreoffice" "pandoc")
makedepends=("git")
provides=("zaread")
conflicts=("zaread")
source=('git+https://github.com/paoloap/zaread.git' 'markdown.patch::https://github.com/paoloap/zaread/pull/2.patch' 'cache.patch::https://github.com/paoloap/zaread/pull/4.patch')
pkgver=1.0
pkgrel=1
sha256sums=('SKIP'
            'a672ca390255a51b99f44998ae6c9955db5caea6051ccf1aef0610b1d00bc1e4'
            'daaabcb0c7728947567ecad716c6abdb55b2fb04cd7b5db9f600311748f56f39')

prepare() {
  cd "$srcdir/$_pkgname"
  # Add markdown patch so zaread can read markdown
  git am "$srcdir/markdown.patch"
  # Add cache patch so zaread uses the XDG-specification directory for cache rather than its own.
  git am "$srcdir/cache.patch"
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -p "$pkgdir/${PREFIX:-usr}/bin"
  install -Dm755 "$srcdir/$_pkgname/$_pkgname" "$pkgdir/${PREFIX:-usr}/bin/"
}
