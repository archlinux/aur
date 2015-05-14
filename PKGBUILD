# Maintainer: Phil Ruffwind <rf@rufflewind.com>
pkgname=slatec
pkgver=4.1
pkgrel=2
pkgdesc="SLATEC Common Mathematical Library"
arch=(i686 x86_64)
url=http://netlib.org/slatec
license=(PD)
depends=()
makedepends=(gcc-fortran)
source=(http://netlib.org/slatec/slatec_src.tgz LICENSE Makefile slatec.patch)
sha256sums=('df009d9ef9c18aae06ce68711b1ae108d3533b4f174582c3cbea0915c4fdfe01'
            'd83a2ee63ee4bbd56d59072a0778e06685fa001047f153a3f0293d30849c8046'
            '7d8fb187324596d4d882d895c31db0afddf2984a933ab6e623de576d5f36558e'
            '4fb39658c6da25618d20e6aec0680c48d4666ab0eb1322f6e7f93a34bb51ce4f')

prepare() {
    cd "$srcdir"
    patch -p 0 <slatec.patch
}

build() {
    cd "$srcdir"
    make FC=gfortran all
}

package() {
    cd "$srcdir"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -m755 -d "$pkgdir/usr/share/slatec/src"
    install -m755 -t "$pkgdir/usr/share/slatec/src" src/*.f
}
