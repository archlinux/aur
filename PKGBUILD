# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fastfetch-bin
pkgver=2.1.1
pkgrel=1
pkgdesc="Like neofetch, but much faster because written in C."
arch=('x86_64')
url="https://github.com/LinusDierheimer/fastfetch"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('sh' 'glibc')
optdepends=('chafa: Image output as ascii art'
  'dbus: Bluetooth, Player & Media detection'
  'dconf: Needed for values that are only stored in DConf + Fallback for GSettings'
  'glib2: Output for values that are only stored in GSettings'
  'imagemagick: Image output using sixel or kitty graphics protocol'
  'libnm: Used for Wifi detection'
  'libpulse: Used for Sound detection'
  'mesa: Needed by the OpenGL module for gl context creation.'
  'libxrandr: Multi monitor support'
  'ocl-icd: OpenCL module'
  'pciutils: GPU output'
  'vulkan-icd-loader: Vulkan module & fallback for GPU output'
  'xfconf: Needed for XFWM theme and XFCE Terminal font'
  'zlib: Faster image output when using kitty graphics protocol')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-Linux.deb")
sha256sums=('5fa15a4302624a360cb81740a5bd082624c8b01ca968ec69dc64a49d25ee203e')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/"* -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${pkgname%-bin}" -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}/presets/"*.jsonc -t "${pkgdir}/usr/share/${pkgname%-bin}/presets"
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}/presets/"{all,btw,ci,hardware,neofetch,paleofetch,software} -t "${pkgdir}/usr/share/${pkgname%-bin}/presets"
    install -Dm644 "${srcdir}/usr/share/${pkgname%-bin}/presets/examples/"* -t "${pkgdir}/usr/share/${pkgname%-bin}/presets/examples"
    install -Dm644 "${srcdir}/usr/share/licenses/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}