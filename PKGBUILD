pkgname=sparkle-rolling-bin
_pkgname=sparkle
pkgver=1.26.9.r1292.515042e
_releasever=1.26.9-rolling-515042e
pkgrel=1
pkgdesc="Another Mihomo GUI (rolling binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/xishang0128/sparkle"
license=('GPL-3.0-only')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2'
         'glibc' 'gtk3' 'libcups' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage'
         'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'nss'
         'pango' 'systemd-libs')
makedepends=('libarchive')
options=('!debug')
provides=("sparkle=${pkgver}")
conflicts=('sparkle' 'sparkle-bin' 'sparkle-git' 'sparkle-electron'
           'sparkle-electron-bin' 'sparkle-electron-git')
install=${_pkgname}.install
source=("${_pkgname}.sh")
source_x86_64=("${_pkgname}-${_releasever}-x86_64.deb::${url}/releases/download/rolling/${_pkgname}-linux-${_releasever}-amd64.deb")
source_aarch64=("${_pkgname}-${_releasever}-aarch64.deb::${url}/releases/download/rolling/${_pkgname}-linux-${_releasever}-arm64.deb")
sha256sums=('68c3b948301007f29e4f0db9b1b413766c2bcacf7eaf5305c7e7b83f547df3b5')
sha256sums_x86_64=('934515b640aab7db931f95857ba79a458dd07239384c7e0cd655fd8ce06e1676')
sha256sums_aarch64=('7a100ee03853c32e74396f2f876ff93539024a10d42183451294b6660ed66247')

package() {
    bsdtar -xf data.tar.xz -C "$pkgdir"
    chmod +x "$pkgdir/opt/sparkle/sparkle"
    chmod +x "$pkgdir/opt/sparkle/resources/files/sparkle-service"
    chmod +sx "$pkgdir/opt/sparkle/resources/sidecar/mihomo"
    chmod +sx "$pkgdir/opt/sparkle/resources/sidecar/mihomo-alpha"
    install -Dm755 "$srcdir/${_pkgname}.sh" "$pkgdir/usr/bin/${_pkgname}"
    sed -i 's|^Exec=/opt/sparkle/sparkle|Exec=sparkle|' \
        "$pkgdir/usr/share/applications/${_pkgname}.desktop"
}
