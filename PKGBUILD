# Maintainer: Marenz <aur@supradigital.org>
# Maintainer: Kamil Śliwak <cameel2+aur/at/gmail/com>

pkgname=evmone
pkgver=0.10.0
pkgrel=1
pkgdesc="Fast Ethereum Virtual Machine implementation"
arch=('any')
url="https://github.com/ethereum/evmone/"
license=('Apache')
depends=()
makedepends=('cmake' 'gcc' 'git')
md5sums=('SKIP')

source=(
	"git+https://github.com/ethereum/evmone.git#tag=v${pkgver}"
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
