# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=dmtx-utils
pkgver=0.7.6
pkgrel=2
pkgdesc='Utilities to libdmtx'
url='https://github.com/dmtx/dmtx-utils'
arch=('i686' 'x86_64')
license=('GPL-2.0-only')
depends=('glibc' 'libdmtx' 'imagemagick')
source=("dmtx-utils-${pkgver}::https://github.com/dmtx/dmtx-utils/archive/v${pkgver}.tar.gz"
	0001-Attempt-to-prevent-buffer-overflow-when-reading-inpu.patch
)
sha256sums=('0d396ec14f32a8cf9e08369a4122a16aa2e5fa1675e02218f16f1ab777ea2a28'
            'fcb483c2df05db40890a5d44bc7de54c93b4ecc5e67ad1ed6045e85cc08b127e')

prepare() {
	cd "${srcdir}"/${pkgname}-${pkgver}

	patch -p1 < "${srcdir}"/0001-Attempt-to-prevent-buffer-overflow-when-reading-inpu.patch
}

build() {
	cd "${srcdir}"/${pkgname}-${pkgver}
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}"/${pkgname}-${pkgver}
	make DESTDIR="${pkgdir}" install
}
