# Maintainer: William Turner <willtur.will@gmail.com>

pkgname=azuredatastudio-bin
_pkgname=azuredatastudio
pkgver=1.47.1
pkgrel=2
pkgdesc="A data management tool that enables you to work with SQL Server, Azure SQL DB and SQL DW. (official prebuilt version)"
arch=('x86_64')
url="https://github.com/Microsoft/azuredatastudio"
license=('custom: microsoft')
depends=('gtk3'
         'libsecret'
         'libxkbfile'
         'nss'
         'openssl')
makedepends=('sed')
optdepends=('krb5: Windows authentication support'
            'xdg-utils: Desktop integration')
conflicts=('azuredatastudio')
options=('staticlibs')
source=("$pkgname-$pkgver.tar.gz::https://azuredatastudio-update.azurewebsites.net/$pkgver/linux-x64/stable"
        "${_pkgname}.desktop")
sha256sums=('66b796abb13700aaac57faa6302f66db168aee5049c88dc0196727fe395fd8a3'
            'ff4b8d7d1648e7552017c103308aef2d291509a73b7b4ed6083501ea55a1b541')

package() {
  install -d "${pkgdir}/opt/${_pkgname}"
  cp -a "azuredatastudio-linux-x64/"* "${pkgdir}/opt/${_pkgname}"

  # Symlink the startup script in /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/bin/azuredatastudio" "${pkgdir}/usr/bin/${_pkgname}"

  # Add the icon and desktop file
  install -D -m644 "azuredatastudio-linux-x64/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/icons/${_pkgname}.png"
  install -D -m644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Install the license file
  install -D -m644 "azuredatastudio-linux-x64/resources/app/LICENSE.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
