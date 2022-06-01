# Maintainer: Beshr Ghalil <bshrghalil@gmail.com>
pkgname=todome-git
_pkgname=todome
pkgver=37__2022.06.01
pkgrel=1
epoch=
pkgdesc="Language agnostic tool that collects TODOs, FIXMEs ,BUGs, NOTEs and DONEs in the source code."
arch=('x86_64' 'i686')
url="https://www.github.com/BishrGhalil/todome.git"
license=('GPL')
depends=('git')
optdepends=('')
makedepends=('git' 'make')
provides=('todome')
conflicts=('todome')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
  _tag=$(git describe --tags | sed 's:^v::')
  _commits=$(git rev-list --count HEAD)
  _date=$(git log -1 --date=short --pretty=format:%cd)
  printf "%s_%s_%s\n" "${_commits}" "${_tag}" "${_date}" | sed 's/-/./g'
}

build() {
	cd "$_pkgname/src"
	make
}

package() {
	cd "$_pkgname/src"
	sudo make PREFIX=/usr DESTDIR="$pkgdir/" install
	cd "../"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
