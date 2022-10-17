# Maintainer: A Frederick Christensen <aur@ivories.org>

pkgname=mautrix-wsproxy-git
_pkgname=mautrix-wsproxy
pkgver=0
pkgrel=1
pkgdesc="A websocket proxy for Matrix appservices - latest git commit"
arch=('x86_64')
license=('AGPL')
makedepends=('go' 'git')
provides=('mautrix-wsproxy')
conflicts=('mautrix-wsproxy')
url="https://github.com/mautrix/wsproxy"
source=("${_pkgname}"::"git+https://github.com/mautrix/wsproxy.git")
sha256sums=('SKIP')

# https://wiki.archlinux.org/title/VCS_package_guidelines :
# "If there are no tags then use number of revisions since beginning of the history"
pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  go build -o "${_pkgname}"
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

# vim:set ts=2 sw=2 et:
