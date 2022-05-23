# Maintainer: Donald Carr <d _at_ chaos-reins.com>

_pkgname=system76-scheduler
pkgname=${_pkgname}-git
pkgver=1.2.0.1.gc103229
pkgrel=2
epoch=2
pkgdesc='system76 userspace scheduler'
arch=(x86_64)
url='https://github.com/pop-os/system76-scheduler'
license=('MPL-2')
provides=(${_pkgname})
conflicts=(${_pkgname})
depends=(bcc-tools python-bcc)
makedepends=(git rust just linux-headers)
source=("git+$url")
sha256sums=('SKIP')
install=install.sh
backup=(
  'etc/system76-scheduler/assignments/default.ron'
)

pkgver() {
  cd ${_pkgname}
  git describe --tags | sed -e "s/^v//" | tr '-' '.'
}

build() {
  cd ${_pkgname}
  export EXECSNOOP_PATH=/usr/share/bcc/tools/execsnoop
  just all
}

package() {
  cd ${_pkgname}
  just rootdir=${pkgdir} install
}
