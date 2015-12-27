# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=kvazaar
pkgver=0.7.2
pkgrel=1
pkgdesc="An open-source HEVC encoder licensed under LGPLv2.1"
arch=('i686' 'x86_64')
url="http://ultravideo.cs.tut.fi/#encoder"
license=('LGPL2.1')
depends=('glibc')
makedepends=('yasm')
provides=('kvazaar' 'libkvazaar.so')
conflicts=('kvazaar-git' 'libkvazaar' 'libkvazaar-git')
source=("$pkgname"-"$pkgver".tar.gz::"https://github.com/ultravideo/kvazaar/archive/v${pkgver}.tar.gz")
sha256sums=('623e955d1dbf4f469a57c540537e977f3cead2abcb43d640e2fa0f568168cede')

prepare() {
	cd "$pkgname"-"$pkgver"/src
	sed -i "s,PREFIX  = /usr/local,PREFIX  = /usr,g" Makefile
}

build() {
	cd "$pkgname"-"$pkgver"/src
	make
}

package() {
	cd "$pkgname"-"$pkgver"/src
	make DESTDIR="$pkgdir/" install
}
