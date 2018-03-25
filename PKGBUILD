# Maintainer: Ivan Zenin <i.zenin@gmx.com>

pkgname=lz4json-git
pkgver=latest
pkgrel=1
pkgdesc="C decompress tool for mozilla lz4json format (development version)"
arch=('i686' 'x86_64')
url="https://github.com/andikleen/lz4json"
depends=("lz4")
provides=('lz4json')
makedepends=('git')
source=("git+git://github.com/andikleen/lz4json.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}"/lz4json
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}"/lz4json
  make lz4jsoncat
  install -Dm755 lz4jsoncat "${pkgdir}/usr/bin/lz4jsoncat"
  find "${pkgdir}" -type d -name .git -exec rm -r '{}' +
}
