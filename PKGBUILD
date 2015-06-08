# Maintainer: Daniel Nagy <danielnagy at gmx de>

pkgname=libinjection-git
_gitname=libinjection
pkgver=v3.6.0.4.g7250af6
pkgrel=1
pkgdesc="SQL / SQLI tokenizer parser analyzer."
url="https://github.com/client9/libinjection"
arch=( 'i686' 'x86_64' )
license=( 'BSD' )
options=( "!strip" )
depends=( "bash" )
makedepends=( "rsync" )
conflicts=( "$_gitname" )
provides=( "$_gitname" )
source=( "git+$url" )
sha1sums=( 'SKIP' )

pkgver() {
    cd "$srcdir/$_gitname"
    local ver="$(git describe --always)"
    printf "%s" "${ver//-/.}"
}

package() {
  cd "$srcdir/$_gitname"
  mkdir -p $pkgdir/usr/share/
  rsync --exclude=.git --exclude=.gitignore --exclude=tests -a ./ \
      "$pkgdir"/usr/share/$_gitname/
}
