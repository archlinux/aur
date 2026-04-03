# Maintainer: uffe
pkgname=heirloom-ex-vi
pkgver=4.1.3
pkgrel=1
pkgdesc="The traditional vi (heirloom vi with many enhancements from Gunnar Ritter)"
arch=("i686" "x86_64")
url="https://github.com/n-t-roff/heirloom-ex-vi"
license=("0BSD")
depends=("glibc" "ncurses" "bash")
provides=("vi" "ex" "edit" "ex" "vedit" "view" "${pkgname}")
replaces=("vi")
conflicts=("vi" "${pkgname}" "heirloom-ex-vi-cvs")
source=("https://github.com/n-t-roff/heirloom-ex-vi/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=("7d3d38f94ce651b9521c0db2b824f85f2e587afab23951b51484f8f21d3614f3")

#pkgver()
#{
#	cd "${srcdir}/${pkgname}-${pkgver}"
#	printf "%s.r%s.%s" \
#		"$(git describe --tags | sed -E 's/-.*//;s/-/./g')" \
#		"$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

build()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure
	make CFLAGS="-std=gnu89"
}

package()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" PREFIX="/usr" LIBEXECDIR="/usr/bin" install
	install -D -m644 README $pkgdir/usr/share/doc/${pkgname}/README
	install -m644 README.md $pkgdir/usr/share/doc/${pkgname}/README.md
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}

# EOF
