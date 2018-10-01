# Maintainer: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=doctoc
pkgver=v1.3.1
pkgrel=1
pkgdesc="Generates table of contents for markdown files inside local git repository., installed through npm"
arch=('any')
url="https://www.npmjs.com/package/doctoc"
license=('GPLv3')
depends=('git' 'nodejs')
makedepends=('npm')
options=(!emptydirs)
source=("git+https://github.com/thlorenz/doctoc#tag=${pkgver}")
sha256sums=('SKIP')

package() {

  cd "$pkgname"
  mkdir -p $pkgdir/usr
  npm pack .
  npm install --user root -g --prefix="$pkgdir/usr" *.tgz
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  find "${pkgdir}" -name "package.json" -exec sed -e "s|${pkgdir}||" -i {} \;
  find "${pkgdir}" -name "package.json" -exec sed -e "s|${srcdir}||" -i {} \;

}
