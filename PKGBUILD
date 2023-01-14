# Maintainer: MatMoul <matmoul at the google email domain which is .com>

_githubuser=matmoul
_githubrepo=g810-led
_pkgtagname=v0.4.3

pkgname=g810-led
pkgver=0.4.3
pkgrel=1
pkgdesc='Linux led controller for Logitech G213, G410, G413. G512, G513, G610, G810, G815, G910 and GPRO Keyboards'
arch=('any')
url="https://github.com/${_githubuser}/${_githubrepo}"
license=('GPL3')
depends=('hidapi')
makedepends=('git' 'gcc' 'make')
optdepends=('libusb: old implementation, for developpers')
install="${pkgname}.install"
provides=("g213-led=${pkgver}" 
          "g410-led=${pkgver}"
          "g413-led=${pkgver}"
          "g512-led=${pkgver}"
          "g513-led=${pkgver}"
          "g610-led=${pkgver}"
          "g810-led=${pkgver}"
          "g815-led=${pkgver}"
          "g910-led=${pkgver}"
          "gpro-led=${pkgver}")
backup=("etc/${_githubrepo}/profile" "etc/${_githubrepo}/reboot" "etc/udev/rules.d/${_githubrepo}.rules")
source=("${_githubrepo}::https://github.com/${_githubuser}/${_githubrepo}/archive/refs/tags/${_pkgtagname}.tar.gz")
sha256sums=('8af6275aa190fd17fdef36079d51361874c88e2df0b23a76e7651d4f7c7c99fc')

build() {
	cd "${_githubrepo}-${pkgver}"
	make bin
}

package() {
	cd "${_githubrepo}-${pkgver}"
	make DESTDIR="${pkgdir}" setup
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
	cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
	cp ${pkgdir}/etc/${_githubrepo}/samples/group_keys ${pkgdir}/etc/${_githubrepo}/profile
	cp ${pkgdir}/etc/${_githubrepo}/samples/all_off ${pkgdir}/etc/${_githubrepo}/reboot
	chmod -R 755 ${pkgdir}/etc
	chmod -R 755 ${pkgdir}/usr
	chmod -R 644 ${pkgdir}/etc/${_githubrepo}/samples/*
	chmod 644 ${pkgdir}/etc/udev/rules.d/${_githubrepo}.rules
	chmod 644 ${pkgdir}/usr/lib/systemd/system/*
	chmod 755 ${pkgdir}/usr/share/licenses/${pkgname}
	chmod 644 ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
