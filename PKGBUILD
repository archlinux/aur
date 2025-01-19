# Maintainer: Huang Yuhui <bombeuler@foxmail.com>

pkgname=easyconnect-hust
pkgver=7.6.7.3
pkgrel=1
pkgdesc="Accessing HUST's network resources over vpn connection."
arch=('x86_64')
url="https://vpn.hust.edu.cn/portal/#!/down_client"
license=('custom')
depends=('glib2-devel')
conflicts=('easyconnect')
install=${pkgname}.install
source=("https://download.sangfor.com.cn/download/product/sslvpn/pkg/linux_767/EasyConnect_x64_7_6_7_3.deb"
        "http://ftp.gnome.org/pub/gnome/sources/pango/1.42/pango-1.42.4.tar.xz")
md5sums=('a87cd6e5ecd521491b82d66682fe88f5'
         'deb171a31a3ad76342d5195a1b5bbc7c')
package(){
        tar xzf data.tar.gz -C "${pkgdir}"
        tar xf ${srcdir}/pango-1.42.4.tar.xz 
        cd pango-1.42.4
        ./configure --prefix=/usr
        make -j4 && make DESTDIR=${pkgdir}"/usr/share/sangfor/EasyConnect/oldlib/pango" install
        cd ${pkgdir}
        sed -i 's/Exec=/Exec=env LD_LIBRARY_PATH=\/usr\/share\/sangfor\/EasyConnect\/oldlib\/pango\/usr\/lib /g' "${pkgdir}/usr/share/applications/EasyConnect.desktop"
        install -D -m644 "${pkgdir}/usr/share/sangfor/EasyConnect/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

