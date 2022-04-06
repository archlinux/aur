# Maintainer: Your Name <youremail@domain.com>
pkgname=kiss2ugo
pkgver=20220406
pkgrel=1
pkgdesc="Lilac build API"
arch=('x86_64')
url="https://github.com/a-wing/kiss2ugo"
license=('unkown')
depends=()
makedepends=('git' 'go')
source=(git+https://github.com/a-wing/kiss2ugo.git)
md5sums=('SKIP')
pkgver(){
    date +%Y%m%d
}
prepare(){
  cd $pkgname
  go get -u github.com/shurcooL/vfsgen
}
build() {
  cd "$pkgname"

  go generate
  go build
}

package() {
  cd "$pkgname"
  install -Dm 755 kiss2u $pkgdir/usr/bin/kiss2u
  install -Dm 755 kiss2ugo.service $pkgdir/usr/lib/systemd/system/kiss2ugo.service

}
