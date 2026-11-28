# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>
# Contributor: Manuel Hüsers <aur@huesers.de>

pkgname=mintlocale
pkgver=1.6.10
pkgrel=1
pkgdesc="Language and locale selection tool"
arch=('any')
url='https://github.com/linuxmint/mintlocale'
license=('GPL-2.0-or-later')
depends=(
    'accountsservice'
    'gdk-pixbuf2'
    'glib2'
    'gtk3'
    'iso-flag-png'
    'mint-translations'
    'python'
    'python-cairo'
    'python-gobject'
    'xapp'
)
source=("${pkgname}-${pkgver}.tar.xz::http://packages.linuxmint.com/pool/main/m/${pkgname}_${pkgver}.tar.xz")
sha256sums=('2866fc34a8626cf9da591205f178fbac843e39075e821170ce5e48389b2259df')

prepare() {
    cd "${pkgname}"
    # Input methods are configured differently on Arch; drop the APT-based tool.
    rm -rf usr/bin/mintlocale-im \
           usr/share/applications/mintlocale-im.desktop \
           usr/share/icons/hicolor/*/apps/mintlocale-im.* \
           usr/lib/linuxmint/mintlocale/im.py \
           usr/lib/linuxmint/mintlocale/ImConfig \
           usr/share/linuxmint/mintlocale/im.ui \
           usr/share/linuxmint/mintlocale/iminfo \
           usr/share/linuxmint/adjustments
    find usr/share/icons -type d -empty -delete
}

package() {
    cd "${pkgname}"
    cp -r usr "${pkgdir}"
}
