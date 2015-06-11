# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Maintainer of the xorg-server package: AndyRTR <andyrtr@archlinux.org>
# Maintainer of the xorg-server package: Jan de Groot <jgc@archlinux.org>

_pkgname=xorg-server
pkgname=xorg-server-hwcursor-gamma
pkgver=1.17.1
pkgrel=6
pkgdesc="Xorg X server with patch to apply gamma ramps on hardware cursors"
depends=(libepoxy libxdmcp libxfont libpciaccess libdrm pixman libgcrypt libxau xorg-server-common xf86-input-evdev libxshmfence libgl)
provides=("xorg-server=${pkgver}" 'X-ABI-VIDEODRV_VERSION=19' 'X-ABI-XINPUT_VERSION=21.1' 'X-ABI-EXTENSION_VERSION=9.0' 'x-server')
conflicts=('xorg-server' 'nvidia-utils<=331.20' 'glamor-egl' 'xf86-video-modesetting')
replaces=('glamor-egl' 'xf86-video-modesetting')
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
source=(${url}/releases/individual/xserver/${_pkgname}-${pkgver}.tar.bz2
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
	0001-When-an-cursor-is-set-it-is-adjusted-to-use-the.patch
	0002-Fix-for-full-and-semi-transparency-under-negative-im.patch
	0003-Use-Harms-s-suggest-do-not-use-inline-if.-And-fix-si.patch)
sha256sums=('2bf8e9f6f0a710dec1d2472467bff1f4e247cb6dcd76eb469aafdc8a2d7db2ab'
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
	    'bea348631dedd66475d84ac2cfe0840f22a80a642b4680d73fead4749e47f055'
	    'be9169b937b5d0b44f7f05d7c08aaa5f0c1092e128ce261d9cb350f09dfe1fb0'
	    '0a643ae83e03faee0f4db669a33c5b3c99edbba5c86cde2c83962ae536d31081')

prepare() {
  cd "${_pkgname}-${pkgver}"
  msg2 'Apply hardware cursors gamma adjustments patchs'
  patch -Np1 -i ../0001-When-an-cursor-is-set-it-is-adjusted-to-use-the.patch
  patch -Np1 -i ../0002-Fix-for-full-and-semi-transparency-under-negative-im.patch
  patch -Np1 -i ../0003-Use-Harms-s-suggest-do-not-use-inline-if.-And-fix-si.patch
  
  msg2 'fix FS#43884, merged upstream'
  patch -Np1 -i ../os-access-fix-regression-in-server-interpreted-auth.patch
  msg2 'partially fix FS#43867, merged upstream'
  patch -Np1 -i ../v2-xserver-Fix-a-crash-with-XDMCP-error-handler.patch
  msg2 'fix FS#43924, merged upstream'
  patch -Np1 -i ../0001-int10-Fix-error-check-for-pci_device_map_legacy.patch
  msg2 'fix FS#43937, merged upstream'
  patch -Np1 -i ../0001-mi-Partial-pie-slice-filled-arcs-may-need-more-space.patch
  msg2 'fix FS#45245, merged upstream'
  patch -Np1 -i ../0001-sdksyms.sh-Make-sdksyms.sh-work-with-gcc5.patch
  msg2 'fix FS#45229, merged upstream'
  patch -Np1 -i ../0001-dix-Add-unaccelerated-valuators-to-the-ValuatorMask.patch
  patch -Np1 -i ../0002-dix-hook-up-the-unaccelerated-valuator-masks.patch
  msg2 'fix CVE-2015-3164, merged upstream'
  patch -Np1 -i ../fix-CVE-2015-3164.patch
}

build() {
  cd "${_pkgname}-${pkgver}"
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
      --disable-systemd-logind \
      --disable-suid-wrapper \
      --enable-install-setuid \
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
      --with-sha1=libgcrypt \
      --without-systemd-daemon
      
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

package() {
  cd "${_pkgname}-${pkgver}"
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
