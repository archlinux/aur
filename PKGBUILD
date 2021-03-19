# Packager: Melissa Nuño <melissa.nuno@gmail.com>
# Maintainer: Melissa Nuño <melissa.nuno@gmail.com>

pkgname=vfio-kvm
pkgver=2.0.1
pkgrel=1
pkgdesc="A systemd service that send a D-Bus signal when a QEMU evdev hotkey is pressed."
arch=('any')
url='https://github.com/dangle/vfio-kvm'
license=('MIT')
depends=(
  'dbus'
  'libvirt'
  'python>=3.8'
  'python-evdev'
  'python-dbus-next'
  'qemu'
  'systemd')
optdepends=('ddccontrol: switch monitor inputs')
backup=('etc/vfio-kvm.yaml' 'etc/libvirt/hooks/qemu')
provides=(${pkgname})
conflicts=(${pkgname}-git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/dangle/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('723a647a564a80667e7cd93a47f22b3e')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "config/vfio-kvm.yaml" -t "${pkgdir}/etc"
  install -Dm644 "config/dbus/vfio-kvm.xml" "${pkgdir}/etc/dbus-1/system.d/vfio-kvm.conf"
  install -Dm644 "config/systemd/vfio-kvm.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm755 "config/libvirt/hooks/qemu" -t "${pkgdir}/etc/libvirt/hooks"
  install -Dm755 "vfio-kvm.py" "${pkgdir}/usr/bin/vfio-kvm"
}
