# Maintainer: Marenz <aur@supradigital.org>
# Maintainer: Kamil Śliwak <cameel2+aur/at/gmail/com>

pkgname=evmone
pkgver=0.15.0
pkgrel=1
pkgdesc="Fast Ethereum Virtual Machine implementation"
arch=(x86_64)
url="https://github.com/ethereum/${pkgname}"
license=(Apache-2.0)
depends=(glibc gcc-libs)
makedepends=(cmake git)
md5sums=('SKIP')

source=(
	"git+${url}.git#tag=v${pkgver}"
)

build ()
{
	echo "${PWD}"
	cd "${pkgname}"
	git submodule update --init
	mkdir build -p
	cd build
	cmake .. -DEVMONE_TESTING=OFF -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package ()
{
	cd "${pkgname}/build"
	make DESTDIR="${pkgdir}" prefix=/usr install
}
