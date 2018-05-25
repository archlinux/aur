# Maintainer: aksr <aksr at t-com dot me>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=otf-libertinus-git
pkgver=6.6.r30.g6f5da00
pkgrel=1
pkgdesc='Libertinus font family, a fork of Linux Libertine and Linux Biolinum with bugfixes and an OpenType math companion.'
arch=('any')
url='https://github.com/libertinus-fonts/libertinus'
license=('custom: OFL')
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

