# Maintainer: Det <nimetonmaili g-mail>
# Based on [testing]'s xorg-server

_pkgbase=xorg-server
pkgname=('xorg-server-dev' 'xorg-server-xephyr-dev' 'xorg-server-xdmx-dev' 'xorg-server-xvfb-dev' 'xorg-server-xnest-dev' 'xorg-server-xwayland-dev' 'xorg-server-common-dev' 'xorg-server-devel-dev')
pkgver=1.17.1  # http://lists.x.org/archives/xorg/2015-February/057159.html
pkgrel=7 # build first with 0.1 and then rebuild it after xf86-input-evdev rebuild
arch=('i686' 'x86_64')
license=('custom')
url="http://xorg.freedesktop.org"
makedepends=('pixman' 'libx11' 'mesa' 'libgl' 'xf86driproto' 'xcmiscproto' 'xtrans' 'bigreqsproto' 'randrproto' 
             'inputproto' 'fontsproto' 'videoproto' 'presentproto' 'compositeproto' 'recordproto' 'scrnsaverproto'
             'resourceproto' 'xineramaproto' 'libxkbfile' 'libxfont' 'renderproto' 'libpciaccess' 'libxv'
             'xf86dgaproto' 'libxmu' 'libxrender' 'libxi' 'dmxproto' 'libxaw' 'libdmx' 'libxtst' 'libxres'
             'xorg-xkbcomp' 'xorg-util-macros' 'xorg-font-util' 'glproto' 'dri2proto' 'libgcrypt' 'libepoxy'
             'xcb-util' 'xcb-util-image' 'xcb-util-renderutil' 'xcb-util-wm' 'xcb-util-keysyms' 'dri3proto'
             'libxshmfence' 'libunwind') 
source=(${url}/releases/individual/xserver/${_pkgbase}-${pkgver}.tar.bz2{,.sig}
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
        0001-modesetting-Fix-software-cursor-fallback.patch)
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
            'a0c0dbf5fe27994d52d5892c9c7cecf72792c5fa35db57b112ee7b17980faa75')

prepare() {
  cd "${_pkgbase}-${pkgver}"

  msg2 "fix FS#43884, merged upstream"
  patch -Np1 -i ../os-access-fix-regression-in-server-interpreted-auth.patch

  msg2 "partially fix FS#43867, merged upstream"
  patch -Np1 -i ../v2-xserver-Fix-a-crash-with-XDMCP-error-handler.patch

  msg2 "fix FS#43924, merged upstream"
  patch -Np1 -i ../0001-int10-Fix-error-check-for-pci_device_map_legacy.patch

  msg2 "fix FS#43937, merged upstream"
  patch -Np1 -i ../0001-mi-Partial-pie-slice-filled-arcs-may-need-more-space.patch

  msg2 "fix FS#45245, merged upstream"
  patch -Np1 -i ../0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch

  msg2 "fix FS#45229, merged upstream"
  patch -Np1 -i ../0001-dix-Add-unaccelerated-valuators-to-the-ValuatorMask.patch
  patch -Np1 -i ../0002-dix-hook-up-the-unaccelerated-valuator-masks.patch

  msg2 "fix CVE-2015-3164, merged upstream"
  patch -Np1 -i ../fix-CVE-2015-3164.patch

  msg2 "fix FS#44304, merged upstream"
  patch -Np1 -i ../systemd-logind-filter-out-non-signal-messages-from.patch
  patch -Np1 -i ../systemd-logind-dont-second-guess-D-Bus-default-tim.patch

  msg2 "fix software cursor fallback (possible fix for FS#44602)"
  patch -Np1 -i ../0001-modesetting-Fix-software-cursor-fallback.patch
}

build() {
  cd "${_pkgbase}-${pkgver}"

  msg2 "Starting autoreconf..."
  autoreconf -fi

  msg2 "Starting ./configure..."
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

  msg2 "Starting make..."
  make

  # Disable subdirs for make install rule to make splitting easier
  sed -e 's/^DMX_SUBDIRS =.*/DMX_SUBDIRS =/' \
      -e 's/^XVFB_SUBDIRS =.*/XVFB_SUBDIRS =/' \
      -e 's/^XNEST_SUBDIRS =.*/XNEST_SUBDIRS = /' \
      -e 's/^KDRIVE_SUBDIRS =.*/KDRIVE_SUBDIRS =/' \
      -e 's/^XWAYLAND_SUBDIRS =.*/XWAYLAND_SUBDIRS =/' \
      -i hw/Makefile
}

package_xorg-server-common-dev() {
  pkgdesc="Xorg server common files - Bleeding edge version"
  depends=('xkeyboard-config' 'xorg-xkbcomp' 'xorg-setxkbmap' 'xorg-fonts-misc'
           'libunwind')
  provides=('xorg-server-common')
  conflicts=('xorg-server-common')

  cd "${_pkgbase}-${pkgver}"
  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-common"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/xorg-server-common"
  
  msg2 "Starting make install-data..."
  make -C xkb DESTDIR="${pkgdir}" install-data

  install -m755 -d "${pkgdir}/usr/share/man/man1"
  install -m644 man/Xserver.1 "${pkgdir}/usr/share/man/man1/"

  install -m755 -d "${pkgdir}/usr/lib/xorg"
  install -m644 dix/protocol.txt "${pkgdir}/usr/lib/xorg/"
}

