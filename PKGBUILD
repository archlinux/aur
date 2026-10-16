# Maintainer: Matthias Braun <me@matthiasbraun.eu>
pkgname=way-magnitator-bin
pkgver=0.4.0
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
b2sums=('21232b3c33df12c6839b2a1cdcf4321ed94e3494f17a901e30735997907108698eeaeef845f9e45fbd0f6fb85c958a4ba56afe65ebddda8446e0de80d4731d40'
        'b6829320f725e3e45c4807ef5deb4738a691fb3ab146d8531b81fdbccd8376a826c8ec76165985cdf37d534f68e395652c96841ba7636c4bd34c49b7c7b3a9ec'
        '42ba9ad6d5797d1f00ba34cf394dca2cd37962667dd730637f9e7663cca8822952fc509afef7e4823ca56e0d27d8d273418d4cef6ca5ea2068fe56c9efcc6ff2')

package() {
    install -Dm755 "way-magnitator-${pkgver}-x86_64" "$pkgdir/usr/bin/way-magnitator"
    install -Dm644 "LICENSE-${pkgver}"               "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "way-magnitator-${pkgver}.1"      "$pkgdir/usr/share/man/man1/way-magnitator.1"
}
