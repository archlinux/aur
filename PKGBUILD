# Maintainer: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=teleprompter-git
pkgver=r104.9fe966d
pkgrel=1
pkgdesc="Professional-grade, multi-platform, free software teleprompter, installed through npm"
arch=('any')
url="www.imaginary.tech/teleprompter"
license=('GPLv3')
depends=('git' 'nodejs')
makedepends=('npm')
options=(!emptydirs)
source=('teleprompter-git::git+https://github.com/imaginaryfilms/Teleprompter-Core.git')
sha256sums=('SKIP')

pkgver() {

  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

package() {

  cd "$pkgname"
  mkdir -p $pkgdir/usr
  npm install --user root -g --prefix="$pkgdir/usr"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  find "${pkgdir}" -name "package.json" -exec sed -e "s|${pkgdir}||" -i {} \;
  find "${pkgdir}" -name "package.json" -exec sed -e "s|${srcdir}||" -i {} \;
}
