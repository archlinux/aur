# Maintainer: ReK2 <rek2 at hispagatos dot org>
# for Minase Terminal file manager

pkgname=minase-git
_pkgname=minase
pkgver=r25.ad66673
pkgrel=1
arch=('x86_64')
url="https://github.com/SAT1226/Minase"
pkgdesc='Minase is terminal file manager. With sixel support'
license=('MIT')
depends=('uchardet' 'glibc' 'taglib')
optdepends=('libsixel' 'trash-cli' 'vidir' 'unarchiver' 'libarchive' 'cmigemo-git')
provides=('minase')
source=(${_pkgname}::git+https://github.com/SAT1226/Minase.git)
sha512sums=('SKIP')

pkgver() {
	  cd "$srcdir/${_pkgname}"
	    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	  cd "$srcdir/${_pkgname}"
	    cmake .
	    make PREFIX=/usr VERSION="$(pkgver)"
}

package() {
	  cd "$srcdir/${_pkgname}"
	  make PREFIX=/usr DESTDIR=$pkgdir install
	  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/minase/"
}
