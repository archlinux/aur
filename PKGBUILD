# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: arthur_0 <maxc@stateoftheart.pw>
# Contributor: attenuation <ouyangjun1999@gmail.com>
pkgname=easyconnect
pkgver=7.6.7.3
pkgrel=3
_pangover=1.43.0
pkgdesc="Support access to ssl vpn. With easyconect,you can secure and speed up connection to cooperate network at ease!"
arch=('x86_64')
url="http://www.sangfor.com.cn"
license=('custom')
depends=(libxdamage libxrandr libcups gcc-libs zlib nss gtk2 fontconfig fribidi dbus-glib libxcursor glibc libxft nspr libthai libxi at-spi2-core\
libxtst freetype2 libxrender expat alsa-lib libxcb libxcomposite libxext pango dbus sqlite cairo libx11 harfbuzz gdk-pixbuf2 libxfixes glib2 bash)
makedepends=(meson gobject-introspection)
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.deb::https://download.sangfor.com.cn/download/product/sslvpn/pkg/linux_767/EasyConnect_x64_7_6_7_3.deb"
"pango-${_pangover}.tar.xz::https://download.gnome.org/sources/pango/1.43/pango-${_pangover}.tar.xz"
"LICENSE")
sha256sums=('ae623c6dc0354ff87afefbb770de5013bfd943051c9a653b93db708253b2f0d3'
'd2c0c253a5328a0eccb00cdd66ce2c8713fabd2c9836000b6e22a8b06ba3ddd2'
'b4b0db5e577c1b565a7f065ce8f9a4f9622b673fbcffa27ccbaf68f061a67a68')
package(){
bsdtar -xf data.tar.gz -C "${pkgdir}"
bsdtar -xf "${srcdir}/pango-${_pangover}.tar.xz"
cd "${srcdir}/pango-${_pangover}"
meson builddir -Dprefix=/usr
DESTDIR=${pkgdir}"/usr/share/sangfor/EasyConnect/oldlib/pango" meson install -C builddir
sed 's/Exec=/Exec=env LD_LIBRARY_PATH=\/usr\/share\/sangfor\/EasyConnect\/oldlib\/pango\/usr\/lib /g' -i "${pkgdir}/usr/share/applications/EasyConnect.desktop"
install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}