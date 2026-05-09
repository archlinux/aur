# Maintainer: Kanishka Purohit <kanishka at 1nfr4 dot red>
pkgbase='libubootenv'
pkgname=('libubootenv' 'libubootenv-tools')
pkgver='0.3.7'
pkgrel=1
arch=('x86_64')
url='https://github.com/sbabic/libubootenv'
license=('LGPL-2.1-or-later')
depends=('zlib' 'libyaml')
makedepends=('cmake>=3.5')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sbabic/libubootenv/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=(b7737b5a71de7da047156123dbb5b86af60da107197052f0b22cb94ac0a51306cd8a06fb72fe01c170528ea254a053fe6b0cb50baa41349ccfa8de1509dab133)

build() {
	cmake -B build -S "${pkgbase}-${pkgver}" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DDEFAULT_CFG_FILE=/etc/fw_env.config \
		-DDEFAULT_ENV_FILE=/etc/u-boot-initial-env \
		-DBUILD_DOC=OFF
	cmake --build build 
}

package_libubootenv() {
	pkgdesc='Generic library to access and modify U-Boot environment from User Space'
	provides=('libubootenv.so')
	DESTDIR="$pkgdir" cmake --install build
	rm -rf "$pkgdir/usr/bin"
}

package_libubootenv-tools() {
	pkgdesc='Generic tools to access and modify U-Boot environment from User Space'
	conflicts=('uboot-tools')
	install="libubootenv-tools.install"
	DESTDIR="$pkgdir" cmake --install build
	rm -rf "$pkgdir/usr/lib"
	rm -rf "$pkgdir/usr/include"
}

