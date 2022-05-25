# Maintainer: Donald Carr <d _at_ chaos-reins.com>

_pkgname=system76-scheduler
pkgname=${_pkgname}
pkgver=1.2.1
pkgrel=1
pkgdesc='system76 userspace scheduler'
arch=(x86_64)
url='https://github.com/pop-os/system76-scheduler'
license=('MPL-2')
depends=(bcc-tools python-bcc)
makedepends=(git rust just linux-headers)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/pop-os/system76-scheduler/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6d9adf1a9136956710843111a229df46b9f03f3db00017715e063711180fd93d')
install=install.sh
backup=(
  'etc/system76-scheduler/assignments/default.ron'
)

build() {
  cd ${_pkgname}-${pkgver}
  export EXECSNOOP_PATH=/usr/share/bcc/tools/execsnoop
  just all
}

package() {
  cd ${_pkgname}-${pkgver}
  just rootdir=${pkgdir} install
}
