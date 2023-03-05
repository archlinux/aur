# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: arthur_0 <maxc@stateoftheart.pw>
# Contributor: attenuation <ouyangjun1999@gmail.com>
pkgname=easyconnect
pkgver=7.6.7.3
pkgrel=2
_pangover=1.43.0
pkgdesc="Support access to ssl vpn. With easyconect,you can secure and speed up connection to cooperate network at ease!"
arch=('x86_64')
url="http://www.sangfor.com.cn"
license=('unknown')
depends=(at-spi2-core alsa-lib nss dbus-glib libxss gtk2)
makedepends=('meson' 'gobject-introspection')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.deb::https://download.sangfor.com.cn/download/product/sslvpn/pkg/linux_767/EasyConnect_x64_7_6_7_3.deb"
        "pango-${_pangover}.tar.xz::https://download.gnome.org/sources/pango/1.43/pango-${_pangover}.tar.xz")
md5sums=('a87cd6e5ecd521491b82d66682fe88f5'
         '2df040d3f6a4ed9bc316a70b35adcd8b')
package(){
    bsdtar -xvf data.tar.gz -C "${pkgdir}"
    bsdtar -xvf "${srcdir}/pango-${_pangover}.tar.xz"
    cd "${srcdir}/pango-${_pangover}"
    meson builddir -Dprefix=/usr
    DESTDIR=${pkgdir}"/usr/share/sangfor/EasyConnect/oldlib/pango" meson install -C builddir
    sed 's/Exec=/Exec=env LD_LIBRARY_PATH=\/usr\/share\/sangfor\/EasyConnect\/oldlib\/pango\/usr\/lib /g' -i "${pkgdir}/usr/share/applications/EasyConnect.desktop"
}