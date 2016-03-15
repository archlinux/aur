# Maintainer: aksr <aksr at t-com dot me>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=otf-libertinus-git
pkgver=6.2.r9.gee27ebc
pkgrel=1
pkgdesc="Libertinus font family, a fork of Linux Libertine and Linux Biolinum with bugfixes and an OpenType math companion."
arch=('any')
url="https://github.com/khaledhosny/libertinus"
license=('custom: OFL')
depends=('fontconfig' 'xorg-font-utils')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=otf.install
source=("$pkgname::git+https://github.com/khaledhosny/libertinus.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  find -name '*.otf' -execdir install -Dm644 {} "${pkgdir}/usr/share/fonts/OTF/{}" \;
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}

