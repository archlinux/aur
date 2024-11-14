# Maintainer: João Costa <joaocosta.work@posteo.net>
pkgname="lf-file-handler-git"
_pkgname="lf-file-handler"
pkgver=1.0.0.r1.g5b0094b
pkgrel=1
pkgdesc="Allow the lf file explorer to handle 'show in explorer' requests from GUI applications"
arch=('x86_64')
url="https://github.com/JoaoCostaIFG/lf-file-handler"
license=("custom:MIT")
depends=(
  'dbus'
  )
makedepends=(
  'pkgconf'
  'git'
)
conflicts=('lf-file-handler')
provides=("${pkgname}")
source=("${_pkgname}::git+https://github.com/JoaoCostaIFG/lf-file-handler.git")
sha256sums=("SKIP")

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

