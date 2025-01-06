# Maintainer: Nicola Revelant <nicolarevelant@outlook.com>

_pkgname=fractal-generator
pkgname=fractal-generator-git
pkgver=1.0.0.r0.gfbd0c47
pkgrel=1
pkgdesc='Mandelbrot and Julia fractal generator'
arch=('i686' 'x86_64')
url='https://github.com/nicolarevelant/fractal-generator'
license=('GPL-3.0-or-later')
depends=(
  'ffmpeg'
)
makedepends=(
	'git'
	'meson'
)

source=("$pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed -r 's/^r//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	arch-meson build
	meson compile -C build
}

package() {
	cd "$pkgname"
	meson install -C build --destdir "$pkgdir"
  install -Dm 644 logo/logo_512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/fractal-generator.png"
  install -Dm 644 desktop/fractal-generator.desktop -t "$pkgdir/usr/share/applications"
}

