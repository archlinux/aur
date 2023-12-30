# Maintainer: Fabian Mettler <dev@maveonair.com> -> https://github.com/maveonair

pkgname=onepage
pkgver=0.0.3
pkgrel=2
pkgdesc="OnePage is a simple web application that serves a single page, allowing users to edit content in Markdown format and view it rendered as HTML"
arch=(x86_64 aarch64)
url="https://github.com/maveonair/onepage"
license=(MIT)
makedepends=(go nodejs-lts-iron npm)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
onepage.service
onepage-sysusers.conf)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make setup
  make build
}

package() {
  install -Dm755 "${srcdir}"/${pkgname}-${pkgver}/dist/onepage "${pkgdir}"/usr/bin/onepage
  install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}"/onepage.service "${pkgdir}"/usr/lib/systemd/system/onepage.service
  install -Dm644 "${srcdir}"/onepage-sysusers.conf "${pkgdir}"/usr/lib/sysusers.d/onepage.conf
}
sha256sums=('32b11944bc0b4287aff858f3dc41af152d8680538c3014d285e6fc6c0d2acbc0'
            'ba251d5e4e6937046cdc368aee8a775ee127c1285287f8f6be9cc367a3c4d237'
            'a89aef7858dfdabf000ad362baa502294255a79661c09d4bf481455145dcf097')
