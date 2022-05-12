# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

pkgname=7-zip
pkgver=21.07
pkgrel=3
pkgdesc="File archiver with a high compression ratio"
url="https://www.7-zip.org"
license=(LGPL)
arch=(x86_64)
makedepends=(uasm)
source=(https://7-zip.org/a/7z2107-src.7z
		01-uasm.patch
		02-gcc-12.patch
		03-hardening.patch)
sha256sums=('d1074d56f415aab99d99e597a7b66dc455dba6349ae8a4c89df76475b6a1284c'
            '76cabefa3bdf9fa2b6a7af1fc549534684b17f6785a32b0e1bc1f459d401eb74'
            'e4d34366e091b8404dd04f02bcad46518d2930ec0b4a420e1316db020234b085'
            '0fd25bfb4f9f330573f94c61c9708dc15791bb51a5b294a5ab81b0463de08453')

prepare() {
	patch -Np1 -i 01-uasm.patch
	patch -Np1 -i 02-gcc-12.patch
	patch -Np1 -i 03-hardening.patch
}

build() {
	cd CPP/7zip/Bundles/Alone2
	make -f ../../cmpl_gcc_x64.mak
}

package() {
	install -Dt "${pkgdir}"/usr/bin -m0755 CPP/7zip/Bundles/Alone2/b/g_x64/7zz
	install -Dt "${pkgdir}"/usr/share/licenses/${pkgname} -m0644 DOC/{copying,License,unRarLicense}.txt
	install -Dt "${pkgdir}"/usr/share/doc/${pkgname} -m0644 DOC/{7zC,7zFormat,lzma,Methods,readme,src-history}.txt
}

