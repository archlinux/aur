# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname=wipemychat
pkgname=${_pkgname}-git
pkgver=1.1.0.r0.9f7ee12
pkgrel=2
pkgdesc="Delete all your messages in public and private Telegram chats"
arch=('any')
url="https://github.com/rusq/wipemychat"
license=('GPL-3.0-or-later')
makedepends=('git' 'go' 'goreleaser' 'delve' 'openssl')
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git")
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "tgmsgdel" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENCE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
