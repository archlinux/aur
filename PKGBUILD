# Maintainer: Daniele Cocca <daniele.cocca@gmail.com>
_npmname=lambda
pkgname="nodejs-${_npmname}"
pkgver=0.8.5
pkgrel=1
pkgdesc="An effort to create the perfect programming language."
arch=('any')
url="https://github.com/71104/lambda"
license=('MIT')
depends=('nodejs' 'npm')
source=("https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz")
noextract=("${_npmname}-${pkgver}.tgz")
sha256sums=('e92a80874b80dfac66bc54f4b0ce62e559f0d7f7ca2ea50bce5f1775b55dad2b')
options=('!emptydirs')

package() {
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p "${_npmdir}"
  cd "${_npmdir}"

  # It is not possible to package this inside a clean offline chroot due to
  # NPM bug #2568.
  npm install --user root -g --prefix "${pkgdir}/usr" "${_npmname}@${pkgver}"
}
