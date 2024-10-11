# Maintainer: Ludvig Hozman <ludvig.hozman@gmail.com>

pkgname=plex-desktop
pkgver=1.103.1.238
_pkghash=223cbba6
pkgrel=1
pkgdesc="Plex desktop client for linux"
arch=('x86_64')
url='http://plex.tv'
license=('unknown')
depends=(libgl
  hicolor-icon-theme
  alsa-lib
  dbus
  expat
  ffmpeg6.1
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
  libxkbcommon
  libxkbfile
  libxml2
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
source=("https://artifacts.plex.tv/plex-desktop-stable/$pkgver-$_pkghash/linux/Plex-$pkgver-$_pkghash-linux-x86_64.tar.bz2"
  "http://ftp.us.debian.org/debian/pool/main/libw/libwebp/libwebp6_0.6.1-2.1+deb11u2_amd64.deb"
  "https://github.com/flathub/tv.plex.PlexDesktop/raw/master/tv.plex.PlexDesktop.desktop"
  "https://github.com/flathub/tv.plex.PlexDesktop/raw/master/tv.plex.PlexDesktop.png"
)
sha256sums=('be698e18f3f5f98bdbec6b42e2746b7e5654cc5319f2c6b4dcdacecc255aa1ba'
            '8abc2b1ca77a458bbbcdeb6af5d85316260977370fa2518d017222b3584d9653'
            '2215f6bb3a2bbe50ceb3bedcb93f53d11f6a51ec7512f08f68af91da8253261b'
            '565178841c318fb4926acf65a68df6dae484c0b705be6dd736858e7408a261d5')
noextract=('Plex-$pkgver-$_pkghash-linux-x86_64.tar.bz2')

package() {
  cd $srcdir

  install -d "${pkgdir}/opt/${pkgname}"
  tar --no-same-owner -xvf $srcdir/Plex-$pkgver-$_pkghash-linux-x86_64.tar.bz2 -C $pkgdir/opt/${pkgname}
  tar -xvf $srcdir/data.tar.xz ./usr/lib/x86_64-linux-gnu/libwebp.so.6.0.2
  install -Dm644 usr/lib/x86_64-linux-gnu/libwebp.so.6.0.2 ${pkgdir}/opt/${pkgname}/lib/libwebp.so.6

  rm -rf $pkgdir/opt/${pkgname}/lib/dri
  rm -rf $pkgdir/opt/${pkgname}/lib/libEGL.so*
  rm -rf $pkgdir/opt/${pkgname}/lib/libdrm.so*
  rm -rf $pkgdir/opt/${pkgname}/lib/libdrm_*.so*
  rm -rf $pkgdir/opt/${pkgname}/lib/libpciaccess.so*
  rm -rf $pkgdir/opt/${pkgname}/lib/libswresample.so*
  rm -rf $pkgdir/opt/${pkgname}/lib/libva.so*
  rm -rf $pkgdir/opt/${pkgname}/lib/libva-*.so*

  install -d ${pkgdir}/usr/bin
  ln -s /opt/${pkgname}/Plex.sh ${pkgdir}/usr/bin/Plex

  install -Dm644 "${srcdir}/tv.plex.PlexDesktop.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/tv.plex.PlexDesktop.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps/"
}
