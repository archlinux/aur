# Maintainer: Simon Conseil <contact+aur at saimon dot org>

pkgname=teleprompter-git
_gitname=Teleprompter-Core
pkgver=r103.1828c12
pkgrel=1
pkgdesc="Professional-grade, multi-platform, free software teleprompter, installed through npm"
arch=('any')
url="www.imaginary.tech/teleprompter"
license=('GPLv3')
depends=('git' 'nodejs')
makedepends=('npm')
options=(!emptydirs)
source=('git+https://github.com/imaginaryfilms/Teleprompter-Core.git')
sha256sums=('SKIP')

pkgver() {

  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

package() {

  cd "$_gitname"
  mkdir -p $pkgdir/usr
  npm install --user root -g --prefix="$pkgdir/usr"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  find "${pkgdir}" -name "package.json" -exec sed -e "s|${pkgdir}||" -i {} \;
  find "${pkgdir}" -name "package.json" -exec sed -e "s|${srcdir}||" -i {} \;
}
