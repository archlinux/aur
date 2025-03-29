# Maintainer: payoliin <payoliin@protonmail.com>

pkgname=vapour
pkgver=2.0.1
pkgrel=3
pkgdesc="An alternative open source Steam client"
arch=('x86_64')
license=('MIT')
depends=('nodejs' 'yarn' 'nss' 'libcups' 'gtk3' 'alsa-lib')
depends_x86_64=(
  'lib32-at-spi2-core'
)
url='https://github.com/Daniel-Griffiths/vapour'
source=(
  "https://github.com/Daniel-Griffiths/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
  'Vapour.desktop'
  'icon.svg'
)
sha256sums=(
  'a5ab8fef8079d665e45de1696dd8e5d65acc3f8651a4e77ef86b59ddacffa33d'
  '64971702c8e973935fed0b1d9e4f58070c77ae0da58975c86b4dfddbc0fd2316'
  '7f05435023e9dafeedd74769ac66dcc73fadf35ad24c8b2fe9509c37375bf401'
)

prepare() {
  cd "${pkgname}-${pkgver}"
  yarn install
}

build() {
  cd "${pkgname}-${pkgver}"
  yarn build --linux
}

package() {
  cd "${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/opt/"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  cp -r "release/${pkgver}/linux-unpacked" "${pkgdir}/opt/vapour"
  ln -s "/opt/vapour/vapour" "${pkgdir}/usr/bin/vapour"
  cd ..
  install -Dm744 "Vapour.desktop" "${pkgdir}/usr/share/applications"
  install -Dm744 "icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/vapour.svg"
}

