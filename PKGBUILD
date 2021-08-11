# Maintainer: Hristos N. Triantafillou <me@hristos.co>
pkgname=wem
pkgver=0.7.1
pkgrel=1
pkgdesc='A tool for managing wine "envs" or prefixes.'
arch=('x86_64')
url='https://git.sr.ht/~hristoast/wem'
license=('GPL3')
depends=('glibc')
makedepends=('go' 'make')
provides=('wem')
conflicts=('wem')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~hristoast/wem/archive/${pkgver}.tar.gz")
sha512sums=('2525d9ce713198f4d11df4c82184feed54d186978680b43506d30dae3b1cd0ae4e547a60f91090073b1b833c341fd5d0abd14bc574ec1f888ec5cc30e7592750')

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
