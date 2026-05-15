# Maintainer: Vinicius Mayrink <vncsmyrnk@gmail.com>
pkgname=shell-utils-git
pkgver=r272.9be78a3 # This gets auto-updated by the pkgver() function
pkgrel=1
pkgdesc="An attempt to be a shell-agnostic custom utilities tool."
arch=('x86_64')
url="https://github.com/vncsmyrnk/shell-utils"
license=('GPL-3.0')
depends=()
makedepends=('git' 'go')
provides=('util')
conflicts=('util')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}" || return
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}" || return
  # The package path is guessed here as shell-utils need to know it at run time
  make PREFIX=/usr
}

package() {
  cd "${pkgname%-git}" || return
  make install PREFIX="$pkgdir/usr" DESTDIR=""
}
