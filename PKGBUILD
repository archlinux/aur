# Maintainer: fuero <fuerob@gmail.com>
_pkgname=terminactory
pkgname=${_pkgname}-git
# _renovate: datasource=gitlab-releases depName=snipedbywifi/terminactory
pkgver=r216.6d76220
pkgrel=1
pkgdesc='idle factory game that runs in your terminal, meant to be played alongside your agents'
arch=('x86_64')
url="https://gitlab.com/snipedbywifi/terminactory"
license=('Apache-2.0')
makedepends=('cargo' 'git')
source=(
  #"${pkgname}-v${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
  "${_pkgname}::git+${url}"
)

sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${_pkgname}"

  cargo build --release
}

check() {
  cd "${_pkgname}"

  cargo test --release
}

package() {
  cd "${_pkgname}"

  install -Dm755 "target/release/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
