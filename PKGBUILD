# Maintainer: Evan Purkhiser <evanpurkhiser@gmail.com>

_gitname=keyfinder-cli

pkgname=keyfinder-cli-git
pkgver=34.65ffc11
pkgrel=1
pkgdesc="A DJ friendly tool for estimating the musical key of an audio file"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/EvanPurkhiser/${_gitname}"
depends=(libkeyfinder-git ffmpeg)
makedepends=(git boost)
source=("git://github.com/EvanPurkhiser/${_gitname}")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "${srcdir}/${_gitname}"
	make
}

package() {
	cd "${srcdir}/${_gitname}"

	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
