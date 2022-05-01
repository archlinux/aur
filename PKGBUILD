# Maintainer: Simon Marcher <marchersimon@zohomail.eu>
pkgname=tldr-cpp-git
pkgver=1.7.2
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
  ( git tag | tail -n 1 ; echo "." ; git rev-list $(git tag | tail -n 1)..HEAD --count ) | tr -d '\n' # returns the number of commits since the last tag
}

build() {
	cd tldr-cpp
	make tldr-pkg
}

package() {
	cd tldr-cpp
	mkdir -p ${pkgdir}/usr/bin
	make DESTDIR="${pkgdir}" install-pkg
}
