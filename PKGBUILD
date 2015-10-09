# Maintainer: Jack O'Connor <oconnor663@gmail.com>

pkgname=keybase-release
pkgdesc='release build of the Keybase Go client'
url='https://keybase.io/docs/cli_kbstage'
license=('BSD')
pkgver=33.2b4bc5a
pkgver() {
  cd "$srcdir/client-beta"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}
pkgrel=1
arch=(i686 x86_64)
makedepends=(go)
depends=(gnupg)
conflicts=(keybase)
source=('git://github.com/keybase/client-beta')
md5sums=('SKIP')

package() {
  cd "$srcdir/client-beta"
  export GOPATH=`pwd`
  mkdir -p src/github.com/keybase
  cp -r client src/github.com/keybase/
  cd src/github.com/keybase/client/go/keybase
  dest="$pkgdir/usr/bin/keybase"
  mkdir -p "$(dirname "$dest")"
  echo building keybase binary...
  go build -a -tags release -o "$dest"
}
