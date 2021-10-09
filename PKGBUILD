# Maintainer: Hristos N. Triantafillou <me@hristos.co>
pkgname=wem
pkgver=0.8.5
pkgrel=1
pkgdesc='A tool for managing wine "envs" or prefixes.'
arch=('x86_64')
url='https://git.sr.ht/~hristoast/wem'
license=('GPL3')
depends=('glibc')
makedepends=('go')
provides=('wem')
conflicts=('wem')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~hristoast/wem/archive/${pkgver}.tar.gz")
sha512sums=('af45a2cca6a5a83909a6ef5f64ef5ae7a6d3df873bf7ca5036b6c4226b36072d2d98b975a25c051030133cb6904f83c85ca510a7857267bbd1c669503239c2d9')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export GOFLAGS='-buildmode=pie'
    # export CGO_CPPFLAGS="-D_FORTIFY_SOURCE=2"
    # export CGO_LDFLAGS="-Wl,-z,relro,-z,now"
    # Still get this despite using those exports:
    # wem W: ELF file ('usr/bin/wem') lacks FULL RELRO, check LDFLAGS.
    go build -o wem wem.go
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -D wem --target-directory $pkgdir/usr/bin/
}
