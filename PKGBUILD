# Maintainer: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=doctoc-git
pkgver=1.3.1.r0.g30d6569
pkgrel=2
pkgdesc="Generates table of contents for markdown files inside local git repository., installed through npm (git-latest)"
arch=('any')
url="https://www.npmjs.com/package/doctoc"
license=('GPLv3')
depends=('git' 'nodejs')
conflicts=('doctoc')
provides=('doctoc')
makedepends=('npm')
options=(!emptydirs)
source=('doctoc-git::git+https://github.com/thlorenz/doctoc')
sha256sums=('SKIP')

pkgver() {

  cd "$srcdir/$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'

}

package() {

  cd "$pkgname"
  mkdir -p $pkgdir/usr
  npm pack .
  npm install --user root -g --prefix="$pkgdir/usr" *.tgz
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  find "${pkgdir}" -name "package.json" -exec sed -e "s|${pkgdir}||" -i {} \;
  find "${pkgdir}" -name "package.json" -exec sed -e "s|${srcdir}||" -i {} \;

}
