# Maintainer: James An <james@jamesan.ca>

_pkgname=profitbricks-cli
pkgname="nodejs-$_pkgname"
pkgver=1.1.1.r1.g2c4535b
pkgrel=1
pkgdesc="ProfitBricks Cross Platform Command Line tool"
arch=('any')
url="https://github.com/profitbricks/$_pkgname"
license=('Apache')
depends=('nodejs')
makedepends=('git' 'npm')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=(
  "$_pkgname"::"git+https://github.com/profitbricks/$_pkgname.git"
  bash-completion
)
md5sums=('SKIP'
         '657152bc10770c22c3cf696bf02bb962')

#~ pkgver() {
    #~ cd "$_pkgname"
    #~ (
        #~ set -o pipefail
        #~ git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
        #~ printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    #~ )
#~ }

package() {
  install -Dm644 bash-completion "$pkgdir/usr/share/bash-completion/completion/profitbricks"
  install -dm755 "$pkgdir/usr/lib/node_modules"

  cd "$pkgdir/usr/lib/node_modules"
  npm install -g --prefix "$pkgdir/usr" $srcdir/$_pkgname
}
