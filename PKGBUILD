# Maintainer: eugene hwang <hwang dot eug at gmail dot com>

_pkgname=persistent-evdev
pkgname=persistent-evdev-git
pkgver=r3.c2a8c30
pkgrel=2
pkgdesc="Creates a udev proxy device to pass to QEMU"
arch=('x86_64')
license=('MIT')
provides=('persistent-evdev')
conflicts=('persistent-evdev')
depends=('python' 'python-evdev' 'python-pyudev')
source=("git+https://github.com/aiberia/persistent-evdev.git")
sha256sums=('SKIP')
install='persistent-evdev.install'

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "${pkgdir}/opt"
  cp -r "${srcdir}/${_pkgname}" "${pkgdir}/opt/${_pkgname}"

  mkdir -p ${pkgdir}/etc/systemd/system
  ln -s "/opt/${_pkgname}/systemd/persistent-evdev.service" "${pkgdir}/etc/systemd/system"

  mkdir -p ${pkgdir}/etc/udev/rules.d
  ln -s "/opt/${_pkgname}/udev/60-persistent-input-uinput.rules" "${pkgdir}/etc/udev/rules.d"
}
