# Contributor: Patrick Bartels <pckbls@gmail.com>

pkgname=libao-sndio
_basepkg=libao
pkgver=1.2.0
pkgrel=1
pkgdesc='Cross-platform audio output library and plugins (with sndio support)'
url='http://xiph.org/ao/'
arch=('i686' 'x86_64')
license=('GPL')
depends=('alsa-lib' 'sndio')
makedepends=('libpulse')
backup=('etc/libao.conf')
conflicts=("libao" "libao-pulse")
provides=("libao" "libao-pulse")
replaces=("libao-pulse")
source=("http://downloads.xiph.org/releases/ao/${_basepkg}-${pkgver}.tar.gz"
        'libao.conf')
md5sums=('9f5dd20d7e95fd0dd72df5353829f097'
         '2c170aaec57e5cd9ea84ab1e400786cb')

build() {
	cd "${srcdir}/${_basepkg}-${pkgver}"

	./configure \
		--prefix=/usr \
		--enable-alsa-mmap \

	make
}

package() {
	cd "${srcdir}/${_basepkg}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 "${srcdir}"/libao.conf "${pkgdir}"/etc/libao.conf
}
