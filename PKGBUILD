# Maintainer: Matthias Braun <me@matthiasbraun.eu>
pkgname=way-magnitator-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Magnifies the screen area around the mouse cursor on Sway and other wlroots-based Wayland compositors"
arch=(x86_64)
url="https://gitlab.com/bullbytes/way-magnitator"
license=(AGPL-3.0-or-later)
depends=(libxkbcommon)
provides=(way-magnitator)
conflicts=(way-magnitator)
# The binary is already stripped by CI (see the project's .gitlab-ci.yml),
# so there's nothing left for makepkg to strip and no debug info to split
# into a -debug package.
options=('!strip' '!debug')
# Every local source file name includes the version: makepkg reuses any
# source file that already exists under its local name (e.g. in an AUR
# helper's build cache), so an unversioned name would make an upgrade use
# the previous version's file, and fail its checksum.
source=(
    "way-magnitator-${pkgver}-x86_64::https://gitlab.com/api/v4/projects/87137556/packages/generic/way-magnitator/${pkgver}/way-magnitator-x86_64"
    "LICENSE-${pkgver}::https://gitlab.com/bullbytes/way-magnitator/-/raw/v${pkgver}/LICENSE"
    "way-magnitator-${pkgver}.1::https://gitlab.com/bullbytes/way-magnitator/-/raw/v${pkgver}/man/way-magnitator.1"
)
b2sums=('7c27353daf9ca6835aa899e02858f1051826d19cc2c44fe8e8c67173b87d8180fb1e7cab5670a0fb05d929f39f14caaeb004975319747947087328fb59dd0618'
        'b6829320f725e3e45c4807ef5deb4738a691fb3ab146d8531b81fdbccd8376a826c8ec76165985cdf37d534f68e395652c96841ba7636c4bd34c49b7c7b3a9ec'
        '2c39638abd5cb50ed360119a21487cdbb60e1d99b14b0d382fcf290bb3bf9dc29b3560af09ec1de2a4348b19ad94113c1f5ac95b783ce0f06a2720e14557ef4e')

package() {
    install -Dm755 "way-magnitator-${pkgver}-x86_64" "$pkgdir/usr/bin/way-magnitator"
    install -Dm644 "LICENSE-${pkgver}"               "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "way-magnitator-${pkgver}.1"      "$pkgdir/usr/share/man/man1/way-magnitator.1"
}
