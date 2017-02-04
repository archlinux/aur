# Maintainer: Hieu <hthhieu g-mail>

pkgname=zalo
pkgver=0.1
pkgrel=1
pkgdesc="Zalo - Nhắn gửi yêu thương"
arch=('x86_64')
url="https://zalo.me/pc"
license=('custom')
source=("http://res.zaloapp.com/pc/ZaloSetupLinux.deb"
        "zalo")
depends=("libappindicator-gtk2" "glibc" "gcc-multilib" "gdk-pixbuf2" "mesa" "glib2" "gtk2" "harfbuzz" "icu" "libpng" "libpulse" "openssl" "libstdc++5" "libx11" "libxext" "zlib" "qt5-multimedia" "sqlcipher")
md5sums=('451e9d5ac746d8a89b86282020b496ba'
         '56b30da353661e268300bb168c796cdb') 

prepare() {
  cd "${srcdir}"
  tar -Jxf data.tar.xz
  sed -e 's|Exec=/opt/zalo/zalo|Exec=zalo|g' \
      -e 's|Application|Network;Application;InstantMessaging;|g' \
      -e 's|/usr/share/pixmaps/zalo.png|zalo.png|g' \
      -i usr/share/applications/zalopc.desktop
}

package() {
  cd ${srcdir}
  install -m 755 -d "${pkgdir}"/opt/zalo/
  install -m 755 -d "${pkgdir}"/usr/share/
  install -Dm755 zalo "${pkgdir}"/usr/bin/zalo
  cp -r ${srcdir}/opt/zalo/ "${pkgdir}"/opt/
  cp -r ${srcdir}/usr/share/ "${pkgdir}"/usr/
}

