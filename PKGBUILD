# Maintainer: Anoop S <anoop.skumar1507@gmail.com>

pkgname="pdfcpu-git"
_pkgname="pdfcpu"
pkgver=0.3.13.r16.g31d2490
pkgrel=1
pkgdesc="A Command-line PDF processor written in Go."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/pdfcpu/pdfcpu"
license=('Apache-2.0')
makedepends=('go>=1.17' 'git')
conflicts=('pdfcpu')
provides=('pdfcpu')
options=('!strip' '!emptydirs')
source=("git+$url")
md5sums=("SKIP")


pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd "$srcdir/$_pkgname/cmd/$_pkgname"
  go build ./
}

package() {
  install -Dm644 "$srcdir/$_pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644  "$srcdir/$_pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm755 "$srcdir/$_pkgname/cmd/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
