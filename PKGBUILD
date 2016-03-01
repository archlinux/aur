# Maintainer: aksr <aksr at t-com dot me>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=otf-libertinus-git
pkgver=6.2_9_gee27ebc
pkgrel=1
pkgdesc="The Libertinus font family, A fork of the Linux Libertine and Linux Biolinum fonts with bugfixes and an OpenType math companion."
arch=('any')
url="https://github.com/khaledhosny/libertinus"
license=('custom: OFL')
depends=('fontconfig' 'xorg-font-utils')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=otf.install
source=("$pkgname::git://github.com/khaledhosny/libertinus.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/-/_/g'
}

package() {
  cd "$srcdir/$pkgname"
  find -name '*.otf' -execdir install -Dm644 {} "${pkgdir}/usr/share/fonts/OTF/{}" \;
  install -Dm644 OFL.txt "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}

