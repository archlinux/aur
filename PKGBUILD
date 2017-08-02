# Maintainer: Tony Crisci <tony@dubstepdish.com>
pkgname=i3-style
pkgver=0.10.0
pkgrel=1
pkgdesc="Add styles and colorschemes to i3wm"
arch=('any')
url="https://github.com/acrisci/i3-style"
license=('custom:BSD 2-Clause')
depends=('nodejs')
makedepends=('npm' 'coffee-script')
options=(!emptydirs)
source=("https://github.com/acrisci/i3-style/archive/v$pkgver.tar.gz")
sha256sums=("e052063abe7a07f24bdc93e3aa18ff93b81282093b4641cfb245ba3b74baddf3")

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr"
  cake build
  npm install --user root -g --prefix="$pkgdir/usr"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  find "${pkgdir}" -name "package.json" -exec sed -e "s|${pkgdir}||" -i {} \;
  find "${pkgdir}" -name "package.json" -exec sed -e "s|${srcdir}||" -i {} \;
}

# vim:set ts=2 sw=2 et:

