# Maintainer: RiverOnVenus <error@zhui.dev>
pkgname=cmix-git
pkgver=21.r10.g38e2a9e
pkgrel=1
pkgdesc="lossless data compression program aimed at optimizing compression ratio at the cost of high CPU/memory usage"
arch=('x86_64')
url="https://github.com/byronknoll/cmix"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'clang')
provides=('cmix')
conflicts=('cmix')
source=("$pkgname"::"git+${url}"
		"clang21.patch")
sha256sums=('SKIP'
            '50e77b7ffb8ead9b3a4d109f909830764816edf997887d30bfdcc26385b35fa1')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  git -C "$srcdir/$pkgname" apply -v "$srcdir"/clang21.patch
}

build() {
  cd $pkgname
  make CC=clang CXX=clang++
}

package() {
  install -D -m755 "$srcdir/$pkgname/cmix" "${pkgdir}/usr/bin/cmix"
}
