# Maintainer: aksr <aksr at t-com dot me>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pkgname=libertinus
pkgname="otf-$_pkgname-git"
pkgver=7.000.r0.g2802fff
pkgrel=1
pkgdesc='The Libertinus font family, a fork of Linux Libertine and Biolinum with OpenType math'
arch=('any')
url="https://github.com/alerque/$_pkgname"
license=('OFL')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('fontship')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --match="v[0-9]*" |
    sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  fontship make
}

package() {
  cd "$pkgname"
  install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" "${_pkgname^}"*.otf
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" OFL.txt AUTHORS.txt
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md preview.svg FONTLOG.txt documentation/*.pdf
}
