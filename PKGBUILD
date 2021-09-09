# Maintainer: Hristos N. Triantafillou <me@hristos.co>
pkgname=wem
pkgver=0.8.4
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
sha512sums=('1f9f5f597b288baf184f79be66ca9766efe7977924ffda0429cb8f137e95fcb508f27d255a03a7ad2d036bf0f3e8781a42049db30379285ede03d81d6d5a58eb')

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
