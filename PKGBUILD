# Maintainer: Rooki <aur at rooki dot xyz>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Carlo Cabanilla <carlo.cabanilla@gmail.com>

pkgname=cs-script
pkgver=4.12.0.0
pkgrel=2
pkgdesc="Run C# sources like scripts"
arch=('any')
url="https://github.com/oleg-shilo/cs-script"
license=('MIT')
provides=(cs-script)
conflicts=(cs-script)
depends=('dotnet-sdk-10.0-bin')
source=("${url}/releases/download/v${pkgver}/${pkgname}.linux.v${pkgver}.7z")
sha256sums=('c040af9256dd28c1cfab5277b486b7323eaf0f1d59ad4213b4699e44a1108880')

package() {
  install -dm755 "${pkgdir}/usr/share/cs-scripts"
  cp -rf cscs.dll cscs.runtimeconfig.json "${pkgdir}/usr/share/cs-scripts"
  
  install -Dm755 /dev/stdin "${pkgdir}/usr/local/bin/css" <<EOF
  #!/bin/bash
  dotnet /usr/share/cs-scripts/cscs.dll "\$@"
EOF
    # Make the wrapper magical and accessible to all
    chmod +x "${pkgdir}/usr/local/bin/css"
}
