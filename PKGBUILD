# $Id$
# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgbase=xorg-server-bug865
pkgname=xorg-server-bug865
pkgver=1.17.1
pkgrel=7 # build first with 0.1 and then rebuild it after xf86-input-evdev rebuild
arch=('i686' 'x86_64')
license=('custom')
url="http://xorg.freedesktop.org"
makedepends=('pixman' 'libx11' 'mesa' 'mesa-libgl' 'xf86driproto' 'xcmiscproto' 'xtrans' 'bigreqsproto' 'randrproto' 
             'inputproto' 'fontsproto' 'videoproto' 'presentproto' 'compositeproto' 'recordproto' 'scrnsaverproto'
             'resourceproto' 'xineramaproto' 'libxkbfile' 'libxfont' 'renderproto' 'libpciaccess' 'libxv'
             'xf86dgaproto' 'libxmu' 'libxrender' 'libxi' 'dmxproto' 'libxaw' 'libdmx' 'libxtst' 'libxres'
             'xorg-xkbcomp' 'xorg-util-macros' 'xorg-font-util' 'glproto' 'dri2proto' 'libgcrypt' 'libepoxy'
             'xcb-util' 'xcb-util-image' 'xcb-util-renderutil' 'xcb-util-wm' 'xcb-util-keysyms' 'dri3proto'
             'libxshmfence' 'libunwind') 
source=(${url}/releases/individual/xserver/xorg-server-${pkgver}.tar.bz2{,.sig}
        nvidia-drm-outputclass.conf
        xvfb-run
        xvfb-run.1
        os-access-fix-regression-in-server-interpreted-auth.patch
        v2-xserver-Fix-a-crash-with-XDMCP-error-handler.patch
        0001-int10-Fix-error-check-for-pci_device_map_legacy.patch
        0001-mi-Partial-pie-slice-filled-arcs-may-need-more-space.patch
        0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch
        0001-dix-Add-unaccelerated-valuators-to-the-ValuatorMask.patch
        0002-dix-hook-up-the-unaccelerated-valuator-masks.patch
        fix-CVE-2015-3164.patch
        systemd-logind-dont-second-guess-D-Bus-default-tim.patch
        systemd-logind-filter-out-non-signal-messages-from.patch
        0001-modesetting-Fix-software-cursor-fallback.patch
        freedesktop-bug-865.patch)
validpgpkeys=('7B27A3F1A6E18CD9588B4AE8310180050905E40C'
              'C383B778255613DFDB409D91DB221A6900000011')
sha256sums=('2bf8e9f6f0a710dec1d2472467bff1f4e247cb6dcd76eb469aafdc8a2d7db2ab'
            'SKIP'
            'af1c3d2ea5de7f6a6b5f7c60951a189a4749d1495e5462f3157ae7ac8fe1dc56'
            'ff0156309470fc1d378fd2e104338020a884295e285972cc88e250e031cc35b9'
            '2460adccd3362fefd4cdc5f1c70f332d7b578091fb9167bf88b5f91265bbd776'
            '8a9d76eecf8795ca645fb1ce261733965578e953f6606153ce001a0e15d036e8'
            'a73e33644682d9f430db987c192da0f7193907af50539669ebd59614a5ebd0f9'
            '2ea82cdbd695f21c935710847913ed58e22d3d5c0c18c96175a4a6cc1142c071'
            'ca89cc013844c5b50abfde4cc5e852ecdf4368f8b069ffd069a7100843c46e90'
            'b4a4fbddebfa614d1a97e77dde98748682ee331fbf7be394480050670d6203aa'
            '3dc795002b8763a7d29db94f0af200131da9ce5ffc233bfd8916060f83a8fad7'
            '416a1422eed71efcebb1d893de74e7f27e408323a56c4df003db37f5673b3f96'
            'bc6ac3e686e16f0357fd3b939c1c1f2845fdb444d5ec9c8c37fb69167cc54a28'
            'a8b9670844d784e9a0d6880f5689bbc107e071518acdbaa8c3ce5debca6b663b'
            '97e4d5a6cfcf916889c493e232aec6f16d9447eb641bafb6e0afa9b27cfdc47e'
            'a0c0dbf5fe27994d52d5892c9c7cecf72792c5fa35db57b112ee7b17980faa75'
            'ad64fd593cd4cdfdd830c4295ebe1acd4259e45cfc12a258a162ecdbb11fd7ca')

