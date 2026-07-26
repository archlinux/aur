# Maintainer: mapleafgo <mapleafgo at 163 dot com>
pkgname=singcast
epoch=1
pkgver=1.1.15
pkgrel=2
pkgdesc="A clash GUI client based on Flutter"
arch=('x86_64' 'aarch64')
url="https://github.com/mapleafgo/singcast"
license=('MIT')
conflicts=(${pkgname})
provides=(${pkgname})
depends=('gtk3' 'libayatana-appindicator' 'polkit' 'acl' 'libcap')
install=singcast.install
source_x86_64=(${pkgname}-${pkgver}-x86_64.zip::https://github.com/mapleafgo/singcast/releases/download/v${pkgver}/singcast-${pkgver}-linux-amd64-portable.zip
             singcast.desktop
             singcast.svg
             singcast.install)
_install_path="/opt/Singcast"
source_aarch64=(${pkgname}-${pkgver}-aarch64.zip::https://github.com/mapleafgo/singcast/releases/download/v${pkgver}/singcast-${pkgver}-linux-arm64-portable.zip
             singcast.desktop
             singcast.svg
             singcast.install)


package() {
  install -dm755 "${pkgdir}${_install_path}"

  cp -a "${srcdir}/lib" "${pkgdir}${_install_path}/lib"
  cp -a "${srcdir}/data" "${pkgdir}${_install_path}/data"
  install -Dm755 "${srcdir}/singcast" "${pkgdir}${_install_path}/singcast"
  install -Dm755 "${srcdir}/singcast-core" "${pkgdir}${_install_path}/singcast-core"

  install -dm755 "${pkgdir}/usr/bin"
  ln -snf "${pkgdir}/${_install_path}/singcast" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "singcast.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/singcast.svg"
  install -Dm644 "singcast.desktop" "${pkgdir}/usr/share/applications/singcast.desktop"
}

sha256sums_x86_64=('153fa65c559bd90f370c00bb065f17ee3be6c788d466bdec4bb8300554add29a'
                   '0ba2701f7a7dd7f883014b4bcd585b8ccbdfddeced56e45ab55067c43cbe8d3e'
                   '289d9ffd1ea9b24928bea1a0936d9a1125e7f3d9e2d7341e353ce5c42d405f09'
                   '671ce4bf94e3c8e4c97b07610cf40e2fbf36bd27d80b76063708d7ad644f1268')
sha256sums_aarch64=('be0c1c6a5d89b110b44bf2e3bb15676be66cf6713722c3e32e3048e614f1451d'
                    '0ba2701f7a7dd7f883014b4bcd585b8ccbdfddeced56e45ab55067c43cbe8d3e'
                    '289d9ffd1ea9b24928bea1a0936d9a1125e7f3d9e2d7341e353ce5c42d405f09'
                    '671ce4bf94e3c8e4c97b07610cf40e2fbf36bd27d80b76063708d7ad644f1268')
