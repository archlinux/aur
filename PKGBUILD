# Maintainer: Simon Marcher <marchersimon@zohomail.eu>
pkgname=tldr-cpp-git
pkgver=1.6
pkgrel=1
pkgdesc="The all-in-one tldr client for users and contributors"
arch=(x86_64)
url="https://github.com/marchersimon/tldr-cpp.git"
license=('GPL3')
makedepends=(git make gcc curl libzip)
provides=(tldr)
conflicts=(tldr)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd tldr-cpp
  git rev-list $(git tag | head -n 1)..HEAD --count # returns the number of commits since the last tag
}

build() {
	cd tldr-cpp
	make
}

package() {
	cd tldr-cpp
	mkdir -p ${pkgdir}/usr/bin
	make DESTDIR="${pkgdir}" install
}
