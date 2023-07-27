# Maintainer: user20159 <https://aur.archlinux.org/account/user20159>

_repo_name=prometheus-pacman-exporter
pkgname=python-prometheus_pacman_exporter
pkgver=r10.ced7e59
pkgrel=1
pkgdesc="Export pacman metrics to prometheus"
arch=('any')
url='https://codeberg.org/LukeLR/prometheus-pacman-exporter'
license=('LGPL')
depends=(python python-prometheus_client)
makedepends=(python-setuptools)
install=${pkgname}.install
source=("git+${url}.git")
sha256sums=(SKIP)

pkgver() {
    cd "${srcdir}/$_repo_name"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/$_repo_name"
  python setup.py build
}

package() {
  cd "${srcdir}/$_repo_name"
  python setup.py install --optimize=1 --root="${pkgdir}/"
  install -D -m644 prometheus-pacman-exporter.service "${pkgdir}/usr/lib/systemd/system/prometheus-pacman-exporter.service"
  install -D -m644 prometheus-pacman-exporter.timer "${pkgdir}/usr/lib/systemd/system/prometheus-pacman-exporter.timer"
}
