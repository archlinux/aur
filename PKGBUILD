#Maintainer: Rene Peinthor <peinthor@gmail.com>
pkgname=smartsvn
pkgver=9.2.3
_pkgver=9_2_3
pkgrel=1
pkgdesc="A Subversion(SVN) GUI client written in Java"
arch=("any")
url="http://www.smartsvn.com/"
license=('custom')
depends=("java-runtime" "desktop-file-utils" "sh")
makedepends=()
provides=(smartsvn=$pkgver)
source=(smartsvn.desktop https://www.smartsvn.com/downloads/${pkgname}/${pkgname}-linux-${_pkgver}.tar.gz)
install="smartsvn.install"
backup=('opt/smartsvn/bin/smartsvn.sh') # might contain changes to max heap size and vmoptions
sha1sums=(
'0088ddbbc7c678233c4153dae1cdb052115bcb69'
'79242410c7f14138d389e9a539b9344b351ac61f'
)


extracted="$pkgname"

build() {
	cd "$srcdir"
	tar xzf ${pkgname}-linux-${_pkgver}.tar.gz
}

package() {
	cd "$srcdir"

	install -D -m644 "${extracted}"/license.html "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
	mkdir -p "${pkgdir}"/opt
	mv "${extracted}" ${pkgdir}/opt/$pkgname || return 1

	install -D -m644 smartsvn.desktop "${pkgdir}"/usr/share/applications/smartsvn.desktop
}
