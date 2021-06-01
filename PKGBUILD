# Maintainer: Ragnar Groot Koerkamp <ragnar.grootkoerkamp@gmail.com>

_pkgname=feh
pkgname=feh-preload-next-image-git
pkgver=2.22.2.r367.gb09d8f9
pkgrel=1
pkgdesc='preload-next-image fork of Feh'
arch=('x86_64')
url="https://github.com/RagnarGrootKoerkamp/feh"
license=('custom:MIT')
depends=('imlib2' 'curl' 'libxinerama' 'libexif')
optdepends=('imagemagick: support more file formats')
makedepends=('git' 'libxt')
categories=('graphics')
source=("${_pkgname}::git+https://github.com/RagnarGrootKoerkamp/${_pkgname}.git#branch=preload-next-image")
md5sums=('SKIP')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}")

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	make PREFIX=/usr exif=1 help=1 stat64=1
}

package() {
	cd "$_pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
