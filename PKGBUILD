# Maintainer: aksr <aksr at t-com dot me>
pkgname=otf-punk-git
pkgver=1.003.r7.g7274715
pkgrel=1
pkgdesc="Punk Nova - an OpenType implementation of Donald Knuth's Punk font"
arch=('any')
url='https://github.com/khaledhosny/punk-otf'
license=('OFL')
depends=('fontconfig' 'xorg-font-utils')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  for f in *.otf; do
    install -D -m644 $f "$pkgdir/usr/share/fonts/OTF/$f"
  done
  install -D -m644 OFL.txt "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}

