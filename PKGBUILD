# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

_basename=jitsi-meet
_pkgname=prosody
_tag=9139
_version=1.0.9139

pkgname=${_basename}-${_pkgname}
pkgver=${_version}
pkgrel=1
pkgdesc="Jitsi Meet Prosody Plugins"
arch=('any')
url="https://jitsi.org/jitsi-meet/"
license=('Apache')
depends=()
optdepends=("prosody" "lua52" "lua52-sec" "lua52-zip" "lua52-event")
makedepends=(
        "git"
)
options=('!strip')
backup=(
)
source=(
        "$pkgname::git+https://github.com/jitsi/jitsi-meet#tag=${_tag}"
)
install=install

package() {
        cd "$srcdir/$pkgname"

        install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" doc/debian/jitsi-meet-prosody/prosody.cfg.lua-jvb.example doc/debian/jitsi-meet-prosody/jaas.cfg.lua
        sed -i 's@/usr/share/jitsi-meet/prosody-plugins/@/usr/lib/'$pkgname'@' "${pkgdir}/usr/share/doc/${pkgname}/prosody.cfg.lua-jvb.example"

        install -d "${pkgdir}/usr/lib"
        cp -Rv "resources/prosody-plugins" "${pkgdir}/usr/lib/${pkgname}"
}
sha256sums=('376d0749965678f46339e6e472b8bd17700877bb53acfa9277a9251341a12419')
