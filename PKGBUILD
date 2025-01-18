#Maintainer: Shakakibara <aryan.1843@disroot.org>

pkgname='codetantra-sea'
pkgver=3.0.8
pkgrel=1
pkgdesc='Platform for online teaching.'
arch=('x86_64')
url='https://www.codetantra.com'
depends=('alsa-lib' 'firejail' 'nss' 'at-spi2-atk' 'cups' 'gtk3')
optdepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/ct-code/sea/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb"
        "sea.sh")
sha256sums=('81104c00320a227d6f02b088eb45277d728eba549d1ec19dd671f78682f820be'
            '2aeb4451e650a3cd3b69d4154c14795acd1ad9e2683e476e3452e721e25a0979')

package() {
      #extract
      tar -xvf 'data.tar.xz' -C "${pkgdir}"

      #add firejail to desktop file.
      sed -i 's/^Exec=.*/Exec=firejail --nosound --profile=chromium \/opt\/codetantra-sea\/codetantra-sea --ignore-certificate-errors/'  "${pkgdir}/usr/share/applications/${pkgname}.desktop"

      #remove the other exec line
      sed -i '/exec/d' "${pkgdir}/usr/share/applications/${pkgname}.desktop"

      #Install the launch script
      install -Dm 755 sea.sh "${pkgdir}/usr/bin/sea"

      #fix naming
      mv "${pkgdir}/opt/CodeTantra SEA" "${pkgdir}/opt/${pkgname}"
}
