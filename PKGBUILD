# Maintainer: Hristos N. Triantafillou <me@hristos.co>
pkgname=wem
pkgver=0.8.2
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
sha512sums=('59dfab322345798252fe65e3cedcd07843f9c6099a371823986e9d9d19f005148b971a2b80b9d17dd1f940d19ee680f42d0909efc3a6e1d3da1af42290241103')

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
