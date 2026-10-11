# Maintainer: mFat <newmfat@gmail.com>

pkgname=libfprint-tod-goodix-55a2
pkgver=0.1.0
pkgrel=1
pkgdesc='Goodix 27c6:55a2 fingerprint reader support for fprintd (libfprint TOD driver + bridge)'
arch=('x86_64')
url='https://github.com/mfat/goodix-55a2-linux'
license=('MIT')
depends=('libfprint-tod' 'fprintd' 'glib2' 'python' 'python-pyusb' 'python-numpy' 'python-opencv')
makedepends=('pkgconf')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('5e81df8d4b4217cddc31116ca1021baa1e912ed2e6ed30c74d88c85558f49768')

_srcdir="goodix-55a2-linux-${pkgver}"

build() {
	cd "${_srcdir}"
	make LIBEXECDIR=/usr/lib/goodix55a2
}

package() {
	cd "${_srcdir}"
	make install DESTDIR="${pkgdir}" LIBEXECDIR=/usr/lib/goodix55a2
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
