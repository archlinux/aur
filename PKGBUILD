# Maintainer: Beshr Ghalil <bshrghalil@gmail.com>
pkgname=todome-git
_pkgname=todome
pkgver=77__2022.01.10
pkgrel=2
epoch=
pkgdesc="Language agnostic tool that collects TODOs, FIXMEs and BUGs in the source code."
arch=('x86_64' 'i686')
url="https://www.github.com/BishrGhalil/todome.git"
license=('GPL')
depends=('sqlite' 'ncurses' 'git')
optdepends=('pandoc')
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
	cd "$_pkgname"
	make 
}

package() {
	cd "$_pkgname"
	sudo make PREFIX=/usr DESTDIR="$pkgdir/" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
