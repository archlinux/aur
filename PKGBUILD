# Maintainer: huj13k4n9 <huj13k4n9@qq.com>

pkgname=easyconnect-cas
pkgver=7.6.3.0.86415
pkgrel=2
pkgdesc="Accessing CAS's network resources over vpn connection."
arch=('x86_64')
url="https://newvpn.arp.cn/com/installClient.html"
license=('custom')
conflicts=('easyconnect')
install=${pkgname}.install
source=("http://download.sangfor.com.cn/download/product/sslvpn/pkg/linux_01/EasyConnect_x64.deb"
        "http://ftp.acc.umu.se/pub/GNOME/sources/pango/1.42/pango-1.42.4.tar.xz")
md5sums=('3d8c1adaf61b01ab49f68e331b0ec0d5'
         'deb171a31a3ad76342d5195a1b5bbc7c')

depends=('dbus' 'dbus-glib' 'libxrender' 'bash' 'nss' 'libxext' 'glibc' 'libxcursor' 'expat' 'sqlite' 'gtk2' 'harfbuzz' 'libxi' 'libcups' \
    'libx11' 'cairo' 'at-spi2-core' 'libxcomposite' 'fontconfig' 'pango' 'fribidi' 'libxtst' 'libxrandr' 'libxdamage' 'gdk-pixbuf2' 'libxft' \
    'libxcb' 'gcc-libs' 'libxfixes' 'zlib' 'nspr' 'alsa-lib' 'libthai' 'glib2' 'freetype2')
makedepends=('gobject-introspection' 'help2man' 'git' 'meson' 'gi-docgen')

package(){
        tar xzf data.tar.gz -C "${pkgdir}"
        tar xf ${srcdir}/pango-1.42.4.tar.xz
        cd pango-1.42.4
        ./configure --prefix=/usr
        make -j$(nproc) && make DESTDIR=${pkgdir}"/usr/share/sangfor/EasyConnect/oldlib/pango" install
        cd ${pkgdir}
        sed -i 's/Exec=/Exec=env LD_LIBRARY_PATH=\/usr\/share\/sangfor\/EasyConnect\/oldlib\/pango\/usr\/lib /g' "${pkgdir}/usr/share/applications/EasyConnect.desktop"
        install -D -m644 "${pkgdir}/usr/share/sangfor/EasyConnect/LICENSES.chromium.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
