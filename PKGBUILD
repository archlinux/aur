# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>
# Contributor: Cyker Way <cykerway@gmail.com>

# Based on qemu-6828's PKGBUILD
pkgname=qemu-ugent
pkgver=0.13.0
pkgrel=1
pkgdesc="QEMU 0.13.0 required for UGent 'Besturingssystemen' course"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1' 'BSD')
url="http://wiki.qemu.org/Index.html"
makedepends=('texi2html' 'perl')
depends=('sdl' 'alsa-lib' 'esound' 'gnutls>=2.4.1' 'bluez' 'vde2' 'util-linux-ng' 'curl' 'libsasl')
conflicts=('qemu' 'seabios')
source=("http://wiki.qemu-project.org/download/qemu-${pkgver}.tar.gz"
	"qemu.patch")
md5sums=('397a0d665da8ba9d3b9583629f3d6421'
	'ce1f43c4d76f426ba796a6524fe9fc65')

prepare(){
	cd "${srcdir}/qemu-${pkgver}"

	# Replace 'Schütz' by 'Schutz'
	sed -e 's/ü/u/g' -i qemu-doc.texi

	# Apply small patches
	patch -p1 < ../qemu.patch

	./configure --prefix=/usr --target-list="i386-softmmu"
}
build()
{
	cd "${srcdir}/qemu-${pkgver}"

	make
}

package(){
	cd "${srcdir}/qemu-${pkgver}"

	make DESTDIR=${pkgdir} install
}
