# Maintainer: Dmitry Kharitonov <arch[at]nano-model[dot]com>

pkgname=gmonitor-git
_pkgbasename=gmonitor
pkgver=v1.2.r5.geace4da
pkgrel=1
pkgdesc="NVIDIA GPU real-time monitoring program (core, VRAM, PCI-E & memory bus usage and temperature of GPUs)"
arch=('i686' 'x86_64')
url="https://github.com/mountassir/gmonitor"
license=('GPL')
depends=('nvidia-utils')
makedepends=('git')
conflicts=('gmonitor')
source=('gmonitor::git+https://github.com/mountassir/gmonitor.git#branch=master')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgbasename}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/${_pkgbasename}/src"
  make
}

package() {
  cd "$srcdir/${_pkgbasename}/src"
  install -Dm 755 gmonitor "${pkgdir}"/usr/bin/gmonitor
}
