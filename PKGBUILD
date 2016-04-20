# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>

_srcname=linux-4.5
pkgname=linux-sisfb-dkms
pkgver=4.5.1
pkgrel=1
pkgdesc="SiS framebuffer kernel modules (DKMS)"
arch=('any')
url="https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/plain/Documentation/fb/sisfb.txt"
license=('GPL2')
depends=('dkms')
source=('dkms.conf' 'Makefile'
        "https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.xz"
        "https://www.kernel.org/pub/linux/kernel/v4.x/${_srcname}.tar.sign"
        "https://www.kernel.org/pub/linux/kernel/v4.x/patch-${pkgver}.sign")
sha256sums=('862317a4fdca4186bfcc8754d0ab1b08c2590a7f1b8e1e4661110010418d38b7'
            '822376d994751765315a465350785089d9f1fa03fdedf58051b955497723aa8a'
            'a40defb401e01b37d6b8c8ad5c1bbab665be6ac6310cdeed59950c96b31a519c'
            '060ad091ebfa2b63d62e86beaf68c3a5d4638c506c3ac941c1825ba756e830b1'
            'SKIP'
            'SKIP')
validpgpkeys=('ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E') # Greg Kroah-Hartman

package() {
	# Copy Makefile and dkms.conf
	install -Dm644 Makefile "${pkgdir}"/usr/src/${pkgname}-${pkgver}/Makefile
	install -Dm644 dkms.conf "${pkgdir}"/usr/src/${pkgname}-${pkgver}/dkms.conf

	# Set name and version
	sed -e "s/@PKGNAME@/${pkgname}/" \
		-e "s/@PKGVER@/${pkgver}/" \
		-i "${pkgdir}"/usr/src/${pkgname}-${pkgver}/dkms.conf

	# Copy sources
	mkdir -p "${pkgdir}/usr/src/${pkgname}-${pkgver}/drivers/video/fbdev/"
	cp -r "${srcdir}/${_srcname}/drivers/video/fbdev/sis" "${pkgdir}/usr/src/${pkgname}-${pkgver}/drivers/video/fbdev/sis"
}
