# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: David Birks <david@birks.dev>

pkgname=lens
pkgdesc='The Kubernetes IDE'
pkgver=4.0.3
pkgrel=1
arch=('x86_64')
license=('MIT')
url='https://k8slens.dev'
makedepends=('npm' 'nodejs-lts-erbium' 'yarn')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lensapp/lens/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha256sums=('e4e556496291addaaa807facf52e0d3f78a5265a0c45e511d51b76bb1e83d6e2'
            '41cd0bb6b27f407f1963b2346b2396e047faeda759ca7a394ac5a19bb2c9e892')

build() {
  cd "${pkgname}-${pkgver}"
  make -j1 build
}

package() {
  # copy the entire distribution to /usr/share
  mkdir -p "${pkgdir}"/usr/share/${pkgname}
  mv "${srcdir}"/${pkgname}-${pkgver}/dist/linux-unpacked/* \
    "${pkgdir}"/usr/share/${pkgname}

  # icon
  install -Dm 644 "${srcdir}"/${pkgname}-${pkgver}/build/icons/512x512.png \
    "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/${pkgname}.png

  # desktop file
  install -Dm 644 "${srcdir}"/${pkgname}.desktop \
    "${pkgdir}"/usr/share/applications/${pkgname}.desktop

  # symlink binary
  mkdir -p "${pkgdir}"/usr/bin
  ln -sf /usr/share/${pkgname}/kontena-lens \
    "${pkgdir}"/usr/bin/kontena-lens
}
