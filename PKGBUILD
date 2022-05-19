# Maintainer: Donald Carr <d _at_ chaos-reins.com>

_pkgname=system76-scheduler
pkgname=${_pkgname}-git
pkgver=1.2.0
pkgrel=1
epoch=2
pkgdesc='system76 userspace scheduler'
arch=(x86_64)
url='https://github.com/pop-os/system76-scheduler'
license=('MPL-2')
depends=()
conflicts=(${_pkgname})
makedepends=(git rust just bcc-tools)
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
