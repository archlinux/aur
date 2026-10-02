# Maintainer: quest <quest at mac dot com>

pkgname=bluos-controller-appimage
_pkgname=bluos-controller
pkgver=4.16.1
pkgrel=1
pkgdesc="BluOS Controller application repackaged for Linux."
arch=('x86_64')
depends=('fuse2')
url="https://gitlab.com/zquestz/bluos-controller-linux"
provides=('bluos-controller')

_bin="bluos-controller-linux-${pkgver}.AppImage"
_registry="https://gitlab.com/api/v4/projects/zquestz%2Fbluos-controller-linux/packages/generic/bluos-controller-linux"

source=("${_bin}::${_registry}/${pkgver}/${_bin}"
        'bluos-controller.desktop'
        'bluos-controller.png')
sha512sums=('04c3847bf0749ead7c7f19e592f5b0f27c4fb1c68463b9a0b326a7f1ed6b1a230e7b33b6be657d8f18f9a4cf677e67bdf03e9b2e88870ce676b9149ca62d0b09'
            '1f038bbfd6e0095c745defdb7928bf5ed852198d1959ffc8e8f8664d4b77366b5d85cf4e1c6f810ce70644793048a46d02b3041747413bd3a61bf75039648497'
            '8985c4311fc68658e32b8607a4ac71c0ad88210fd7f2b05f2149a870adce9fdb3c3813585858474aabbd70bf6452a7cfd91de6bcc669e7e08d88577403fee3e6')

options=('!strip' '!emptydirs')

package() {
  install -Dm755 "${srcdir}/${_bin}" "${pkgdir}/opt/bluos-controller/${_bin}"
  install -Dm644 "${srcdir}/bluos-controller.desktop" "${pkgdir}/usr/share/applications/bluos-controller.desktop"
  install -Dm644 "${srcdir}/bluos-controller.png" "${pkgdir}/opt/bluos-controller/bluos-controller.png"
  mkdir -p "${pkgdir}/usr/bin/"
  ln -s "/opt/bluos-controller/${_bin}" "${pkgdir}/usr/bin/bluos-controller"
}
