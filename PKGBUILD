# Contributor: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=doctoc
pkgver=2.2.0
pkgrel=1
pkgdesc="Generates table of contents for markdown files inside local git repository., installed through npm"
arch=('any')
url="https://www.npmjs.com/package/doctoc"
license=('GPLv3')
depends=('git' 'nodejs')
conflicts=('doctoc-git')
makedepends=('npm')
options=(!emptydirs)
source=("git+https://github.com/thlorenz/doctoc#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
  cd "$pkgname"
  mkdir -p "$pkgdir/usr"
  npm pack .
  npm install --user root -g --prefix="$pkgdir/usr" *.tgz
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  find "${pkgdir}" -name "package.json" -exec sed -e "s|${pkgdir}||" -i {} \;
  find "${pkgdir}" -name "package.json" -exec sed -e "s|${srcdir}||" -i {} \;
}
