# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Rooki <aur at rooki dot xyz>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Carlo Cabanilla <carlo.cabanilla@gmail.com>

_pkgbase=cs-script
pkgname="${_pkgbase}-bin"
pkgver=4.14.14.0
pkgrel=1
pkgdesc="Run C# sources like scripts"
arch=('any')
url="https://github.com/oleg-shilo/cs-script"
license=('MIT')
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
depends=('sh' 'dotnet-sdk-bin')

source=(
  "${url}/releases/download/v${pkgver}/${_pkgbase}.linux.v${pkgver}.7z"
  "${url}/blob/v${pkgver}/LICENSE"
  "css.sh"
)
sha256sums=('9c9fb2431c1295e143cb9d201c508f39c33b5d8a222309c1cf19d257aa03575c'
            '9d04cbe42d28096fb6f0327ff91dd4df75185089b73990fc9b077af8b9a28dff'
            'bf92629b6f0e1c9c3a9e217339354301493300603da54af0488d8905f5154859')

package() {
  install -dm755 "${pkgdir}/usr/share/${_pkgbase}"
  cp -rf cscs.dll cscs.runtimeconfig.json "${pkgdir}/usr/share/${_pkgbase}"
  
  install -Dm755 css.sh "${pkgdir}/usr/local/bin/css"

  # Make the wrapper magical and accessible to all
  chmod +x "${pkgdir}/usr/local/bin/css"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

