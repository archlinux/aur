# Maintainer: Tom Hale <tom at hale dot ee>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164  # var unused / var not assigned / cd without || exit

pkgname=shuck-bin-release-git
_pkgname=shuck
pkgver=0.0.41
pkgrel=1
pkgdesc="Command-line shell checker and formatter — latest Git binary release"
arch=('x86_64')
url="https://github.com/ewhauser/shuck"
license=('MIT')
depends=('glibc>=2.35')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git" "${_pkgname}-release-git" "${_pkgname}-bin")
_target='x86_64-unknown-linux-gnu'
_archive="${_pkgname}-cli-${_target}.tar.xz"
source=("${_archive}::${url}/releases/download/v${pkgver}/${_archive}")
sha256sums=('3dcf888baaa0c15a339738a28125898054b910e91baebeae79046c7fcf5990b5')
options=('!strip')

pkgver() {
  git ls-remote --tags "${url}" 'v[0-9]*' \
    | awk '{print $2}' \
    | sed 's|^refs/tags/||' \
    | sort -V \
    | tail -1 \
    | sed 's/^v//'
}

package() {
  cd "${srcdir}/${_pkgname}-cli-${_target}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}

# vim:set ts=2 sw=2 et ft=PKGBUILD: