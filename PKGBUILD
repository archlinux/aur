# Maintainer: David Birks <david@tellus.space>

pkgname=castnow-git
pkgver=r199.4ccb1e0
pkgrel=1
pkgdesc="A commandline chromecast player"
arch=('any')
makedepends=('git')
url="https://github.com/xat/castnow"
license=('MIT')
depends=('nodejs' 'npm')
source=($pkgname::git://github.com/xat/castnow.git)
md5sums=(SKIP)

pkgver() {
    cd "$pkgname"
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd $pkgname
    mkdir -p $pkgdir/usr
    npm install --user root -g --prefix="$pkgdir/usr"
    cd $pkgdir
    cd usr/lib/node_modules/
    rm castnow
    mv ../../../../../src/castnow-git castnow
    cd castnow
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
} 
