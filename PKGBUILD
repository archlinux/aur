# Maintainer: Donald Carr <d _at_ chaos-reins.com>

_pkgname=system76-scheduler
pkgname=${_pkgname}
pkgver=2.0.0
pkgrel=1
pkgdesc='system76 userspace scheduler'
arch=(x86_64)
url='https://github.com/pop-os/system76-scheduler'
license=('MPL-2')
depends=(bcc-tools python-bcc)
makedepends=(git rust just linux-headers clang pipewire pkgconf)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/pop-os/system76-scheduler/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('4eababf6649882363b6e5766e068420052cfbed7156a4df4a43af3bc8187242a')
install=install.sh
backup=(
  'etc/system76-scheduler/assignments/default.ron'
)

build() {
  cd ${_pkgname}-${pkgver}
  just execsnoop=/usr/share/bcc/tools/execsnoop build-release
}

package() {
  cd ${_pkgname}-${pkgver}
  just rootdir=${pkgdir} install
}
