# Maintainer: buzz
# Contributor: dude <brrtsm-AT-gmail-DOT-com>
pkgname=twitch-indicator
pkgver=1.8
pkgrel=2
pkgdesc="Twitch indicator for Linux. Tracks your followed channels and notifies when they go live."
arch=("any")
url="https://github.com/buzz/twitch-indicator"
license=("GPL")
depends=("python-aiofiles" "python-aiohttp" "python-gobject" "python-pydantic" "python" "xapp")
makedepends=("desktop-file-utils" "git" "python-build" "python-installer" "python-hatch")
options=(!emptydirs)
source=("git+https://github.com/buzz/twitch-indicator.git#tag=${pkgver}")
md5sums=("SKIP")

build() {
    cd "${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 data/twitch-indicator.desktop "${pkgdir}/usr/share/applications/twitch-indicator.desktop"
    install -Dm644 data/apps.twitch-indicator.gschema.xml "${pkgdir}/usr/share/glib-2.0/schemas/apps.twitch-indicator.gschema.xml"
    install -Dm644 twitch_indicator/data/twitch-indicator.svg "${pkgdir}/usr/share/icons/twitch-indicator.svg"
}

# vim:set ts=2 sw=2 et:
