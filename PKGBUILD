# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

pkgname=jitsi-meet-prosody-git
pkgver=1.0.7009+0+gc641835d0
pkgrel=1
pkgdesc="Jitsi Meet Prosody Plugins git build"
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
        "$pkgname::git+https://github.com/jitsi/jitsi-meet"
)

pkgver() {
    cd "$pkgname"
    printf "1.0.%s" "$(git describe --exclude \*jitsi-meet\* --long | sed 's/-/+/g')"
}

package() {
        cd "$srcdir/$pkgname"

        install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" doc/debian/jitsi-meet-prosody/prosody.cfg.lua-jvb.example doc/debian/jitsi-meet-prosody/jaas.cfg.lua
        sed -i 's@/usr/share/jitsi-meet/prosody-plugins/@/usr/lib/'$pkgname'@' "${pkgdir}/usr/share/doc/${pkgname}/prosody.cfg.lua-jvb.example"

        install -d "${pkgdir}/usr/lib"
        cp -Rv "resources/prosody-plugins" "${pkgdir}/usr/lib/${pkgname}"
}
sha256sums=('SKIP')