package_xorg-server-dev() {
  pkgdesc="Xorg X server - Bleeding edge version"
  depends=(libepoxy libxdmcp libxfont libpciaccess libdrm pixman libgcrypt libxau xorg-server-common-dev xf86-input-evdev libxshmfence libgl)
  # see src/xorg-server-*/hw/xfree86/common/xf86Module.h for ABI versions - we provide major numbers that drivers can depend on
  # and /usr/lib/pkgconfig/xorg-server.pc in xorg-server-devel-dev pkg
  _ABI_VIDEODRV="$(grep -Po "VIDEODRV_V.*\(\K[^)]*" ${_pkgbase}-${pkgver}/hw/xfree86/common/xf86Module.h | sed "s/, /./")"
  _ABI_XINPUT="$(grep -Po "XINPUT_V.*\(\K[^)]*" ${_pkgbase}-${pkgver}/hw/xfree86/common/xf86Module.h | sed "s/, /./")"
  _ABI_EXTENSION="$(grep -Po "EXTENSION_V.*\(\K[^)]*" ${_pkgbase}-${pkgver}/hw/xfree86/common/xf86Module.h | sed "s/, /./")"
  provides=("X-ABI-VIDEODRV_VERSION=$_ABI_VIDEODRV"
            #"X-ABI-XINPUT_VERSION=$_ABI_XINPUT"
            'X-ABI-XINPUT_VERSION=21.1'
            "X-ABI-EXTENSION_VERSION=$_ABI_EXTENSION"
            'x-server' 'xorg-server')
  groups=('xorg')
  conflicts=('nvidia-utils<=331.20' 'glamor-egl' 'xf86-video-modesetting' 'xorg-server')
  replaces=('glamor-egl' 'xf86-video-modesetting')
  install=xorg-server-dev.install

  cd "${_pkgbase}-${pkgver}"

  msg2 "Starting make install..."
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

package_xorg-server-xephyr-dev() {
  pkgdesc="A nested X server that runs as an X application - Bleeding edge version"
  depends=(libxfont libgl libepoxy libgcrypt libxv pixman xorg-server-common 'xcb-util-image'
           'xcb-util-renderutil' 'xcb-util-wm' 'xcb-util-keysyms')
  provides=(xorg-server-xephyr)
  conflicts=(xorg-server-xephyr)

  cd "${_pkgbase}-${pkgver}/hw/kdrive"

  msg2 "Starting make install..."
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-xephyr"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-xephyr/COPYING"
}

package_xorg-server-xvfb-dev() {
  pkgdesc="Virtual framebuffer X server - Bleeding edge version"
  depends=(libxfont libxdmcp libxau libgcrypt pixman xorg-server-common-dev xorg-xauth libgl)
  provides=(xorg-server-xvfb)
  conflicts=(xorg-server-xvfb)

  cd "${_pkgbase}-${pkgver}/hw/vfb"

  msg2 "Starting make install..."
  make DESTDIR="${pkgdir}" install

  install -m755 "${srcdir}/xvfb-run" "${pkgdir}/usr/bin/"
  install -m644 "${srcdir}/xvfb-run.1" "${pkgdir}/usr/share/man/man1/"

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-xvfb"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-xvfb/COPYING"
}

package_xorg-server-xnest-dev() {
  pkgdesc="A nested X server that runs as an X application - Bleeding edge version"
  depends=(libxfont libxext libgcrypt pixman xorg-server-common-dev libsystemd)
  provides=(xorg-server-xnest)
  conflicts=(xorg-server-xnest)

  cd "${_pkgbase}-${pkgver}/hw/xnest"

  msg2 "Starting make install..."
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-xnest"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-xnest/COPYING"
}

package_xorg-server-xdmx-dev() {
  pkgdesc="Distributed Multihead X Server and utilities - Bleeding edge version"
  depends=(libxfont libxi libgcrypt libxaw libxrender libdmx libxfixes pixman xorg-server-common-dev)
  provides=(xorg-server-xdmx)
  conflicts=(xorg-server-xdmx)

  cd "${_pkgbase}-${pkgver}/hw/dmx"

  msg2 "Starting make install..."
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-xdmx"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-xdmx/COPYING"
}

package_xorg-server-xwayland-dev() {
  pkgdesc="Run X clients under Wayland - Bleeding edge version"
  depends=(libxfont libepoxy libgl pixman xorg-server-common-dev)
  provides=(xorg-server-xwayland)
  conflicts=(xorg-server-xwayland)

  cd "${_pkgbase}-${pkgver}/hw/xwayland"

  msg2 "Starting make install..."
  make DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-xwayland"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-xwayland/COPYING"
}

package_xorg-server-devel-dev() {
  pkgdesc="Development files for the X.Org X server - Bleeding edge version"
  depends=(# see pkgdir/usr/lib/pkgconfig/xorg-server.pc
           xproto randrproto renderproto xextproto inputproto kbproto 
           fontsproto pixman videoproto xf86driproto glproto 
           mesa dri2proto dri3proto xineramaproto libpciaccess
           resourceproto scrnsaverproto presentproto
           # not technically required but almost every Xorg pkg needs it to build
           xorg-util-macros)
  provides=(xorg-server-devel)
  conflicts=(xorg-server-devel)

  cd "${_pkgbase}-${pkgver}"

  msg2 "Starting make install..."
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/bin"
  rm -rf "${pkgdir}/usr/share/man"
  rm -rf "${pkgdir}/usr/share/doc"
  rm -rf "${pkgdir}/usr/share/X11"
  rm -rf "${pkgdir}/usr/lib/xorg"
  rm -rf "${pkgdir}/usr/lib/xorg-server"
  rm -rf "${pkgdir}/var"

  install -m755 -d "${pkgdir}/usr/share/licenses/xorg-server-devel-dev"
  ln -sf ../xorg-server-common/COPYING "${pkgdir}/usr/share/licenses/xorg-server-devel-dev/COPYING"
}
