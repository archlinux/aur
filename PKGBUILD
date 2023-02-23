# Maintainer: zus <zus at gomoreno dot me>

_pkgbase='huawei-wmi'
pkgname="${_pkgbase}-dkms-git"
pkgver=r112.18c40de
pkgrel=1
pkgdesc='Huawei WMI laptop extras driver (DKMS master branch)'
url='https://github.com/aymanbagabas/Huawei-WMI'
arch=('x86_64')
license=('GPLv2')
provides=("${_pkgbase}-dkms")
conflicts=("${_pkgbase}-dkms")
depends=('dkms')
makedepends=('git')
source=("${_pkgbase}::git+https://github.com/aymanbagabas/Huawei-WMI#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${_pkgbase}/dkms"
	dir="$(ls | tail -1)"
	cd "$dir"
	install -Dm644 'dkms.conf' 'Makefile' '../../huawei-wmi.c' -t "${pkgdir}/usr/src/${dir}"
  echo "Reboot is required"
}
