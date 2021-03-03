# Maintainer: fossdd <fossdd@tutanota.com>
pkgname=gitea-tea-git
_pkgname=tea
pkgver=v0.6.0.r19.ge96cfdb
pkgrel=1
pkgdesc="Painless self-hosted Git service.."
arch=(any)
url="https://gitea.io"
license=(MIT)
makedepends=('go' 'git' 'make')
source=('git+https://gitea.com/gitea/tea.git')
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd ${_pkgname}
  make
}

package() {
  cd ${_pkgname}
  install -Dm755 ${_pkgname} -t "${pkgdir}"/usr/bin/
}
