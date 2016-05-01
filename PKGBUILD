# Maintainer: Score_Under <seejay.11@gmail.com>
_pkgname=ksm_preload
pkgname=$_pkgname-git
pkgver=0.10.8.rfa46b5c
pkgrel=1
pkgdesc='Library which allows legacy applications to use Kernel Same-page Merging'
url=http://vleu.net/ksm_preload/
arch=(i686 x86_64)
license=(GPL3)
source=("git+https://github.com/unbrice/$_pkgname.git"
        ksm-wrapper)
optdepends=('sh: ksm-wrapper script')
makedepends=(cmake)
sha256sums=('SKIP'
            '348c6c707eef3f6efed5896492faa6482ad8fe964a0eab8eec8fec1217069610')

cdgit() { cd -- "$_pkgname"; }

pkgver() {
    cdgit
    local version="$(git describe --always --match 'v*.*')"
    version=${version#v}
    version=${version//-/.}
    version=${version/.g/.r}
    printf '%s\n' "$version"
}

build() {
    cdgit
    cmake .
    make
}

package() {
    install -m755 -Dt "$pkgdir/usr/bin" ksm-wrapper
    cdgit
    make install DESTDIR="$pkgdir"
}