prepare() {
  cd "xorg-server-${pkgver}"
  # fix FS#43884, merged upstream
  patch -Np1 -i ../os-access-fix-regression-in-server-interpreted-auth.patch
  # partially fix FS#43867, merged upstream
  patch -Np1 -i ../v2-xserver-Fix-a-crash-with-XDMCP-error-handler.patch
  # fix FS#43924, merged upstream
  patch -Np1 -i ../0001-int10-Fix-error-check-for-pci_device_map_legacy.patch
  # fix FS#43937, merged upstream
  patch -Np1 -i ../0001-mi-Partial-pie-slice-filled-arcs-may-need-more-space.patch
  # fix FS#45245, merged upstream
  patch -Np1 -i ../0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch
  # fix FS#45229, merged upstream
  patch -Np1 -i ../0001-dix-Add-unaccelerated-valuators-to-the-ValuatorMask.patch
  patch -Np1 -i ../0002-dix-hook-up-the-unaccelerated-valuator-masks.patch
  # fix CVE-2015-3164, merged upstream
  patch -Np1 -i ../fix-CVE-2015-3164.patch

  # Fix FS#44304, merged upstream
  patch -Np1 -i ../systemd-logind-filter-out-non-signal-messages-from.patch
  patch -Np1 -i ../systemd-logind-dont-second-guess-D-Bus-default-tim.patch

  # Fix software cursor fallback (possible fix for FS#44602)
  patch -Np1 -i ../0001-modesetting-Fix-software-cursor-fallback.patch

  # The patch for freedesktop bug 865
  patch -Np1 -i "${srcdir}/freedesktop-bug-865.patch"
}

build() {
  cd "xorg-server-${pkgver}"
  autoreconf -fi
  ./configure --prefix=/usr \
      --enable-ipv6 \
      --enable-dri \
      --enable-dmx \
      --enable-xvfb \
      --enable-xnest \
      --enable-composite \
      --enable-xcsecurity \
      --enable-libunwind \
      --enable-xorg \
      --enable-xephyr \
      --enable-glamor \
      --enable-xwayland \
      --enable-glx-tls \
      --enable-kdrive \
      --enable-kdrive-evdev \
      --enable-kdrive-kbd \
      --enable-kdrive-mouse \
      --enable-config-udev \
      --enable-systemd-logind \
      --enable-suid-wrapper \
      --disable-install-setuid \
      --enable-record \
      --disable-xfbdev \
      --disable-xfake \
      --disable-static \
      --libexecdir=/usr/lib/xorg-server \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --with-xkb-path=/usr/share/X11/xkb \
      --with-xkb-output=/var/lib/xkb \
      --with-fontrootdir=/usr/share/fonts \
      --with-sha1=libgcrypt
      
#      --without-dtrace \
#      --disable-linux-acpi --disable-linux-apm \

  make

  # Disable subdirs for make install rule to make splitting easier
  sed -e 's/^DMX_SUBDIRS =.*/DMX_SUBDIRS =/' \
      -e 's/^XVFB_SUBDIRS =.*/XVFB_SUBDIRS =/' \
      -e 's/^XNEST_SUBDIRS =.*/XNEST_SUBDIRS = /' \
      -e 's/^KDRIVE_SUBDIRS =.*/KDRIVE_SUBDIRS =/' \
      -e 's/^XWAYLAND_SUBDIRS =.*/XWAYLAND_SUBDIRS =/' \
      -i hw/Makefile
}

package_xorg-server-bug865() {
  pkgdesc="Xorg X server with the patch for freedesktop bug 865"
  depends=(libepoxy libxdmcp libxfont libpciaccess libdrm pixman libgcrypt libxau xorg-server-common xf86-input-evdev libxshmfence libgl)
  # see xorg-server-*/hw/xfree86/common/xf86Module.h for ABI versions - we provide major numbers that drivers can depend on
  # and /usr/lib/pkgconfig/xorg-server.pc in xorg-server-devel pkg
  provides=('X-ABI-VIDEODRV_VERSION=19' 'X-ABI-XINPUT_VERSION=21.1' 'X-ABI-EXTENSION_VERSION=9.0' 'x-server' 'xorg-server=1.17.1')
  groups=('xorg')
  conflicts=('nvidia-utils<=331.20' 'glamor-egl' 'xf86-video-modesetting' 'xorg-server')
  replaces=('glamor-egl' 'xf86-video-modesetting')
  install=xorg-server.install

  cd "xorg-server-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # distro specific files must be installed in /usr/share/X11/xorg.conf.d
  install -m755 -d "${pkgdir}/etc/X11/xorg.conf.d"
  install -m644 "${srcdir}/nvidia-drm-outputclass.conf" "${pkgdir}/usr/share/X11/xorg.conf.d/"

  # Needed for non-mesa drivers, libgl will restore it
  mv "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.so" \
     "${pkgdir}/usr/lib/xorg/modules/extensions/libglx.xorg"

  rm -rf "${pkgdir}/var"

  rm -f "${pkgdir}/usr/share/man/man1/Xserver.1"
  rm -f "${pkgdir}/usr/lib/xorg/protocol.txt"

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server/COPYING"

  rm -rf "${pkgdir}/usr/lib/pkgconfig"
  rm -rf "${pkgdir}/usr/include"
  rm -rf "${pkgdir}/usr/share/aclocal"
}
