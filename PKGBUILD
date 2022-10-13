# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: Drommer <drommer@github.com>
# Contributor: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=peerflix
pkgver=0.39.0
pkgrel=4
pkgdesc="Streaming torrent client for node.js"
arch=('any')
url="https://github.com/mafintosh/peerflix"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mafintosh/${pkgname}/archive/v${pkgver}.tar.gz"
        "patch.diff")
sha256sums=('4255940099097670cce308e643c510a05936fa3720a35f25b5ef4c3ce185b80d'
            '263b0931c6728679ce74ee960b0a1be84f0dc513bd5a6e26d972bfb57022d95c')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "$srcdir/patch.diff"
  tar -C "${srcdir}" -czf "../patched.tar.gz" "${pkgname}-${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  npm install --cache ../cache -g --prefix "${pkgdir}/usr" ../patched.tar.gz
  chown -R root:root "${pkgdir}"
}

# vim:set ts=2 sw=2 et:
