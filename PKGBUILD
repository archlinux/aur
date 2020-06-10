# Maintainer: MCOfficer <MCOfficer@gmx.de>

pkgname=whatfiles-git
pkgver=r6.bb02dbc
pkgrel=2
arch=('x86_64')
pkgdesc='Log what files are accessed by any Linux process'
url='https://github.com/spieglt/whatfiles'
license=('GPL3')
depends=('glibc')
makedepends=('git' 'make' 'gcc')
source=("$pkgname::git+https://github.com/spieglt/whatfiles.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$pkgname"
  make
  mkdir -p "${pkgdir}/usr/bin/"
  install -Dm755 "bin/whatfiles" "${pkgdir}/usr/bin/"
}
