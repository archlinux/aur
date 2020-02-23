# Maintainer: Keinv Yue <yuezk001@gmail.com>

pkgname=globalprotect-openconnect
_gitname=GlobalProtect-openconnect
pkgver=1.1.0
pkgrel=1
pkgdesc="A GlobalProtect VPN client (GUI) for Linux based on Openconnect and built with Qt5, supports SAML auth mode."
arch=(x86_64)
url="https://github.com/yuezk/${_gitname}"
license=('GPL3')
depends=(qt5-base qt5-webengine qt5-websockets)
makedepends=()
source=(
	"${_gitname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
	"https://github.com/itay-grudev/SingleApplication/archive/v3.0.19.tar.gz"
)

sha256sums=('SKIP' 'SKIP');

prepare() {
	mv "$srcdir/SingleApplication-3.0.19" -T "$srcdir/${_gitname}-${pkgver}/singleapplication"
}

build() {
	cd "$srcdir/${_gitname}-${pkgver}"
	qmake CONFIG+=release "${srcdir}/${_gitname}-${pkgver}/GlobalProtect-openconnect.pro"
	make
}

package() {
	cd "$srcdir/${_gitname}-${pkgver}"
	make INSTALL_ROOT="$pkgdir/" install
}
