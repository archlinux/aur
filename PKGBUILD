# Maintainer: teraflops <cprieto.ortiz@gmail.com>
_pkgname=yargs
pkgname=nodejs-${_pkgname}
pkgver=18.0.0
pkgrel=1
pkgdesc="Yargs: modern CLI args parser for Node.js (library)"
arch=('any')
url="https://github.com/yargs/yargs"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${_pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_pkgname}/-/${_pkgname}-${pkgver}.tgz")
sha256sums=('SKIP')

package() {
  install -d "${pkgdir}/usr/lib/node_modules/${_pkgname}"

  tar -xzf "${srcdir}/${_pkgname}-${pkgver}.tgz" -C "${pkgdir}/usr/lib/node_modules/${_pkgname}" --strip-components=1 package

  find "${pkgdir}/usr/lib/node_modules/${_pkgname}" -type f -name "*.md" -o -name "*.markdown" -o -name "*.map" -print0 | xargs -0r rm -f -- 2>/dev/null || true

  if [[ -f "${pkgdir}/usr/lib/node_modules/${_pkgname}/LICENSE" ]]; then
    install -Dm644 "${pkgdir}/usr/lib/node_modules/${_pkgname}/LICENSE" \
      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  else
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    printf 'MIT\n' > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}

