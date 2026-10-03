# Maintainer: gilcu3
# Contributor: gilcu3

_pkgname=difit
pkgname=difit-bin
pkgver=5.0.12
pkgrel=1
pkgdesc="Lightweight CLI that serves Git commit diffs in a GitHub-like Files changed view"
arch=('x86_64' 'aarch64')
url="https://github.com/yoshiko-pg/difit"
license=('MIT')
depends=('nodejs>=21.0.0')
makedepends=('npm')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
noextract=("${_pkgname}-${pkgver}.tgz")
sha256sums=('eb3c9eeb965b693876ea78eb362744e0676c2e56c496032fa33cd014c3956250')

package() {
  # Keep npm's cache inside srcdir instead of littering the build user's $HOME.
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" \
    "${srcdir}/${_pkgname}-${pkgver}.tgz"

  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_pkgname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
