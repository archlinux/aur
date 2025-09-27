# Maintainer: Awanderi

_pkgname='sshto'
pkgname="${_pkgname}-git"
pkgver=r222.c5b68a9-1
pkgrel=2
pkgdesc='TUI to manage your ssh connections'
arch=('any')
url='https://github.com/vaniacer/sshto'
license=('MIT')
depends=('dialog' 'openssh')
makedepends=('git')
provides=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

# getting pkgver by tags or fallback to revisions.shortcommit hashes
pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
  cd "${_pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin" "${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" 'README.md'
  install -Dm644 'LICENSE.md' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

