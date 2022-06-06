# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=sue
pkgdesc="Simple Unix Editor derived from Eric Meyer's VDE"
pkgver=0.7i
pkgrel=1
url='https://texteditors.org/cgi-bin/wiki.pl?SUE'
depends=(ncurses)
license=(GPL)
arch=(x86_64)
source=("http://sites.google.com/site/vdeeditor/Home/vde-files/files-section/sue${pkgver//./}.tgz"
        "http://sites.google.com/site/vdeeditor/Home/vde-files/files-section/sue.zip")
b2sums=('8e5df5f49b68d9afb9d44cf5c06ec36235e95d33537a1a02ed11c17fec19e8664a8fea9061a54a3dc9be5a61f09869613babeee53e2472dfb221412b06d07f73'
        '774ac41b74f6a423920218dceb49aa01f5ba21de297a41ad1a580a016b65d7bc3d20ef3786d2a8134722cc31a036745ab1089c62fe4d6e9876ea06c6d39ca4ab')


build () {
	make \
		EFLAGS="-DLINUX -DDOCOLOR $(pkg-config ncurses --cflags)" \
		LFLAGS="${LDFLAGS} $(pkg-config ncurses --libs)" \
		CFLAGS="${CFLAGS} -fcommon -std=gnu89" \
		CC="${CC}" \
		sue
}

package () {
	install -Dm755 sue "${pkgdir}/usr/bin/sue"

	# TODO: Convert back the manual to mandoc or something.
	install -Dm644 SUE.1 "${pkgdir}/usr/share/doc/${pkgname}/MANUAL"
	install -Dm645 README.SUE "${pkgdir}/usr/share/doc/${pkgname}/README"
}
