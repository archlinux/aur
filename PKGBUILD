# Maintainer: Donald Carr <d _at_ chaos-reins.com>

_pkgname=system76-scheduler
pkgname=${_pkgname}
pkgver=2.0.0
pkgrel=2
pkgdesc='system76 userspace scheduler'
arch=(x86_64)
url='https://github.com/pop-os/system76-scheduler'
license=('MPL-2')
depends=(bcc-tools python-bcc)
makedepends=(git rust just linux-headers pipewire)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/pop-os/system76-scheduler/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('fe198bcd81f1c75177286f9fb1deb678e66dc718ea25463cb26d0f842231e524')
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
  just sysconfdir=/usr/share rootdir=${pkgdir} install
}
