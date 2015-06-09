# Maintainer: Yves G. <theYinYeti@yalis.fr>

pkgname=ysflight
pkgver=20150523
pkgrel=2
pkgdesc="A portable flight simulator"
arch=('i686' 'x86_64')
url="http://wwwe.ysflight.com/"
license=('freeware')
depends=(zenity lib32-libpulse lib32-glu)
ysflight_dir="/opt/ysflight-$pkgver"

source=('http://ysflight.in.coocan.jp/download/YsflightForLinux.zip'
        'ysflight.desktop'
        'ysflight-server.desktop'
        'ysflight.png'
        'ysflight.sh')
md5sums=('2257ce6d2041f55f7a17a1d4034983af'
         'd137828b093f2e16f289f5a3d922f31c'
         'eb042809766b50b7195065f8d2e0692b'
         'a544483da4de1585434c0c134eb60be0'
         'a72ce06ebea39126edd88d512d763115')

build() {
  cd "${srcdir}/"
  sed -i "s#YSFLIGHT_DIR#${ysflight_dir}#g" ysflight.sh
}

package() {
  cd "${pkgdir}/"

  mkdir -p "$(dirname "${ysflight_dir#/}")"
  cp -a "${srcdir}/Ysflight" "${ysflight_dir#/}"
  find "${ysflight_dir#/}" -type d -exec chmod 755 {} \;
  find "${ysflight_dir#/}" ! -type d -exec chmod 444 {} \;
  chmod 555 "${ysflight_dir#/}"/ysflight/ysflight*_*

  install -Dm755 "${srcdir}/ysflight.sh" usr/bin/ysflight
  touch usr/bin/ysflight
  ln -s ysflight usr/bin/ysflight-server
  install -Dm444 "${srcdir}/ysflight.png" usr/share/pixmaps/ysflight.png
  install -Dm755 "${srcdir}/ysflight.desktop" usr/share/applications/ysflight.desktop
  install -Dm755 "${srcdir}/ysflight-server.desktop" usr/share/applications/ysflight-server.desktop
}
