# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=7-zip
pkgver=21.02
pkgrel=2
pkgdesc="File archiver with a high compression ratio"
url="https://www.7-zip.org"
license=(LGPL)
arch=(x86_64 i686 aarch64 armv7h)
conflicts=(p7zip)
source=(https://7-zip.org/a/7z2102-src.7z)
sha256sums=('ee9755feaa034e7075712bc6b1fad25440bd0a8f21f106a16e37bc4b409f1122')

prepare() {
	sed -i 's|CFLAGS_WARN_WALL = -Wall -Werror -Wextra|CFLAGS_WARN_WALL = -Wall -Wextra|g' CPP/7zip/7zip_gcc.mak
}

build() {
	cd CPP/7zip/Bundles/Alone2
	make -f ../../cmpl_gcc.mak
}

package() {
	install -Dt "${pkgdir}"/usr/bin -m0755 CPP/7zip/Bundles/Alone2/b/g/7zz
	ln -sf 7zz "${pkgdir}"/usr/bin/7z
	install -Dt "${pkgdir}"/usr/share/licenses/${pkgname} -m0644 DOC/{copying,License,unRarLicense}.txt
	install -Dt "${pkgdir}"/usr/share/doc/${pkgname} -m0644 DOC/{7zC,7zFormat,lzma,Methods,readme,src-history}.txt
}

