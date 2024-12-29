#Maintainer: Jose Baez <jose.baez.medina@gmail.com>
pkgname=sls
pkgver=1.0.0
pkgrel=1
pkdesc='sls, ls like tool'
url=https://github.com/josebaezmedina/sls
arch=('x86_64')
license=('MIT')
depends=('chicken>=5.4.0-1' 'tar')
makedepends=()
source=("$pkgname-v$pkgver.tar.gz::https://github.com/josebaezmedina/sls/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')


prepare(){
    tar -xvzf "$pkgname-v$pkgver.tar.gz"
    cd "$pkgname-$pkgver"
    chicken-install args srfi-1 list-utils fmt json srfi-13
}

build(){
    cd "$pkgname-$pkgver"
    chicken-csc sls.scm
}


package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" -t "$pkgdir/usr/bin"
    ln -s  "$pkgdir/usr/bin/sls" '/usr/bin/sls'
}
