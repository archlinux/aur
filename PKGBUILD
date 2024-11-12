# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

_basename=jitsi-meet
_pkgname=prosody
_tag=8242
_version=1.0.8242

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
sha256sums=('831ba870b78e277ebc3baad408fd89b79decdb531a443f0d4b5063cb925ed29a')
