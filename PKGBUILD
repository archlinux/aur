# Maintainer: Default User <default@user.com>
pkgname=vk-turn-proxy-client-bin
_pkgname=vk-turn-proxy-client
pkgver=1.2.2
pkgrel=1
pkgdesc="VK TURN Proxy - Client component (binary release)"
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://github.com/cacggghp/vk-turn-proxy"
license=('GPL3')
depends=('glibc' 'iproute2')
provides=('vk-turn-proxy-client')
conflicts=('vk-turn-proxy-client-git' 'vk-turn-proxy-git')

source_x86_64=("${_pkgname}-x86_64::https://github.com/cacggghp/vk-turn-proxy/releases/download/v${pkgver}/client-linux-amd64")
source_aarch64=("${_pkgname}-aarch64::https://github.com/cacggghp/vk-turn-proxy/releases/download/v${pkgver}/client-linux-arm64")
source_armv7h=("${_pkgname}-armv7h::https://github.com/cacggghp/vk-turn-proxy/releases/download/v${pkgver}/client-linux-arm")
source_i686=("${_pkgname}-i686::https://github.com/cacggghp/vk-turn-proxy/releases/download/v${pkgver}/client-linux-386")

source=("routes.sh::https://raw.githubusercontent.com/cacggghp/vk-turn-proxy/v${pkgver}/routes.sh"
        "routes-macos.sh::https://raw.githubusercontent.com/cacggghp/vk-turn-proxy/v${pkgver}/routes-macos.sh"
        "routes.ps1::https://raw.githubusercontent.com/cacggghp/vk-turn-proxy/v${pkgver}/routes.ps1"
        "vk-turn-proxy-client.service"
        "vk-turn-proxy-client.env")

sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
sha256sums_armv7h=('SKIP')
sha256sums_i686=('SKIP')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '37bf69ee1cdde6ec2c172f3b08c993e544bec62a79273d342f3b69715d2c4907'
            '205aa129e0ee2837ffd5b102a5b2c1771bc51d5ffcc1cf4fb31e51110882063c')

package() {
  install -Dm755 "${srcdir}/${_pkgname}-${CARCH}" "$pkgdir/usr/bin/vk-turn-proxy-client"
  
  install -dm755 "$pkgdir/usr/share/vk-turn-proxy"
  install -m644 routes-macos.sh "$pkgdir/usr/share/vk-turn-proxy/routes-macos.sh"
  install -m644 routes.sh "$pkgdir/usr/share/vk-turn-proxy/routes.sh"
  install -m644 routes.ps1 "$pkgdir/usr/share/vk-turn-proxy/routes.ps1"
  
  install -Dm644 "$srcdir/vk-turn-proxy-client.service" "$pkgdir/usr/lib/systemd/system/vk-turn-proxy-client.service"
  install -Dm644 "$srcdir/vk-turn-proxy-client.env" "$pkgdir/etc/default/vk-turn-proxy-client"
}
