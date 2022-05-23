# Maintainer: Donald Carr <d _at_ chaos-reins.com>

_pkgname=system76-scheduler
pkgname=${_pkgname}
pkgver=1.2.0
pkgrel=2
pkgdesc='system76 userspace scheduler'
arch=(x86_64)
url='https://github.com/pop-os/system76-scheduler'
license=('MPL-2')
depends=(bcc-tools python-bcc)
makedepends=(git rust just linux-headers)
source=("https://github.com/pop-os/system76-scheduler/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('c48cd5ba62d499dbf01eb9ab44d592e6213fd5f4d4391e2a06430c6806f8f08d')
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
