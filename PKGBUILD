# Maintainer: HelloImWar <helloimwar at proton dot me>
# Original Maintainer : Yamada Hayao <hayao@fascode.net>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: slact

# BEGIN AUTOMATICALLY UPDATED SECTION
_tlpui_ver=1.5.0-5
_sha256=57e769db744908b394aa594ee0b53836ca3fd625cb95044fa49a68dfe0c911fe
# END AUTOMATICALLY UPDATED SECTION

pkgname=tlpui
pkgver="$(tr "-" "." <<< "${_tlpui_ver}")"
pkgrel="1"
pkgdesc="A GTK user interface for TLP written in Python"
arch=('any')
url="https://github.com/d4nj1/TLPUI"
license=('GPL2')
depends=('tlp' 'python-gobject')
makedepends=('git' 'python-setuptools')
source=(
    "tlpui-${_tlpui_ver}.zip::https://github.com/d4nj1/TLPUI/archive/tlpui-${_tlpui_ver}.zip"
    "${pkgname}.desktop"
)
sha256sums=(${_sha256}
            'fbf9e4b92bff5c92f5ced1ee1b155110b32cd128e5f066260d8dc6cea163c4af')

build() {
    cd "${srcdir}/TLPUI-tlpui-${_tlpui_ver}"
    python ./setup.py build
}

package() {
    cd "${srcdir}/TLPUI-tlpui-${_tlpui_ver}"
    export PYTHONHASHSEED=0
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
