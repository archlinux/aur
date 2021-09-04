# Maintainer: Hristos N. Triantafillou <me@hristos.co>
pkgname=wem
pkgver=0.8.3
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
sha512sums=('3320f94136e6dc9521d437e9c65635a65fafb696b7f22e3f47fa20c71e798d1d49f75189b1a5d347d21bd711a51413fce319d94e87382d73189e45cb4b7992c3')

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
