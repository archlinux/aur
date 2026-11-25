# Maintainer: taotieren <admin@taotieren.com>

pkgbase=lynx-imager-bin
pkgname=lynx-imager-bin
_pkgname=LYNX-Imager
_tagname=0.1-rc11
pkgver=${_tagname//-/+}
pkgrel=1
arch=('x86_64')
# https://github.com/dshanpi/lynx-imager/releases/download/v0.1-rc4/LYNX-Imager_0.1.0-rc.4_linux-amd64.deb
_tagbase=${_tagname%%-*}
_tagrc=${_tagname#*-}
if [[ ${_tagrc} == "${_tagname}" ]]; then _tagrc=; fi
case ${_tagbase} in
    *.*.*) _assetbase=${_tagbase} ;;
    *.*)   _assetbase=${_tagbase}.0 ;;
    *)     _assetbase=${_tagbase}.0.0 ;;
esac
if [[ -n ${_tagrc} ]]; then
    _assetver=${_assetbase}-$(printf '%s' "${_tagrc}" | sed -E 's/([A-Za-z])([0-9])/\1.\2/')
else
    _assetver=${_assetbase}
fi
_name=${_pkgname}_${_assetver}_linux-amd64
options=(!strip !debug)
depends=(
    cairo
    dbus
    gdk-pixbuf2
    glib2
    gtk3
    hicolor-icon-theme
    libbz2.so
    libgcc_s.so
    libsoup3
    libusb
    libz.so
    libzstd.so
    libwebkit2gtk-4.1.so
    systemd-libs
)
makedepends=(libarchive)
optdepends=()
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
replaces=()
pkgdesc="YNX Imager is open-source desktop software designed for flashing system images onto development boards"
license=('GPL-3.0-or-later')
url="https://github.com/dshanpi/lynx-imager"
install=
source=("${url}/releases/download/v${_tagname}/${_name}.deb")
sha256sums=('238697326fd8806b23d52615da3c17d8c6acfa824eaafb764faab744b7e4c99f')
# noextract=()

# prepare() {
#     mkdir -pv ${srcdir}/${pkgname}-${pkgver}
#     bsdtar -xf "${srcdir}/${_name}.deb" --numeric-owner -C "${srcdir}/${pkgname}-${pkgver}"
# }

package() {
    # cd ${srcdir}/${_name}
    bsdtar -xf "${srcdir}"/data.* --numeric-owner -C "${pkgdir}/"
    # install -Dm644 license -t ${pkgdir}/usr/share/licenses/${pkgname}/
    sed -i 's#GROUP="plugdev", ##' ${pkgdir}/usr/lib/udev/rules.d/70-dshanpi-lynx-imager.rules
}
