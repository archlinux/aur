# Maintainer: gilcu3
# Contributor: gilcu3

_pkgname=difit
pkgname=difit-bin
pkgver=5.0.8
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
sha256sums=('4465c9960282a260d4e317316569180fce2430ce5f475a0cd57b07869c82bc0d')

package() {
  # Keep npm's cache inside srcdir instead of littering the build user's $HOME.
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" \
    "${srcdir}/${_pkgname}-${pkgver}.tgz"

  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_pkgname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
