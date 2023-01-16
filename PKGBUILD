# Maintainer: sunflowercx <1527981693@qq.com>

pkgname=easyconnect-rpc
pkgver=7.6.7.3
pkgrel=2
pkgdesc="Accessing RPC's network resources over vpn connection."
arch=('x86_64')
url="https://vpn.rpc.edu.cn"
license=('custom')
depends=('gtk2' 'lib32-gtk2')
makedepends=('meson' 'gobject-introspection')
install=${pkgname}.install
source=("https://download.sangfor.com.cn/download/product/sslvpn/pkg/linux_767/EasyConnect_x64_7_6_7_3.deb"
        "https://download.gnome.org/sources/pango/1.43/pango-1.43.0.tar.xz")
md5sums=('a87cd6e5ecd521491b82d66682fe88f5'
         '2df040d3f6a4ed9bc316a70b35adcd8b')
package(){
        tar xf ${srcdir}/pango-1.43.0.tar.xz
        tar xzf data.tar.gz -C "${pkgdir}"
        cd pango-1.43.0
        meson builddir -Dprefix=/usr
        DESTDIR=${pkgdir}"/usr/share/sangfor/EasyConnect/oldlib/pango" meson install -C builddir
        cd ${pkgdir}
        sed -i 's/Exec=/Exec=env LD_LIBRARY_PATH=\/usr\/share\/sangfor\/EasyConnect\/oldlib\/pango\/usr\/lib /g' "${pkgdir}/usr/share/applications/EasyConnect.desktop"
        install -D -m644 "${pkgdir}/usr/share/sangfor/EasyConnect/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

