# Maintainer: Max Gautier <mg@max.gautier.name>
_pkgname=xdg-terminal-exec
pkgname=${_pkgname}-git
pkgver=0.12.3.r0.g9357b7d
pkgrel=1
pkgdesc="Proposed standard to launching desktop apps with Terminal=true"
arch=(any)
url="https://gitlab.freedesktop.org/Vladimir-csp/$_pkgname.git"
makedepends=('git' 'scdoc')
checkdepends=('bats')
provides=('xdg-terminal-exec')
conflicts=('xdg-terminal-exec')
license=('GPL-3.0-or-later')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
    cd "$_pkgname"
    bats "test/"
}

build() {
    make -C "$_pkgname"
}

package() {
    make -C "$_pkgname" prefix="$pkgdir"/usr install
}
