# Maintainer: arthur_0 <maxc@stateoftheart.pw>
# Contributor: attenuation <ouyangjun1999@gmail.com>
# Contributor: arthur_0 <maxc@stateoftheart.pw>

pkgname=easyconnect
pkgver=7.6.7.3.76b7ebc57725ae1e999151cdc215f8e7cef8a31b
pkgrel=1
pkgdesc="Support access to ssl vpn. With easyconect，you can secure and speed up connection to cooperate network at ease!"
arch=('x86_64')
url="http://www.sangfor.com.cn"
license=('custom')
install=${pkgname}.install
source=("http://download.sangfor.com.cn/download/product/sslvpn/pkg/linux_767/EasyConnect_x64_7_6_7_3.deb"
        "http://ftp.acc.umu.se/pub/GNOME/sources/pango/1.42/pango-1.42.4.tar.xz")
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

