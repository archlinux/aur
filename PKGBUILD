# Maintainer: William Turner <willtur.will@gmail.com>

_pkgname=azuredatastudio
pkgname="${_pkgname}-bin"
# renovate: datasource=github-releases depName=microsoft/azuredatastudio
pkgver=1.52.0
pkgrel=3
pkgdesc="A data management tool that enables you to work with SQL Server, Azure SQL DB and SQL DW. (final official release)"
arch=('x86_64')
url="https://github.com/microsoft/azuredatastudio"
license=('custom: microsoft')
depends=('gtk3'
         'libsecret'
         'libxkbfile'
         'nss'
         'openssl')
makedepends=('sed')
optdepends=('krb5: Windows authentication support'
            'xdg-utils: Desktop integration')
conflicts=("${_pkgname}")
options=('staticlibs')
source=("${url}/releases/download/final/${_pkgname}-linux-${pkgver}.tar.gz"
        "${_pkgname}.desktop")
sha256sums=('6ddb60dec0aecce68cdad2fcb4727fb8d3b96f4ad35395054c58f77ca8dbff6c'
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
