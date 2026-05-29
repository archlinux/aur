# Maintainer: heyeuuu <2829004293@qq.com>
pkgname=speedcat-bin
pkgver=3.0.3.2026043013
pkgrel=1
pkgdesc="Prebuilt SpeedCat desktop proxy client based on ClashMeta"
arch=('x86_64')
url="https://speedcat.me/"
license=('custom:unknown')
depends=('gtk3' 'libayatana-appindicator' 'hicolor-icon-theme')
optdepends=('xdg-utils: open external links from the application')
provides=("speedcat=${pkgver}")
conflicts=('speedcat')
options=('!strip' '!debug')
noextract=('scapp-linux-lite.zip')
_source_archive='scapp-linux-lite.zip'
_upstream_deb='dist/SpeedCat-3.0.3-linux-amd64.deb'
source=(
    "${_source_archive}::https://dl.pbb.dexi009.com/apps/sc/scapp-linux-lite.zip"
)
sha256sums=(
    '1e151010e1aaef5b75881c2604a553c7134653ff5c00d2d51dd04b17d91e3976'
)

package() {
    cd "${srcdir}"

    local debfile="${srcdir}/SpeedCat-linux-amd64.deb"

    bsdtar -xOf "${_source_archive}" "${_upstream_deb}" > "${debfile}"
    bsdtar -xOf "${debfile}" data.tar.zst | bsdtar -x -C "${pkgdir}"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s ../share/SpeedCat/SpeedCat "${pkgdir}/usr/bin/SpeedCat"
    ln -s SpeedCat "${pkgdir}/usr/bin/speedcat"
}
