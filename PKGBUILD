# Maintainer: Jingrong Chen <crazyboycjr at gmail dot com>
pkgname=alilang
_pkgname=${pkgname//-/_}
pkgver=1.0.0
pkgrel=2
pkgdesc="Alilang"
arch=('x86_64')
url="https://alilang.alibaba-inc.com"
license=('none')
depends=('qtwebkit' 'openssl')
source=("https://alilang.alibaba-inc.com/alilang/alilang.deb")

pkgver() {
	cd "${srcdir}"

	tar xzvf control.tar.gz -C "${srcdir}" 2>&1 >/dev/null

	echo "$(sed -ne 's/^Version: \([^-]\+\).*/\1/p' ${srcdir}/control)"
}

install="${_pkgname}.install"

package() {
	tar xJvf data.tar.xz -C "${pkgdir}"
	sed -ine 's/^Exec=.*/Exec=gksu QT_X11_NO_MITSHM=1 alilang/' "${pkgdir}"/usr/share/applications/alilang.desktop

	find "${pkgdir}" -type d | xargs chmod 755

	ln -fs /usr/bin/AliLangAgent "${pkgdir}"/usr/bin/alilang
	mkdir -p "${pkgdir}"/etc/init.d
	ln -fs /usr/bin/AliLangAgent "${pkgdir}"/etc/init.d/alilang

	find "${pkgdir}" -type f | xargs chown root:root
}

md5sums=('05c59383a8c7c8f27f55ccd37c7e3558')
