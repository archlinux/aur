# Maintainer: Mohammad Reza Karimi <m.r.karimi.j@gmail.com>
# Contributor: Carlo Teubner <carlo@cteubner.net>
_pkgname=runapp
pkgname="$_pkgname-git"
pkgver=0.4.1.r2.g10fb4b3
pkgrel=1
pkgdesc="Application runner for Linux desktop environments that integrate with systemd"
arch=('x86_64')
depends=('systemd-libs')
url="https://github.com/c4rlo/runapp"
license=('MIT')
source=("${_pkgname}::git+https://github.com/c4rlo/${_pkgname}.git")
sha256sums=('SKIP')
conflicts=("$_pkgname")

pkgver() {
  cd "$_pkgname"
  git describe --tags --long --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
  cd "$_pkgname"
  make release
}

package() {
  cd "$_pkgname"
  make DESTDIR="$pkgdir/" prefix=/usr install_runner= install
}

# vim:set ts=2 sw=2 et:
