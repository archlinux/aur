# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=a2tools
pkgver=003
pkgrel=1
pkgdesc="a2tools (copy data to/from Apple II DOS 3.3 disk images)"
arch=('pentium4' 'i686' 'i486' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="ftp://ftp.apple.asimov.net/pub/apple_II/utility/"
license=('GPL')
source=("ftp://ftp.apple.asimov.net/pub/apple_II/utility/${pkgname}-v${pkgver}.zip")
sha256sums=('432c994510b73577557331ec7697c32e28a2c324abb52c1bcc08289c51bcd927')

build() {
	cd "${srcdir}/${pkgname}"

        gcc -o a2tools ${CFLAGS} a2tools.c
}

package(){
	cd "${srcdir}/${pkgname}"

	install -Dm775 a2tools "$pkgdir"/usr/bin/a2tools
        ln -s a2tools "$pkgdir"/usr/bin/a2ls
        ln -s a2tools "$pkgdir"/usr/bin/a2in
        ln -s a2tools "$pkgdir"/usr/bin/a2out
        ln -s a2tools "$pkgdir"/usr/bin/a2rm
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
        install -Dm644 a2tools.6 "$pkgdir"/usr/share/man/man6/a2tools.6
	gzip -9 "$pkgdir"/usr/share/man/man6/a2tools.6
}
