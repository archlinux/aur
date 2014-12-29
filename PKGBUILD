# $Id$
# Maintainer: Ido Rosen <ido@kernel.org>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
#

pkgname=spdlog-git
pkgver=0.545.267c9c6
pkgrel=1
pkgdesc='Super fast C++ logging library'
arch=('any')
#arch=('i686' 'x86_64')
url="https://github.com/gabime/spdlog"
license=('MIT')
depends=()
makedepends=('git')
provides=('spdlog')
conflicts=('spdlog')
# don't strip binaries!
options=('!strip' 'staticlibs')
source=("git+https://github.com/gabime/spdlog.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/spdlog"
  printf "%s.%s.%s" "${_pkgver:=0}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd spdlog
  mv include/spdlog/details/format{.cc,-impl.h}
  sed -i 's/format\.cc/format-impl.h/' include/spdlog/details/format.h
}

#build() {
#}

#check() {
#}

package() {
  cd spdlog
  # systemd
  install -dm755 "$pkgdir/usr/include/spdlog"
  cp -R "include/spdlog/." "$pkgdir/usr/include/spdlog/"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/spdlog-git/README.md"
  install -Dm644 "INSTALL" "$pkgdir/usr/share/doc/spdlog-git/README.md"
  install -dm755 "$pkgdir/usr/share/doc/spdlog-git/example"
  cp -R "example/." "$pkgdir/usr/share/doc/spdlog-git/example/"
  install -dm755 "$pkgdir/usr/share/doc/spdlog-git/bench"
  cp -R "bench/." "$pkgdir/usr/share/doc/spdlog-git/bench/"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/spdlog-git/LICENSE"
  chmod -R a+rX "$pkgdir/"
  chmod -R go-w "$pkgdir/"
}

# vim:set ts=2 sw=2 et:
