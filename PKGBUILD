# Maintainer: MatMoul <matmoul at the google email domain which is .com>

_githubuser=matmoul
_githubrepo=g810-led
_gitcommit=efa3c35e74f01a2ed2346320da8bad411bfe8ed8

pkgname=g810-led-git
pkgver=0.4.3.r1.efa3c35
pkgrel=1
pkgdesc='Linux led controller for Logitech G213, G410, G413. G512, G513, G610, G810, G815, G910 and GPRO Keyboards'
arch=('any')
url="https://github.com/${_githubuser}/${_githubrepo}"
license=('GPL3')
depends=('hidapi')
makedepends=('git' 'systemd')
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
source=("git+https://github.com/${_githubuser}/${_githubrepo}.git#commit=${_gitcommit}")
sha256sums=('SKIP')

build() {
	cd "${_githubrepo}"
	make bin
}

package() {
	cd "${_githubrepo}"
	make DESTDIR="${pkgdir}" setup
	mkdir -p ${pkgdir}/usr/share/licenses/${_githubrepo}
	cp LICENSE ${pkgdir}/usr/share/licenses/${_githubrepo}
	cp ${pkgdir}/etc/${_githubrepo}/samples/group_keys ${pkgdir}/etc/${_githubrepo}/profile
	cp ${pkgdir}/etc/${_githubrepo}/samples/all_off ${pkgdir}/etc/${_githubrepo}/reboot
	chmod -R 755 ${pkgdir}/etc
	chmod -R 755 ${pkgdir}/usr
	chmod -R 644 ${pkgdir}/etc/${_githubrepo}/samples/*
	chmod 644 ${pkgdir}/etc/udev/rules.d/${_githubrepo}.rules
	chmod 644 ${pkgdir}/usr/lib/systemd/system/*
	chmod 755 ${pkgdir}/usr/share/licenses/${_githubrepo}
	chmod 644 ${pkgdir}/usr/share/licenses/${_githubrepo}/LICENSE
}
