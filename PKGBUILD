# Maintainer: Marcouney <fora at mrdc dot fr>

pkgname=jpegrescan-git
_pkgname=${pkgname%-git}
pkgver=1.1.0.r16.g3a7de06
_pkgver=$(echo $pkgver | sed 's/\(.*\).r.*/\1/')
pkgrel=1
pkgdesc="Losslessly shrink any JPEG file"
arch=(any)
url="https://github.com/kud/$_pkgname"
license=('custom:Public Domain')
provides=("jpegrescan=$_pkgver")
conflicts=("jpegrescan")
depends=('perl-file-slurp' 'libjpeg-turbo')
makedepends=('git')
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname/"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname/"
  install -Dm755 -t "$pkgdir/usr/bin/" $_pkgname
  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname/" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname/" LICENSE
}
