# Maintainer: Lukas Pöschl <lukas@smart-ies.de>

_google_version=release-R100-14526.B-main
pkgbase=chromium-ectool
pkgname=chromium-ectool
pkgver=R100
pkgrel=1
pkgdesc="Query and send commands to ChromiumOS EC from userspace."
arch=('x86_64')
url="https://chromium.googlesource.com/chromiumos/platform/ec"
license=('BSD-3-Clause')
depends=('libftdi' 'libusb')
makedepends=('make' 'gcc')
source=("https://chromium.googlesource.com/chromiumos/platform/ec/+archive/refs/heads/${_google_version}.tar.gz")
noextract=("${_google_version}.tar.gz")
sha256sums=('d8bda64544f11e65fac18b796dbedf1750bf27847358c8815943e525c7aa527e')

prepare() {
	mkdir -p "$pkgname-$pkgver"
    cd "$pkgname-$pkgver"
    bsdtar -xf ../$_google_version.tar.gz
}

build() {
	cd "$pkgname-$pkgver"
	BOARD=host make utils-host
}

package() {
	cd "$pkgname-$pkgver"
    install -Dm755 build/host/util/ectool $pkgdir/usr/bin/ectool
}
