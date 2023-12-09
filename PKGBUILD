# Contributor: Dirk Sohler <spam@0x7be.de>
# Maintainer: Dirk Sohler <spam@0x7be.de>
# vim: ts=4:sw=4



pkgname=minetest-game-cdb
pkgver=5.7.0
pkgrel=1
pkgdesc='Latest version of “Minetest Game” from the Minetest Content Database, but installed system-wide as a regular Arch package.'

url='https://content.minetest.net/packages/Minetest/minetest_game/'
arch=('any')
license=('LGPL-2.1')

depends=('minetest>=5.8.0' 'minetest-common>=5.8.0')
conflicts=('minetest<=5.7.0' 'minetest-common<=5.7.0')
makedepends=('curl' 'unzip' 'jq')

prepare() {
    cdb='https://content.minetest.net'
    releases=$(curl "${cdb}/api/packages/Minetest/minetest_game/releases/")
    dlpath=$(echo $releases | jq -r '.[0].url')
    curl "${cdb}${dlpath}" --output 'minetest-game-cdb.zip'
    unzip "${srcdir}/minetest-game-cdb.zip"
}

pkgver() {
    echo $releases | jq -r '.[0].title'
}

package() {
    location='usr/share/minetest/games'
    install -d "${pkgdir}/${location}"
    cp -r "${srcdir}/minetest_game/" "${pkgdir}/${location}/"
}
