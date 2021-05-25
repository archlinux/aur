# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=hidrdd
pkgver=2.0
pkgrel=1
pkgdesc="USB Human Interface Device (HID) Report Descriptor Decoder."
arch=(any)
url="https://github.com/abend0c1/hidrdd"
license=(GPL3)
depends=(rexx)
source=("https://github.com/abend0c1/hidrdd/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('428287d53acf84488e426bf60ef34070a66a74ab2a8634d8a69b987a60fd7ec0')

prepare() {
	cd "${srcdir}/hidrdd-${pkgver}"
	sed  '1s;^;#!/usr/bin/env rexx\n;' -i rd.rex
	sed  's;rd\.conf;/etc/rd.conf;' -i rd.rex
}

package() {
	cd "${srcdir}/hidrdd-${pkgver}"
	install -D -m755 rd.rex "${pkgdir}/usr/bin/rd"
	install -D -m644 rd.conf "${pkgdir}/etc/rd.conf"
}
