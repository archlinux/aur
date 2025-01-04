# Maintainer: Tianhao Wang <i AT shrik3 DOT com>

pkgname=8bloat-git
_pkgname=8bloat
pkgver=v0.0.2.r26.gd27ae17
pkgrel=2
pkgdesc="minimalist client for pleroma/mastodon network"
arch=('x86_64')
url="https://sr.ht/~webb/8bloat/"
conflicts=('8bloat')
license=('AGPL-3.0-only')
makedepends=('go' 'git')
source=('git+https://git.sr.ht/~webb/8bloat')
sha256sums=('SKIP')
_branch="8b/master"

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}"/${_pkgname}
  make
}

package() {
  install -Dm755 "${srcdir}/${_pkgname}/oupt/8b" "${pkgdir}/usr/bin/8b"
  install -Dm644 "${srcdir}/${_pkgname}"/COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${_pkgname}"/cmd/8b/bloat.conf "${pkgdir}/etc/8bloat.conf"
}

# vim: ts=2 sw=2 et
