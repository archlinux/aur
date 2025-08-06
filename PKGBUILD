# Maintainer: Michele Palazzi <sysdadmin@m1k.cloud>

pkgname=plex-htpc
pkgver=1.71.1.346
_pkghash=f62ce923
pkgrel=1
pkgdesc="Plex HTPC client for linux"
arch=('x86_64')
url='http://plex.tv'
license=('custom')
depends=(libgl
  hicolor-icon-theme
  alsa-lib
  dbus
  expat
  ffmpeg
  fontconfig
  freetype2
  gcc-libs
  glib2
  glibc
  harfbuzz
  lcms2
  libdrm
  libjpeg-turbo
  libwebp
  libx11
  libxcb
  libxcomposite
  libxdamage
  libxext
  libxfixes
  libxml2-legacy
  libxkbcommon
  libxkbfile
  libxrandr
  libxslt
  libxtst
  mesa
  minizip
  nspr
  nss
  opus
  xcb-util-renderutil
  pciutils
  libxss
  xcb-util-image
  libxkbcommon-x11
  libxinerama
  xcb-util-keysyms
  xcb-util-wm
  zlib
  snappy
  libva
  libpulse
  libxrender
  wayland
  qt6-base
)
source=("https://artifacts.plex.tv/plex-htpc-stable/$pkgver-$_pkghash/linux/PlexHTPC-$pkgver-$_pkghash-linux-x86_64.tar.bz2"
  "http://ftp.us.debian.org/debian/pool/main/libw/libwebp/libwebp6_0.6.1-2.1+deb11u2_amd64.deb"
  "https://github.com/flathub/tv.plex.PlexHTPC/raw/master/tv.plex.PlexHTPC.desktop"
  "https://github.com/flathub/tv.plex.PlexHTPC/raw/master/tv.plex.PlexHTPC.png"
)
sha256sums=('ea1baab13c406272ace83e9407c59f647b8367b6067ef3bf2983470b67a9eb9d'
            '8abc2b1ca77a458bbbcdeb6af5d85316260977370fa2518d017222b3584d9653'
            'b98d1ba9191e346a256f1c838051b2d547f638558d79898df8b1707c7cabe487'
            '069cdf95608a46af4313bdffb281df37819e77c4e371c1e1667af889f0f325a2')
noextract=('Plex-$pkgver-$_pkghash-linux-x86_64.tar.bz2')

package() {
  cd $srcdir

  install -d "${pkgdir}/opt/${pkgname}"
  tar --no-same-owner -xvf $srcdir/PlexHTPC-$pkgver-$_pkghash-linux-x86_64.tar.bz2 -C $pkgdir/opt/${pkgname}
  tar -xvf $srcdir/data.tar.xz ./usr/lib/x86_64-linux-gnu/libwebp.so.6.0.2
  install -Dm644 usr/lib/x86_64-linux-gnu/libwebp.so.6.0.2 ${pkgdir}/opt/${pkgname}/lib/libwebp.so.6

  rm -rf $pkgdir/opt/${pkgname}/lib/dri
  rm -rf $pkgdir/opt/${pkgname}/lib/libEGL.so*
  rm -rf $pkgdir/opt/${pkgname}/lib/libdrm.so*
  rm -rf $pkgdir/opt/${pkgname}/lib/libdrm_*.so*
  rm -rf $pkgdir/opt/${pkgname}/lib/libpciaccess.so*
  rm -rf $pkgdir/opt/${pkgname}/lib/libva.so*
  rm -rf $pkgdir/opt/${pkgname}/lib/libva-*.so*

  install -d ${pkgdir}/usr/bin
  ln -s /opt/${pkgname}/Plex.sh ${pkgdir}/usr/bin/Plex

  install -Dm644 "${srcdir}/tv.plex.PlexHTPC.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/tv.plex.PlexHTPC.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"
}
