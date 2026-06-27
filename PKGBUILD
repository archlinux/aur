# Maintainer: Daniel Conley <daniel.conley@danii.dev>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Manuel Stoeckl <com dоt mstoeckl аt wppkgb>
# SPDX-License-Identifier: 0BSD
pkgname=waypipe0.9
_pkgname=waypipe
pkgver=0.9.2
pkgrel=1
provides=("waypipe=$pkgver")
conflicts=('waypipe')
pkgdesc='A proxy for Wayland protocol applications; 0.9 compatibility version'
arch=('x86_64')
url='https://gitlab.freedesktop.org/mstoeckl/waypipe'
license=('MIT')
makedepends=('meson' 'ninja' 'scdoc' 'pkgconf' 'clang')
depends=('lz4' 'zstd' 'mesa' 'ffmpeg')
optdepends=('openssh: recommended transport')
source=("https://gitlab.freedesktop.org/mstoeckl/$_pkgname/-/archive/v$pkgver/$_pkgname-v$pkgver.tar.gz")
sha256sums=('76d7b34ced11dca56a6db878ec84f78d1eef1f93b33b1ad7336f0794b73955c2')

build() {
	mkdir -p build
	meson build "$_pkgname-v$pkgver" --buildtype debugoptimized -Dwerror=false --prefix /usr
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C "$srcdir/build" install
	install -Dm644 "$_pkgname-v$pkgver/COPYING" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
