# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=ultravnc-viewer
pkgver=1.2.0.5
_pkgver=${pkgver::-2}
pkgrel=1
pkgdesc="A powerful VNC Client with a lot of features, compatible with Windows' UltraVNC servers"
arch=('any')
url="http://www.uvnc.com"
license=('GPL')
depends=('wine' 'gtk-update-icon-cache')
makedepends=('unzip')
source=("http://www.uvnc.eu/download/${pkgver//./}/Uvnc_${pkgver//./}_bin.zip"
        "${pkgname}"
        "${pkgname}-16.png"
        "${pkgname}-24.png"
        "${pkgname}-32.png"
        "${pkgname}-48.png"
        "${pkgname}-256.png"
        "${pkgname}.desktop"
        "${pkgname}-listen.desktop")
sha256sums=('b1760a91ca0d53777e65942185f94c5e0a3a5c7f20cb5fd84c2503f2d12d039e'
            '1738d173c1cb89e46207c70fda6a36b7eeea9ba31b469a0cce10bbd9e8deb9b0'
            '5386feaf65fff389db4e4e30950f97d64803815b1e1a219d45bf41c2bde45e21'
            '098876231f8006bb89fc54986175ec6d938fae2c9e4a6dafe9b5c9d36f7fb3a2'
            '48025bb333be1ab9ebf875ced00d98b5701bbd81bad361d34712bc00b2e3c0df'
            '26b29f4a99cc40e3c119eae0f3ae9195d41f57cb2377f1add3e4c771f752aaa2'
            '1106710eab5b5603c15a1c216ad181e60110e8dc17f6442985e24f631b6f5f1b'
            'c2a3cb12b9fdbd06fc9faf9907a591d7988233dd5e0046ccba625f5f8b3b367d'
            '6eefe94d1dacc0ca414a1e2ff5cc0fb2c272d3743b39240247000e5d03e6d9f2')
install="${pkgname}.install"

package() {
  # Install binary files
  install -m 644 -D "${srcdir}/w2k/vncviewer.exe" "${pkgdir}/usr/lib/${pkgname}/vncviewer.exe"
  # Install startup script
  install -m 755 -D "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  # Install icons
  for _size in 16 24 32 48 256
  do
    install -m 644 -D ${pkgname}-${_size}.png "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
  done
  # Install desktop files
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop" "${pkgname}-listen.desktop"
}

