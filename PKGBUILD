# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: arthur_0 <maxc@stateoftheart.pw>
# Contributor: attenuation <ouyangjun1999@gmail.com>
pkgname=easyconnect
_appname=EasyConnect
pkgver=7.6.7.3
pkgrel=4
_pangover=1.42.4
pkgdesc="Support access to ssl vpn. With easyconect,you can secure and speed up connection to cooperate network at ease!"
arch=('x86_64')
url="http://www.sangfor.com.cn"
license=('custom')
conflicts=("${pkgname}" "${pkgname}-rpc" "${pkgname}-zjjy" "${pkgname}-sdu" "${pkgname}-cas")
depends=('dbus' 'dbus-glib' 'libxrender' 'bash' 'nss' 'libxext' 'glibc' 'libxcursor' 'expat' 'sqlite' 'gtk2' 'harfbuzz' 'libxi' 'libcups' \
    'libx11' 'cairo' 'at-spi2-core' 'libxcomposite' 'fontconfig' 'pango' 'fribidi' 'libxtst' 'libxrandr' 'libxdamage' 'gdk-pixbuf2' 'libxft' \
    'libxcb' 'gcc-libs' 'libxfixes' 'zlib' 'nspr' 'alsa-lib' 'libthai' 'glib2' 'freetype2')
makedepends=('gobject-introspection')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.deb::https://download.sangfor.com.cn/download/product/sslvpn/pkg/linux_767/${_appname}_x64_${pkgver//./_}.deb"
    "pango-${_pangover}.tar.xz::https://download.gnome.org/sources/pango/${_pangover%.4}/pango-${_pangover}.tar.xz"
    "LICENSE")
sha256sums=('ae623c6dc0354ff87afefbb770de5013bfd943051c9a653b93db708253b2f0d3'
            '1d2b74cd63e8bd41961f2f8d952355aa0f9be6002b52c8aa7699d9f5da597c9d'
            'b4b0db5e577c1b565a7f065ce8f9a4f9622b673fbcffa27ccbaf68f061a67a68')
package(){
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
    bsdtar -xf "${srcdir}/pango-${_pangover}.tar.xz"
    cd "${srcdir}/pango-${_pangover}"
    ./configure --prefix=/usr
    make -j4 && make DESTDIR="${pkgdir}/usr/share/sangfor/${_appname}/oldlib/pango" install
    sed "s|Exec=|Exec=env LD_LIBRARY_PATH=/usr/share/sangfor/${_appname}/oldlib/pango/usr/lib |g" -i "${pkgdir}/usr/share/applications/${_appname}.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}