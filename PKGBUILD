# Maintainer: Amos Bird <amosbird@gmail.com>

pkgname=feh-git
pkgver=3.3.r0.g7774f62
pkgrel=1
pkgdesc='Fast and light imlib2-based image viewer'
arch=('x86_64')
url="https://github.com/derf/feh"
license=('custom:MIT')
depends=('imlib2' 'curl' 'libxinerama' 'libexif')
optdepends=('imagemagick: support more file formats')
makedepends=('libxt')
categories=('graphics')
source=("${pkgname}::git+https://github.com/derf/${pkgname}.git")
md5sums=('SKIP')
pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	make PREFIX=/usr exif=1 help=1 stat64=1
}

package() {
	cd "$pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
