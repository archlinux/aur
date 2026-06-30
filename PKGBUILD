# Maintainer: Flinner Yuu <flinner @ tilde DOT team>
# Maintainer: Jeaye Wilkerson <jeaye @ jank-lang DOT org>
pkgname='jank-bin'
# package is always version 0.1-1 (until stable release). So I use date of the tarball.
pkgver=20250914
pkgrel=1
pkgdesc="The native Clojure dialect hosted on LLVM with seamless C++ interop."
arch=('x86_64')
url="https://jank-lang.org/"
license=('MPL-2.0')
options=(!strip)
depends=('gcc' 'libzip' 'lbzip2' 'libxml2' 'libedit' 'python3' 'boost')
makedepends=()
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=('https://cache.jank-lang.org/arch/jank-arch-x86-64.tar.gz')
sha256sums=('SKIP')

pkgver() {
    local last_modified=$(curl -sI --head "https://cache.jank-lang.org/arch/jank-arch-x86-64.tar.gz" | grep -i '^Last-Modified:' )

    if [[ -n "$last_modified" ]]; then
        # Extract date part: "Sun, 14 Sep 2025 02:22:18 GMT"
        # Use LC_TIME=C to ensure English month names are parsed
        LC_TIME=C date -d "${last_modified#*Last-Modified: }" +"%Y%m%d" 2>/dev/null || echo "$(date +%Y%m%d)"
    else
        # Fallback: today's date if header missing
        date +%Y%m%d
    fi
}

package() {
  install -d "$pkgdir/usr"
  cp -a "$srcdir/inst/usr/local/." "$pkgdir/usr/"
}
