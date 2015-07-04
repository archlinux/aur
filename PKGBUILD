# Maintainer: Michael Duell <michael.duell@rub.de> PGP-Fingerprint: FF8C D50E 66E9 5491 F30C  B75E F32C 939C 5566 FF77
# Contributor: s1gma <s1gma@mindslicer.com>

pkgname=pgpdump-git
pkgver=v0.28.r14.ga65eb20
epoch=1
pkgrel=2
pkgdesc="Dumps information (Used Keys, moduli, r, s, ...) from a OpenPGP compatible file."
arch=('i686' 'x86_64')
url="http://www.mew.org/~kazu/proj/pgpdump/en/"
license=('BSD')
depends=('bzip2' 'zlib')
makedepends=('git')
provides=('pgpdump')
conflicts=('pgpdump')
source=('pgpdump::git+https://github.com/kazu-yamamoto/pgpdump.git')
sha384sums=('SKIP')

pkgver() {
    cd "$srcdir"/pgpdump
    (   
        set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
  cd "$srcdir"/pgpdump

  ./configure --prefix=/usr
  make 
}

package() {
  cd "$srcdir"/pgpdump
  make DESTDIR="$pkgdir" install
}
