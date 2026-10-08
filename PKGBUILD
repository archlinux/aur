# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Upstream tags nothing, so pkgver is the pinned commit's date and _tag carries
# the commit itself. The Makefile defaults to -march=native, hence sse2=1; the
# library is not built by any upstream target, so it is assembled here.

pkgname=ksw2
_tag=289609bd9e5381a13b16239d0a7703f1ff03f9ca
pkgver=20230627
pkgrel=1
pkgdesc="Alignment library for DNA/RNA sequences under affine gap cost"
arch=('x86_64')
url="https://github.com/lh3/ksw2"
license=('MIT')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/${_tag}.tar.gz")
sha256sums=('b7bb4bdd246ac13ef4c94d3d8236b9805056dcaf4ddcbe34db85ab24eacf9ad2')

build() {
    cd "$srcdir/$pkgname-$_tag"
    make sse2=1
    ar rcs libksw2.a ksw2_gg.o ksw2_gg2.o ksw2_gg2_sse.o ksw2_extz.o \
        ksw2_extz2_sse.o ksw2_extd.o ksw2_extd2_sse.o ksw2_extf2_sse.o \
        ksw2_exts2_sse.o kalloc.o
}

package() {
    cd "$srcdir/$pkgname-$_tag"
    install -Dm644 ksw2.h "$pkgdir/usr/include/$pkgname/ksw2.h"
    install -Dm644 kalloc.h "$pkgdir/usr/include/$pkgname/kalloc.h"
    install -Dm644 libksw2.a "$pkgdir/usr/lib/libksw2.a"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
