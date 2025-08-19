# Maintainer: Sahaj Bhatt <sahajb0606@gmail.com>
pkgname=wakafetch-git
_pkgname=wakafetch
pkgver=r5.e6a9a2b
pkgrel=1
pkgdesc="Terminal dashboard for your WakaTime/Wakapi coding activity"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/sahaj-b/wakafetch"
license=('MIT')
makedepends=('go' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/sahaj-b/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  go build -ldflags="-s -w" -trimpath -o "${_pkgname}" .
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
