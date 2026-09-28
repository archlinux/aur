# Maintainer: heyeuuu <2829004293@qq.com>
pkgname=speedcat-bin
pkgver=3.1.8.2026071515
pkgrel=1
pkgdesc="Prebuilt SpeedCat desktop proxy client based on ClashMeta"
arch=('x86_64')
url="https://speedcat.me/"
license=('custom:unknown')
depends=('gtk3' 'libayatana-appindicator' 'libkeybinder3' 'hicolor-icon-theme')
optdepends=('xdg-utils: open external links from the application')
provides=("speedcat=${pkgver}")
conflicts=('speedcat')
options=('!strip' '!debug')
noextract=('scapp-linux-lite.zip')
_source_archive='scapp-linux-lite.zip'
_upstream_deb='dist/SpeedCat-3.1.8-linux-amd64.deb'
source=(
    "${_source_archive}::https://dl.pbbapi.hnlskj98.com/apps/sc/scapp-linux-lite.zip"
)
sha256sums=(
    '30f48119eea3774ffb9fb9cddb75fb3a2887e33943c523e2e6d65b5ee8b9e521'
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
