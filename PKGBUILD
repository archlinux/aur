# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034

pkgname=neatimage
pkgver=8.6
pkgrel=1
pkgdesc="Best noise reduction fro digital cameras and scanners"
arch=('x86_64')
url="https://ni.neatvideo.com/"
license=('custom')
depends=(bzip2 expat fontconfig freetype2 gcc-libs glib2 glibc graphite harfbuzz libpng libutil-linux libx11 libxau libxcb libxdmcp libxext libxi pcre zlib)
source=('https://ni.neatvideo.com/demo/ni8/sld/NeatImageSL.Demo.Intel64.tgz')
sha512sums=('7aa8888407caad0613674cb2fe8370782e2aabb87b8eaba3c9a7631c959901cb03f0759d67d325236bbf5cf40a3b7c3d29152cf8e2ddcb69f7d7866ff912cf95')
b2sums=('2304a58333b3213f5861680e0f77972c0d6c7964e144346375f1bed8c758a01ee3e5ae549cd7674d30808ee449d4f203b6961aca3d0abf828fa77cc2eab846a4')

package() {
	echo | # “True” silent mode does not appear to do anything…
		./NeatImageSL.Demo.Intel64.run --prefix "$pkgdir"/opt/NeatImage --mode console \
	|| true # … and the installer returns 1 when it succeeds.

	rm "$pkgdir"/opt/NeatImage/uninstall

	install -Dm644 "$pkgdir"/opt/NeatImage/Legal.txt "$pkgdir"/usr/share/licenses/"$pkgname"/Legal.txt
#	install -Dm755 neatimage "$pkgdir"/usr/bin/neatimage
	mkdir -p "$pkgdir"/usr/bin
	echo -e '#!/bin/bash \n cd /opt/NeatImage/ && ./NeatImage "$@"' > "$pkgdir"/usr/bin/NeatImage
	echo -e '#!/bin/bash \n cd /opt/NeatImage/ && ./NeatImageCL "$@"' > "$pkgdir"/usr/bin/NeatImageCL
	chmod +x "$pkgdir"/usr/bin/NeatImage{,CL}
}
