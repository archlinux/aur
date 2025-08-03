# Maintainer: Okabe Zero-Link (okbzl). Email: okabezerolink@gmail.com
# Contributor: BadBoy <luckmelove2@gmail.com>
#
pkgname='terabox-bin'
_pkgname="$(echo $pkgname |cut -d - -f 1 | tr 'tb' 'TB')"
pkgver='1.41.5'
pkgrel='1'
pkgdesc='Baidu netdisc international version'
arch=('x86_64')
license=('custom')
url='https://www.terabox.com/chinese/'

depends=(
    'gtkmm3'
    'gtkmm'
    'nspr'
    'nodejs'
    'alsa-lib'
    'nss'
)

optdepends=(
    'libappindicator-gtk3'
)

# DEB package
source=("https://data.nephobox.com/issue/terabox/Linux/${pkgver}/${_pkgname}_${pkgver}_amd64.deb")

sha256sums=('27f6bfd1c3f96f380a09577ba7aa1e1b7871f7236cff681a1ab92281b4fa2e4c')

options=(!strip)

prepare() {
    bsdtar -xpf "data.tar.bz2"
}

package() {
    cd "${srcdir}"

    # install application data
    mv -v "usr" "${pkgdir}"

    install -dm755 "${pkgdir}/usr/lib" "${pkgdir}/usr/share/licenses/${_pkgname}" "${pkgdir}/opt"
    mv "opt/${_pkgname}" "${pkgdir}/opt/"

    # fix promission
    chmod 644 "${pkgdir}/opt/${_pkgname}/"*.so
    find ${pkgdir} -type d -exec chmod 755 {} \;

    # install license
    ln -s "/usr/lib/${_pkgname}/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.electron.txt"
    ln -s "/usr/lib/${_pkgname}/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSES.chromium.html"
}

