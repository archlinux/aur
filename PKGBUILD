# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgdesc='FUSE implementation of overlayfs'
pkgname=fuse-overlayfs
pkgver=0.5.2
pkgrel=1
arch=(x86_64)
url='https://github.com/containers/fuse-overlayfs'
license=(GPL3)
depends=(fuse3)
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('736001d18bec60c509548eb01793205754b84ca594597ed4d72da321ace55518d2847f4a5ac6a5a3d052dde1dd3480ab96649ddd5ae306c6f848c6dda0f2fdd3')

build ()
{
	cd "${pkgname}-${pkgver}"
	NOCONFIGURE=1 ./autogen.sh
	./configure --prefix=/usr \
		--sbindir=/usr/bin \
		--mandir=/usr/share/man
	make -j$(nproc)
}

package ()
{
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
