# Maintainer: Mintsuki <mintsuki@protonmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Sébastien "Seblu" Luttringer <seblu@seblu.net>

# This follows Arch Linux's qemu PKGBUILD (11.1.3-1) with Nephrite's names:
# Nephrite installs its programs and files under names of its own, so these
# packages install next to QEMU's.

pkgbase=nephrite
pkgname=(
  nephrite-common
  nephrite-audio-{alsa,dbus,jack,oss,pa,pipewire,sdl,spice}
  nephrite-block-{curl,dmg,iscsi,nfs,ssh}
  nephrite-chardev-{baum,spice}
  nephrite-docs
  nephrite-guest-agent
  nephrite-hw-display-{qxl,virtio-{gpu{,-{gl,rutabaga,pci,pci-gl,pci-rutabaga}},vga{,-gl,-rutabaga}}}
  nephrite-hw-s390x-virtio-gpu-ccw
  nephrite-hw-uefi-vars
  nephrite-hw-usb-{host,redirect,smartcard}
  nephrite-img
  nephrite-pr-helper
  nephrite-system-{aarch64,alpha,arm,avr,hexagon,hppa,loongarch64,m68k,microblaze,mips,or1k,ppc,riscv,rx,s390x,sh4,sparc,tricore,x86,xtensa}
  nephrite-system-{alpha,arm,hppa,microblaze,ppc,riscv,s390x,sparc,x86}-firmware
  nephrite-tests
  nephrite-tools
  nephrite-ui-{curses,dbus,egl-headless,gtk,opengl,sdl,spice-{app,core}}
  nephrite-user{,-static}{,-binfmt}
  nephrite-vhost-user-gpu
  nephrite-vmsr-helper
  nephrite-{base,desktop,emulators-full,full}
)
pkgver=0.3.0
pkgrel=1
pkgdesc="A fork of QEMU, the generic and open source machine emulator and virtualizer"
arch=(x86_64)
url="https://github.com/Nephrite-Project/Nephrite"
license=(
  BSD-2-Clause
  BSD-2-Clause-Patent
  BSD-3-Clause
  CC0-1.0
  FSFAP
  GPL-1.0-or-later
  GPL-2.0-only
  'GPL-2.0-only WITH Linux-syscall-note'
  'GPL-2.0-only WITH Linux-syscall-note OR BSD-2-Clause'
  'GPL-2.0-only WITH Linux-syscall-note OR BSD-3-Clause'
  GPL-2.0-or-later
  'GPL-2.0-or-later OR BSD-3-Clause'
  'GPL-2.0-or-later WITH Linux-syscall-note'
  ISC
  'LGPL-2.1-only OR BSD-3-Clause'
  LGPL-2.0-or-later
  LGPL-2.1-or-later
  LicenseRef-Public-Domain
  MIT
)
# TODO: consider providing lzfse
# TODO: package systemtap
# TODO: package openbios for nephrite-system-{ppc,sparc}
# TODO: package /usr/share/nephrite/{efi,pxe}-* for nephrite (ipxe)
# TODO: package /usr/share/nephrite/slof.bin for nephrite-system-ppc (slof)
makedepends=(
  alsa-lib
  brltty
  bzip2
  cairo
  capstone
  curl
  dtc
  fuse3
  libgcc
  gdk-pixbuf2
  glib2
  glib2-devel
  gnutls
  gtk3
  jack
  keyutils
  libaio
  libbpf
  libcacard
  libcap-ng
  libcbor
  libepoxy
  libiscsi
  libnfs
  libpipewire
  libpng
  libpulse
  libsasl
  libseccomp
  libslirp
  libssh
  liburing
  libusb
  libx11
  libxdp
  libxml2
  libxkbcommon
  lzo
  mesa
  meson
  multipath-tools
  ncurses
  ndctl
  numactl
  pam
  pcre2
  python
  python-distlib
  python-setuptools
  python-pip
  python-sphinx
  python-sphinx_rtd_theme
  rdma-core
  rutabaga-ffi
  sdl2
  sdl2_image
  snappy
  spice-protocol
  spice
  systemd
  usbredir
  vde2
  virglrenderer
  vte3
  zlib
  zlib-static  # for nephrite-user-static
  zstd
)
source=(
  https://github.com/Nephrite-Project/Nephrite/releases/download/v$pkgver/$pkgbase-$pkgver.tar.xz
  bridge.conf
  qemu-ga.conf
  99-nephrite-guest-agent.rules
)
sha512sums=('d75680182c4dc9e35febd0f90c87d9c36e36befd321c5fe5f59ce97fc3cd122e543dda1882a92c967e37f8796b8e1f648aa3f343f234ce5a3ce583185a819fb2'
            '7b412ffa5dcda47b0a4ec9e2c5e5e1d9eaaaf0a087b7ea3ead3e706ba4c9cafb919beadd088a0299b6f7aab753b81a5eafb545b4842ee5f26646d16544dd02a7'
            '080ce23f5eedda24c60d9c2c9cbb6d283076ef7907d82a78274bec59dc70ec74ad3e31e090a13295fe9933f008402a83d62bdaccea6f7a44164abeba0fb5ad45'
            '93b905046fcea8a0a89513b9259c222494ab3b91319dde23baebcb40dc17376a56661b159b99785d6e816831974a0f3cbd7b2f7d89e5fc3c258f88f4492f3839')
b2sums=('48f1a36b0af369af53708057401a7e2a9bffbfe28ebea6dedd1621a03c48859aaaa40909416b1cfaa8ca62fa712744e2a5614eb08836897be4a1d1eddf069724'
        'b1eca364aa60f130ff5e649f5d004d3fcb75356d3421a4542efdfc410d39b40d9434d15e1dd7bbdbd315cb72b5290d3ea5f77f9c41961a5601cd28ef7bbe72e8'
        '344ddf996ab1b4d38b06c809f35e0605c483b1423a9e7696ac347de6b046c5a55949c204f78b85e3ce22cc72fc605e7ea60a3a0af80dccb1d55c6e6f8978bf1f'
        'a9a2bdfeeb44eb86cbe88ac7c65f72800bdb2fd5cecb02f3a258cf9470b52832180aab43c89d481f7fd4d067342a9a27dd6c8a94d625b95d6e2b912e47d274e7')

_nephrite_system_deps=(
  capstone
  fuse3
  libgcc
  glibc
  glib2 libgio-2.0.so libglib-2.0.so libgmodule-2.0.so
  gnutls
  keyutils
  libaio
  libelf
  libbpf libbpf.so
  libjpeg-turbo libjpeg.so
  libpng
  libsasl
  libseccomp libseccomp.so
  libslirp libslirp.so
  liburing liburing.so
  libxdp libxdp.so
  lzo
  ndctl
  numactl libnuma.so
  pam libpam.so
  pixman libpixman-1.so
  nephrite-common=$pkgver-$pkgrel
  rdma-core
  snappy
  vde2
  zlib
  zstd libzstd.so
)

_nephrite_full_optdepends=(
  'nephrite-user-static: for static user mode emulation of QEMU targets'
  'samba: for SMB/CIFS server support'
)

_nephrite_desktop_optdepends=(
  "${_nephrite_full_optdepends[@]}"
  'nephrite-block-iscsi: for iSCSI block driver'
  'nephrite-chardev-baum: for Baum chardev driver'
  'nephrite-docs: for documentation'
  'nephrite-emulators-full: for all system emulators'
  'nephrite-full: for a full Nephrite installation'
  'nephrite-hw-s390x-virtio-gpu-ccw: for s390x-virtio-gpu-ccw display device'
  'nephrite-pr-helper: for persistent reservation utility'
  'nephrite-system-aarch64: for AARCH64 system emulator'
  'nephrite-system-alpha: for Alpha system emulator'
  'nephrite-system-arm: for ARM system emulator'
  'nephrite-system-avr: for AVR system emulator'
  'nephrite-system-hexagon: for Hexagon system emulator'
  'nephrite-system-hppa: for HPPA system emulator'
  'nephrite-system-m68k: for ColdFire (m68k) system emulator'
  'nephrite-system-microblaze: for Microblaze system emulator'
  'nephrite-system-mips: for MIPS system emulator'
  'nephrite-system-or1k: for OpenRisc32 system emulator'
  'nephrite-system-ppc: for PPC system emulator'
  'nephrite-system-riscv: for RISC-V system emulator'
  'nephrite-system-rx: for RX system emulator'
  'nephrite-system-s390x: for S390 system emulator'
  'nephrite-system-sh4: for SH4 system emulator'
  'nephrite-system-sparc: for SPARC system emulator'
  'nephrite-system-tricore: for tricore system emulator'
  'nephrite-system-xtensa: for Xtensa system emulator'
  'nephrite-tests: for Nephrite tests'
  'nephrite-tools: for Nephrite tools'
  'nephrite-user: for user mode emulation of QEMU targets'
)

_nephrite_base_optdepends=(
  "${_nephrite_desktop_optdepends[@]}"
  'nephrite-audio-alsa: for ALSA audio driver'
  'nephrite-audio-dbus: for D-Bus audio driver'
  'nephrite-audio-jack: for JACK audio driver'
  'nephrite-audio-oss: for OSS audio driver'
  'nephrite-audio-pa: for PulseAudio audio driver'
  'nephrite-audio-pipewire: for PipeWire audio driver'
  'nephrite-audio-sdl: for SDL audio driver'
  'nephrite-audio-spice: for spice audio driver'
  'nephrite-block-curl: for curl block driver'
  'nephrite-block-dmg: for DMG block driver'
  'nephrite-block-nfs: for NFS block driver'
  'nephrite-block-ssh: for SSH block driver'
  'nephrite-chardev-spice: for the spice chardev driver'
  'nephrite-desktop: for dependencies commonly used on a desktop'
  'nephrite-hw-display-qxl: for the QXL display device'
  'nephrite-hw-display-virtio-vga: for the virtio-vga display device'
  'nephrite-hw-display-virtio-vga-gl: for the virtio-vga-gl display device'
  'nephrite-hw-display-virtio-vga-rutabaga: for the virtio-vga-rutabaga display device'
  'nephrite-hw-display-virtio-gpu: for the virtio-gpu display device'
  'nephrite-hw-display-virtio-gpu-gl: for the virtio-gpu-gl display device'
  'nephrite-hw-display-virtio-gpu-rutabaga: for the virtio-gpu-rutabaga display device'
  'nephrite-hw-display-virtio-gpu-pci: for the virtio-gpu-pci display device'
  'nephrite-hw-display-virtio-gpu-pci-gl: for the virtio-gpu-pci-gl display device'
  'nephrite-hw-display-virtio-gpu-pci-rutabaga: for the virtio-gpu-pci-rutabaga display device'
  'nephrite-hw-uefi-vars: for UEFI variable support'
  'nephrite-hw-usb-host: for host USB support'
  'nephrite-hw-usb-redirect: for USB redirect support'
  'nephrite-hw-usb-smartcard: for USB smartcard support'
  'nephrite-ui-curses: for ncurses UI driver'
  'nephrite-ui-dbus: for D-Bus UI driver'
  'nephrite-ui-egl-headless: for EGL headless UI driver'
  'nephrite-ui-gtk: for GTK UI driver'
  'nephrite-ui-opengl: for OpenGL UI driver'
  'nephrite-ui-sdl: for SDL UI driver'
  'nephrite-ui-spice-app: for spice app UI driver'
  'nephrite-ui-spice-core: for spice core UI driver'
  'nephrite-user: for user mode emulation of QEMU targets'
  'nephrite-vhost-user-gpu: for vhost-user-gpu display device'
)

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -vp "$(dirname "$d")"
    mv -v "$f" "$d"
    rmdir -vp --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

# install the license files to that of nephrite-common
_install_licenses() {
  install -vDm 644 $pkgbase-$pkgver/LICENSE ./*LICENSE*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 $pkgbase-$pkgver/tests/uefi-test-tools/LICENSE "$pkgdir/usr/share/licenses/$pkgname/BSD-2-Clause.txt"
  install -vDm 644 $pkgbase-$pkgver/pc-bios/edk2-licenses.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}

prepare() {
  # extract licenses for TCG
  sed -n '1,23p' $pkgbase-$pkgver/tcg/tcg-internal.h > tcg.LICENSE.MIT.txt
  sed -n '1,23p' $pkgbase-$pkgver/tcg/tci/tcg-target.h > tci.LICENSE.MIT.txt

  # extract licenses for audio
  sed -n '2,4p' $pkgbase-$pkgver/audio/sndioaudio.c > audio.LICENSE.ISC.txt

  # extract licenses for linux headers
  sed -n '3,33p' $pkgbase-$pkgver/include/standard-headers/linux/fuse.h > fuse.LICENSE.BSD-2-Clause.txt

  # install nephrite-pr-helper.socket and nephrite-vmsr-helper.socket to sockets.target
  sed -e 's/multi-user.target/sockets.target/g' -i $pkgbase-$pkgver/contrib/systemd/*.socket

  # create build dir
  mkdir -vp build
  mkdir -vp build-static
}

build() {
  local common_configure_options=(
    --prefix=/usr
    --sysconfdir=/etc
    --libexecdir=/usr/lib/$pkgbase
    --localstatedir=/var
    --docdir=/usr/share/doc/$pkgbase
  )
  local configure_options=(
    "${common_configure_options[@]}"
    --enable-modules
    --enable-sdl
    --enable-slirp
    --enable-tpm
    --enable-rutabaga-gfx
    --smbd=/usr/bin/smbd
    --with-coroutine=ucontext
  )
  local configure_static_options=(
    "${common_configure_options[@]}"
    --enable-attr
    --enable-linux-user
    --enable-tcg
    --disable-bpf
    --disable-bsd-user
    --disable-capstone
    --disable-docs
    --disable-fdt
    --disable-gcrypt
    --disable-gnutls
    --disable-gtk
    --disable-install-blobs
    --disable-kvm
    --disable-libiscsi
    --disable-libnfs
    --disable-libssh
    --disable-linux-io-uring
    --disable-nettle
    --disable-opengl
    --disable-qom-cast-debug
    --disable-sdl
    --disable-system
    --disable-tools
    --disable-tpm
    --disable-vde
    --disable-vhost-crypto
    --disable-vhost-kernel
    --disable-vhost-net
    --disable-vhost-user
    --disable-vnc
    --disable-werror
    --disable-xen
    --disable-zstd
    --static
  )

  (
    cd build-static
    ../$pkgbase-$pkgver/configure "${configure_static_options[@]}"
    ninja
  )

  # Build only minimal debug info to reduce size
  CFLAGS+=' -g1'
  CXXFLAGS+=' -g1'

  (
    cd build
    ../$pkgbase-$pkgver/configure "${configure_options[@]}"
    ninja
  )

}

package_nephrite-common() {
  local binfmt_conf_options=(
    --systemd ALL
    --exportdir "$pkgdir/usr/lib/binfmt.d/"
    --qemu-path "/usr/bin"
    --persistent yes
    --preserve-argv0 yes
  )

  depends=(glibc glib2 libgcc libglib-2.0.so libgmodule-2.0.so hicolor-icon-theme libcap-ng libcap-ng.so)
  backup=(
    etc/$pkgbase/bridge.conf
  )

  # install static binaries
  meson install -C build-static --destdir "$pkgdir"
  install -vdm 755 "$pkgdir/usr/lib/binfmt.d/"
  $pkgbase-$pkgver/scripts/qemu-binfmt-conf.sh "${binfmt_conf_options[@]}"

  # rename static binaries to prevent name conflicts
  for _src in "$pkgdir/usr/bin/$pkgbase-"*; do
    mv -v "$_src" "$pkgdir/usr/bin/$(basename "$_src")-static"
  done
  # The binfmt.d configs keep QEMU's entry names (qemu-<cpu>), which name
  # Nephrite's programs as their interpreters: point copies of them at the
  # static binaries, under file names of Nephrite's own
  for _conf in "$pkgdir/usr/lib/binfmt.d/"qemu-*.conf; do
    _cpu="$(basename "${_conf%.conf}")"
    sed -E "s|(/usr/bin/$pkgbase-[^:]+):|\1-static:|" "$_conf" > "$pkgdir/usr/lib/binfmt.d/$pkgbase-${_cpu#qemu-}-static.conf"
    rm -v "$_conf"
  done

  # install default binaries
  meson install -C build --destdir "$pkgdir"

  install -vdm 755 "$pkgdir/usr/lib/binfmt.d/"
  $pkgbase-$pkgver/scripts/qemu-binfmt-conf.sh "${binfmt_conf_options[@]}"
  for _conf in "$pkgdir/usr/lib/binfmt.d/"qemu-*.conf; do
    mv -v "$_conf" "$pkgdir/usr/lib/binfmt.d/$pkgbase-${_conf##*/qemu-}"
  done

  install -vDm 644 bridge.conf -t "$pkgdir/etc/$pkgbase/"
  # Nephrite keeps SASL's application name, qemu, so its SASL configuration
  # is QEMU's /etc/sasl2/qemu.conf, which qemu-common installs. Nephrite runs
  # as no user of its own, so it has no sysusers.d configuration either.

  _install_licenses

  # bridge_helper needs suid: https://bugs.archlinux.org/task/32565
  chmod u+s "$pkgdir/usr/lib/$pkgbase/$pkgbase-bridge-helper"

  # remoe invalid directory
  rm -frv "$pkgdir/var"

  # remove unneeded files
  find "$pkgdir" -name .buildinfo -delete

  (
    # create man page symlinks for all system emulators
    cd "$pkgdir/usr/share/man/man1"
    for _name in $pkgbase-system-{aarch64,alpha,arm,avr,hexagon,hppa,i386,loongarch64,m68k,microblaze,mips{,64,64el,el},or1k,ppc{,64},riscv{32,64},rx,s390x,sh4{,eb},sparc{,64},tricore,x86_64,xtensa{,eb}}; do
      ln -sv $pkgbase.1.gz "$pkgdir/usr/share/man/man1/$_name.1.gz"
    done
  )

  (
    # pick files for all split packages
    cd "$pkgdir"

    _pick nephrite-guest-agent usr/bin/nephrite-ga
    _pick nephrite-guest-agent usr/share/man/man8/nephrite-ga.8*

    _pick nephrite-audio-alsa usr/lib/nephrite/audio-alsa.so
    _pick nephrite-audio-dbus usr/lib/nephrite/audio-dbus.so
    _pick nephrite-audio-jack usr/lib/nephrite/audio-jack.so
    _pick nephrite-audio-oss usr/lib/nephrite/audio-oss.so
    _pick nephrite-audio-pa usr/lib/nephrite/audio-pa.so
    _pick nephrite-audio-pipewire usr/lib/nephrite/audio-pipewire.so
    _pick nephrite-audio-sdl usr/lib/nephrite/audio-sdl.so
    _pick nephrite-audio-spice usr/lib/nephrite/audio-spice.so

    _pick nephrite-block-curl usr/lib/nephrite/block-curl.so
    _pick nephrite-block-dmg usr/lib/nephrite/block-dmg*.so
    _pick nephrite-block-iscsi usr/lib/nephrite/block-iscsi.so
    _pick nephrite-block-nfs usr/lib/nephrite/block-nfs.so
    _pick nephrite-block-ssh usr/lib/nephrite/block-ssh.so

    _pick nephrite-chardev-baum usr/lib/nephrite/chardev-baum.so
    _pick nephrite-chardev-spice usr/lib/nephrite/chardev-spice.so

    _pick nephrite-docs usr/share/doc/nephrite

    _pick nephrite-hw-display-qxl usr/lib/nephrite/hw-display-qxl.so
    _pick nephrite-hw-display-virtio-gpu usr/lib/nephrite/hw-display-virtio-gpu.so
    _pick nephrite-hw-display-virtio-gpu-gl usr/lib/nephrite/hw-display-virtio-gpu-gl.so
    _pick nephrite-hw-display-virtio-gpu-rutabaga usr/lib/nephrite/hw-display-virtio-gpu-rutabaga.so
    _pick nephrite-hw-display-virtio-gpu-pci usr/lib/nephrite/hw-display-virtio-gpu-pci.so
    _pick nephrite-hw-display-virtio-gpu-pci-gl usr/lib/nephrite/hw-display-virtio-gpu-pci-gl.so
    _pick nephrite-hw-display-virtio-gpu-pci-rutabaga usr/lib/nephrite/hw-display-virtio-gpu-pci-rutabaga.so
    _pick nephrite-hw-display-virtio-vga usr/lib/nephrite/hw-display-virtio-vga.so
    _pick nephrite-hw-display-virtio-vga-gl usr/lib/nephrite/hw-display-virtio-vga-gl.so
    _pick nephrite-hw-display-virtio-vga-rutabaga usr/lib/nephrite/hw-display-virtio-vga-rutabaga.so

    _pick nephrite-hw-usb-host usr/lib/nephrite/hw-usb-host.so
    _pick nephrite-hw-usb-redirect usr/lib/nephrite/hw-usb-redirect.so
    _pick nephrite-hw-usb-smartcard usr/lib/nephrite/hw-usb-smartcard.so

    _pick nephrite-hw-uefi-vars usr/lib/nephrite/hw-uefi-vars.so

    _pick nephrite-img usr/bin/nephrite-{img,io,nbd,storage-daemon}
    _pick nephrite-img usr/share/man/man1/nephrite-{img,storage-daemon}.1*
    _pick nephrite-img usr/share/man/man7/nephrite-storage-daemon-qmp-ref.7*
    _pick nephrite-img usr/share/man/man8/nephrite-nbd.8*

    _pick nephrite-pr-helper usr/bin/nephrite-pr-helper
    _pick nephrite-pr-helper usr/share/man/man8/nephrite-pr-helper.8*

    _pick nephrite-hw-s390x-virtio-gpu-ccw usr/lib/nephrite/hw-s390x-virtio-gpu-ccw.so

    _pick nephrite-system-aarch64 usr/bin/nephrite-system-aarch64
    _pick nephrite-system-aarch64 usr/share/man/man1/nephrite-system-aarch64.1*

    _pick nephrite-system-alpha usr/bin/nephrite-system-alpha
    _pick nephrite-system-alpha usr/share/man/man1/nephrite-system-alpha.1*

    _pick nephrite-system-alpha-firmware usr/share/nephrite/palcode-clipper

    _pick nephrite-system-arm usr/bin/nephrite-system-arm
    _pick nephrite-system-arm usr/share/man/man1/nephrite-system-arm.1*

    _pick nephrite-system-arm-firmware usr/share/nephrite/{ast27x0,npcm{7,8}xx}_bootrom.bin
    # NOTE: QEMU no longer provides the 32-bit ARM edk2 images (edk2-arm-*.fd
    # and their 60-edk2-arm.json) that Arch Linux's qemu 11.1 packages here.

    _pick nephrite-system-avr usr/bin/nephrite-system-avr
    _pick nephrite-system-avr usr/share/man/man1/nephrite-system-avr.1*

    _pick nephrite-system-hexagon usr/bin/nephrite-system-hexagon
    _pick nephrite-system-hexagon usr/share/man/man1/nephrite-system-hexagon.1*

    _pick nephrite-system-hppa usr/bin/nephrite-system-hppa
    _pick nephrite-system-hppa usr/share/man/man1/nephrite-system-hppa.1*

    _pick nephrite-system-hppa-firmware usr/share/nephrite/hppa-firmware*.img

    _pick nephrite-system-loongarch64 usr/bin/nephrite-system-loongarch64
    _pick nephrite-system-loongarch64 usr/share/man/man1/nephrite-system-loongarch64.1*

    _pick nephrite-system-m68k usr/bin/nephrite-system-m68k
    _pick nephrite-system-m68k usr/share/man/man1/nephrite-system-m68k.1*

    _pick nephrite-system-microblaze usr/bin/nephrite-system-microblaze
    _pick nephrite-system-microblaze usr/share/man/man1/nephrite-system-microblaze.1*

    _pick nephrite-system-microblaze-firmware usr/share/nephrite/dtb/petalogix-*.dtb

    _pick nephrite-system-mips usr/bin/nephrite-system-mips{,64,64el,el}
    _pick nephrite-system-mips usr/share/man/man1/nephrite-system-mips{,64,64el,el}.1*

    _pick nephrite-system-or1k usr/bin/nephrite-system-or1k
    _pick nephrite-system-or1k usr/share/man/man1/nephrite-system-or1k.1*

    _pick nephrite-system-ppc usr/bin/nephrite-system-ppc{,64}
    _pick nephrite-system-ppc usr/share/man/man1/nephrite-system-ppc{,64}.1*

    _pick nephrite-system-ppc-firmware usr/share/nephrite/dtb/{bamboo,canyonlands,pegasos{1,2}}.dtb
    # NOTE: needs to be replaced by openbios
    _pick nephrite-system-ppc-firmware usr/share/nephrite/openbios-ppc
    _pick nephrite-system-ppc-firmware usr/share/nephrite/pnv-pnor.bin
    _pick nephrite-system-ppc-firmware usr/share/nephrite/qemu_vga.ndrv
    _pick nephrite-system-ppc-firmware usr/share/nephrite/skiboot.lid
    # NOTE: needs to be replaced by slof
    _pick nephrite-system-ppc-firmware usr/share/nephrite/slof.bin
    _pick nephrite-system-ppc-firmware usr/share/nephrite/u-boot.e500
    _pick nephrite-system-ppc-firmware usr/share/nephrite/u-boot-sam460.bin

    _pick nephrite-system-riscv usr/bin/nephrite-system-riscv{32,64}
    _pick nephrite-system-riscv usr/share/man/man1/nephrite-system-riscv{32,64}.1*

    _pick nephrite-system-riscv-firmware usr/share/nephrite/opensbi-riscv{32,64}*.bin

    _pick nephrite-system-rx usr/bin/nephrite-system-rx
    _pick nephrite-system-rx usr/share/man/man1/nephrite-system-rx.1*

    _pick nephrite-system-s390x usr/bin/nephrite-system-s390x
    _pick nephrite-system-s390x usr/share/man/man1/nephrite-system-s390x.1*

    _pick nephrite-system-s390x-firmware usr/share/nephrite/s390-ccw.img

    _pick nephrite-system-sh4 usr/bin/nephrite-system-sh4{,eb}
    _pick nephrite-system-sh4 usr/share/man/man1/nephrite-system-sh4{,eb}.1*

    _pick nephrite-system-sparc usr/bin/nephrite-system-sparc{,64}
    _pick nephrite-system-sparc usr/share/man/man1/nephrite-system-sparc{,64}.1*

    # NOTE: needs to be replaced by openbios
    _pick nephrite-system-sparc-firmware usr/share/nephrite/openbios-sparc{32,64}
    _pick nephrite-system-sparc-firmware usr/share/nephrite/QEMU,{cgthree,tcx}.bin

    _pick nephrite-system-tricore usr/bin/nephrite-system-tricore
    _pick nephrite-system-tricore usr/share/man/man1/nephrite-system-tricore.1*

    _pick nephrite-system-x86 usr/bin/nephrite-system-{i386,x86_64}
    _pick nephrite-system-x86 usr/share/man/man1/nephrite-system-{i386,x86_64}.1*

    _pick nephrite-system-x86-firmware usr/share/nephrite/{kvmvapic,{linuxboot,multiboot}_dma,pvh}.bin
    _pick nephrite-system-x86-firmware usr/share/nephrite/qboot.rom
    # Nephrite's SeaBIOS images come from ReBIOS's SeaBIOS, with fixes that
    # Arch's seabios package lacks, so they stay
    _pick nephrite-system-x86-firmware usr/share/nephrite/{bios,vgabios}*

    _pick nephrite-system-xtensa usr/bin/nephrite-system-xtensa{,eb}
    _pick nephrite-system-xtensa usr/share/man/man1/nephrite-system-xtensa{,eb}.1*

    _pick nephrite-tests usr/lib/nephrite/accel-qtest.so

    _pick nephrite-tools usr/bin/nephrite-{edid,elf2dmp,keymap}
    _pick nephrite-tools usr/share/nephrite/trace-events-all

    _pick nephrite-ui-curses usr/lib/nephrite/ui-curses.so
    _pick nephrite-ui-dbus usr/lib/nephrite/ui-dbus.so
    _pick nephrite-ui-egl-headless usr/lib/nephrite/ui-egl-headless.so
    _pick nephrite-ui-gtk usr/lib/nephrite/ui-gtk.so
    _pick nephrite-ui-opengl usr/lib/nephrite/ui-opengl.so
    _pick nephrite-ui-sdl usr/lib/nephrite/ui-sdl.so
    _pick nephrite-ui-spice-app usr/lib/nephrite/ui-spice-app.so
    _pick nephrite-ui-spice-core usr/lib/nephrite/ui-spice-core.so

    _pick nephrite-user-static usr/bin/nephrite-*-static
    _pick nephrite-user-static-binfmt usr/lib/binfmt.d/*-static.conf

    _pick nephrite-user usr/bin/nephrite-{aarch64{,_be},alpha,arm{,eb},hexagon,hppa,i386,loongarch64,m68k,microblaze{,el},mips{,64,64el,el,n32,n32el},or1k,ppc{,64,64le},riscv{32,64},s390x,sh4{,eb},sparc{,32plus,64},x86_64,xtensa{,eb}}
    _pick nephrite-user-binfmt usr/lib/binfmt.d/*.conf

    _pick nephrite-vhost-user-gpu usr/lib/nephrite/nephrite-vhost-user-gpu
    _pick nephrite-vhost-user-gpu usr/share/nephrite/vhost-user/50-qemu-gpu.json

    if [[ -e usr/bin/nephrite-vmsr-helper ]]; then
      _pick nephrite-vmsr-helper usr/bin/nephrite-vmsr-helper
    fi
  )

  # remove files provided by edk2-{aarch64,ovmf,riscv}
  rm -fv "$pkgdir/usr/share/$pkgbase/"edk2-*
  rm -frv "$pkgdir/usr/share/$pkgbase/firmware"

}

package_nephrite-audio-alsa() {
  pkgdesc="Nephrite ALSA audio driver"
  depends=(alsa-lib libasound.so glibc nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-audio-dbus() {
  pkgdesc="Nephrite D-Bus audio driver"
  depends=(glib2 libgio-2.0.so libgcc libgobject-2.0.so libglib-2.0.so glibc nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-audio-jack() {
  pkgdesc="Nephrite JACK audio driver"
  depends=(glibc jack libgcc libjack.so nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-audio-oss() {
  pkgdesc="Nephrite OSS audio driver"
  depends=(glibc nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-audio-pa() {
  pkgdesc="Nephrite PulseAudio audio driver"
  depends=(glibc libpulse libpulse.so nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-audio-pipewire() {
  pkgdesc="Nephrite PipeWire audio driver"
  depends=(glibc libpipewire libpipewire-0.3.so nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-audio-sdl() {
  pkgdesc="Nephrite SDL audio driver"
  depends=(glibc nephrite-common=$pkgver-$pkgrel sdl2)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-audio-spice() {
  pkgdesc="Nephrite spice audio driver"
  depends=(glibc nephrite-common=$pkgver-$pkgrel nephrite-ui-spice-core=$pkgver-$pkgrel spice libspice-server.so)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-block-curl() {
  pkgdesc="Nephrite curl block driver"
  depends=(curl libcurl.so glibc libgcc nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-block-dmg() {
  pkgdesc="Nephrite DMG block driver"
  depends=(bzip2 libbz2.so glibc nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-block-iscsi() {
  pkgdesc="Nephrite iSCSI block driver"
  depends=(glibc libgcc libiscsi nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-block-nfs() {
  pkgdesc="Nephrite NFS block driver"
  depends=(glibc libgcc libnfs nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-block-ssh() {
  pkgdesc="Nephrite SSH block driver"
  depends=(glibc libgcc libssh libssh.so nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-chardev-baum() {
  pkgdesc="Nephrite Baum chardev driver"
  depends=(brltty libbrlapi.so glibc libgcc nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-chardev-spice() {
  pkgdesc="Nephrite spice chardev driver"
  depends=(glibc nephrite-common=$pkgver-$pkgrel nephrite-ui-spice-core=$pkgver-$pkgrel spice libspice-server.so)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-docs() {
  pkgdesc+=" - documentation"
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-guest-agent() {
  pkgdesc="Nephrite Guest Agent"
  depends=(glib2 libglib-2.0.so libgcc libgmodule-2.0.so glibc liburing liburing.so numactl libnuma.so sh systemd-libs libudev.so)
  # Nephrite's agent keeps QEMU's systemd unit and serves QEMU's agent
  # channel, so it takes the place of QEMU's
  conflicts=(qemu-guest-agent)
  backup=(
    etc/$pkgbase/qemu-ga.conf
    etc/$pkgbase/fsfreeze-hook
  )
  mv -v $pkgname/* "$pkgdir"
  install -vDm 644 $pkgbase-$pkgver/contrib/systemd/qemu-guest-agent.service -t "$pkgdir/usr/lib/systemd/system/"
  install -vDm 644 99-$pkgname.rules -t "$pkgdir/usr/lib/udev/rules.d/"
  install -vDm 644 qemu-ga.conf -t "$pkgdir/etc/$pkgbase/"
  install -vDm 755 $pkgbase-$pkgver/scripts/qemu-guest-agent/fsfreeze-hook -t "$pkgdir/etc/$pkgbase/"
  install -vdm 755 "$pkgdir/etc/$pkgbase/fsfreeze-hook.d"
  _install_licenses
}

package_nephrite-hw-display-qxl() {
  pkgdesc="Nephrite QXL display device"
  depends=(glibc pixman libgcc libpixman-1.so nephrite-common=$pkgver-$pkgrel nephrite-ui-spice-core=$pkgver-$pkgrel spice libspice-server.so)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-hw-display-virtio-gpu() {
  pkgdesc="Nephrite virtio-gpu display device"
  depends=(glibc libgcc pixman libpixman-1.so nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-hw-display-virtio-gpu-rutabaga() {
  pkgdesc="Nephrite virtio-gpu-rutabaga display device"
  depends=(glibc pixman libgcc libpixman-1.so nephrite-common=$pkgver-$pkgrel rutabaga-ffi)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-hw-display-virtio-gpu-gl() {
  pkgdesc="Nephrite virtio-gpu-gl display device"
  depends=(glibc libgcc nephrite-common=$pkgver-$pkgrel virglrenderer)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-hw-display-virtio-gpu-pci() {
  pkgdesc="Nephrite virtio-gpu-pci display device"
  depends=(nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-hw-display-virtio-gpu-pci-rutabaga() {
  pkgdesc="Nephrite virtio-gpu-pci-rutabaga display device"
  depends=(nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-hw-display-virtio-gpu-pci-gl() {
  pkgdesc="Nephrite virtio-gpu-pci-gl display device"
  depends=(nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-hw-display-virtio-vga() {
  pkgdesc="Nephrite virtio-vga display device"
  depends=(nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-hw-display-virtio-vga-gl() {
  pkgdesc="Nephrite virtio-vga-gl display device"
  depends=(nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-hw-display-virtio-vga-rutabaga() {
  pkgdesc="Nephrite virtio-vga-rutabaga display device"
  depends=(nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-hw-s390x-virtio-gpu-ccw() {
  pkgdesc="Nephrite s390x-virtio-gpu-ccw display device"
  depends=(nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-aarch64() {
  pkgdesc="Nephrite system emulator for AARCH64"
  depends=("${_nephrite_system_deps[@]}" dtc edk2-aarch64 systemd-libs libudev.so)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-alpha() {
  pkgdesc="Nephrite system emulator for Alpha"
  depends=("${_nephrite_system_deps[@]}" nephrite-system-alpha-firmware=$pkgver-$pkgrel systemd-libs libudev.so)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-alpha-firmware() {
  pkgdesc="Firmware for Nephrite system emulator for Alpha"
  options=(!strip)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-arm() {
  pkgdesc="Nephrite system emulator for ARM"
  depends=("${_nephrite_system_deps[@]}" dtc nephrite-system-arm-firmware=$pkgver-$pkgrel systemd-libs libudev.so)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-arm-firmware() {
  pkgdesc="Firmware for Nephrite system emulator for ARM"
  options=(!strip)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-avr() {
  pkgdesc="Nephrite system emulator for AVR"
  depends=("${_nephrite_system_deps[@]}")
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-hexagon() {
  pkgdesc="Nephrite system emulator for Hexagon"
  depends=("${_nephrite_system_deps[@]}" dtc)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-hppa() {
  pkgdesc="Nephrite system emulator for HPPA"
  depends=("${_nephrite_system_deps[@]}" nephrite-system-hppa-firmware=$pkgver-$pkgrel systemd-libs libudev.so)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-hppa-firmware() {
  pkgdesc="Firmware for Nephrite system emulator for HPPA"
  options=(!strip)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-loongarch64() {
  pkgdesc="Nephrite system emulator for LoongArch64"
  depends=("${_nephrite_system_deps[@]}" dtc systemd-libs)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-m68k() {
  pkgdesc="Nephrite system emulator for ColdFire (m68k)"
  depends=("${_nephrite_system_deps[@]}")
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-microblaze() {
  pkgdesc="Nephrite system emulator for Microblaze"
  depends=("${_nephrite_system_deps[@]}" dtc nephrite-system-microblaze-firmware=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-microblaze-firmware() {
  pkgdesc="Firmware for Nephrite system emulator for Microblaze"
  options=(!strip)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-mips() {
  pkgdesc="Nephrite system emulator for MIPS"
  depends=("${_nephrite_system_deps[@]}" dtc systemd-libs libudev.so)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-or1k() {
  pkgdesc="Nephrite system emulator for OpenRisc32"
  depends=("${_nephrite_system_deps[@]}" dtc systemd-libs)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-ppc() {
  pkgdesc="Nephrite system emulator for PPC"
  depends=("${_nephrite_system_deps[@]}" dtc nephrite-system-ppc-firmware=$pkgver-$pkgrel systemd-libs libudev.so)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-ppc-firmware() {
  pkgdesc="Firmware for Nephrite system emulator for PPC"
  options=(!strip)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-riscv() {
  pkgdesc="Nephrite system emulator for RISC-V"
  depends=("${_nephrite_system_deps[@]}" dtc edk2-riscv64 nephrite-system-riscv-firmware=$pkgver-$pkgrel systemd-libs libudev.so)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-riscv-firmware() {
  pkgdesc="Firmware for Nephrite system emulator for RISC-V"
  options=(!strip)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-rx() {
  pkgdesc="Nephrite system emulator for RX"
  depends=("${_nephrite_system_deps[@]}" dtc)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-s390x() {
  pkgdesc="Nephrite system emulator for S390"
  depends=("${_nephrite_system_deps[@]}" nephrite-system-s390x-firmware=$pkgver-$pkgrel systemd-libs libudev.so)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-s390x-firmware() {
  pkgdesc="Firmware for Nephrite system emulator for S390"
  options=(!strip)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-sh4() {
  pkgdesc="Nephrite system emulator for SH4"
  depends=("${_nephrite_system_deps[@]}" systemd-libs libudev.so)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-sparc() {
  pkgdesc="Nephrite system emulator for SPARC"
  depends=("${_nephrite_system_deps[@]}" nephrite-system-sparc-firmware=$pkgver-$pkgrel systemd-libs libudev.so)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-sparc-firmware() {
  pkgdesc="Firmware for Nephrite system emulator for SPARC"
  options=(!strip)
  # NOTE: will require openbios
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-tricore() {
  pkgdesc="Nephrite system emulator for tricore"
  depends=("${_nephrite_system_deps[@]}")
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-x86() {
  pkgdesc="Nephrite system emulator for x86"
  depends=("${_nephrite_system_deps[@]}" dtc edk2-ovmf libcbor libcbor.so nephrite-system-x86-firmware=$pkgver-$pkgrel systemd-libs libudev.so)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-x86-firmware() {
  pkgdesc="Firmware for Nephrite system emulator for x86"
  options=(!strip)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-system-xtensa() {
  pkgdesc="Nephrite system emulator for Xtensa"
  depends=("${_nephrite_system_deps[@]}" dtc systemd-libs libudev.so)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-hw-uefi-vars() {
  pkgdesc="Nephrite UEFI vars handling"
  depends=(glibc gnutls libgcc nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-hw-usb-host() {
  pkgdesc="Nephrite USB host device"
  depends=(glibc libgcc libusb libusb-1.0.so nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-hw-usb-redirect() {
  pkgdesc="Nephrite usbredir device"
  depends=(glibc libgcc nephrite-common=$pkgver-$pkgrel usbredir)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-hw-usb-smartcard() {
  pkgdesc="Nephrite USB smartcard device"
  depends=(libcacard glib2 libgcc libglib-2.0.so glibc nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-img() {
  pkgdesc="Nephrite tooling for manipulating disk images"
  depends=(fuse3 glib2 libgcc libglib-2.0.so libgmodule-2.0.so glibc gnutls libaio liburing liburing.so numactl libnuma.so pam libpam.so zlib zstd libzstd.so)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-pr-helper() {
  pkgdesc="Nephrite persistent reservation utility"
  depends=(glib2 libgcc libglib-2.0.so libgmodule-2.0.so glibc gnutls libcap-ng libcap-ng.so liburing liburing.so multipath-tools numactl libnuma.so pam libpam.so nephrite-common=$pkgver-$pkgrel systemd-libs)
  mv -v $pkgname/* "$pkgdir"
  install -vDm 644 $pkgbase-$pkgver/contrib/systemd/$pkgname.{service,socket} -t "$pkgdir/usr/lib/systemd/system/"
  _install_licenses
}

package_nephrite-tests() {
  pkgdesc="Nephrite tests"
  depends=(nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-tools() {
  pkgdesc="Nephrite tools"
  depends=(curl libcurl.so glib2 libgcc libglib-2.0.so libgmodule-2.0.so glibc libxkbcommon libxkbcommon.so python nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  install -vDm 644 $pkgbase-$pkgver/scripts/dump-guest-memory.py -t "$pkgdir/usr/share/$pkgbase/"
  install -vDm 755 $pkgbase-$pkgver/scripts/simpletrace.py -t "$pkgdir/usr/share/$pkgbase/"
  install -vDm 644 $pkgbase-$pkgver/scripts/tracetool/*.py -t "$pkgdir/usr/share/$pkgbase/tracetool/"
  install -vDm 644 $pkgbase-$pkgver/scripts/tracetool/backend/*.py -t "$pkgdir/usr/share/$pkgbase/tracetool/backend/"
  install -vDm 644 $pkgbase-$pkgver/scripts/tracetool/format/*.py -t "$pkgdir/usr/share/$pkgbase/tracetool/format/"
  _install_licenses
}

package_nephrite-ui-curses() {
  pkgdesc="Nephrite curses UI driver"
  depends=(glib2 libgcc libglib-2.0.so glibc ncurses libncursesw.so nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-ui-dbus() {
  pkgdesc="Nephrite D-Bus UI driver"
  depends=(glib2 libgcc libgio-2.0.so libgobject-2.0.so libglib-2.0.so glibc libepoxy pixman libpixman-1.so nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-ui-egl-headless() {
  pkgdesc="Nephrite EGL headless UI driver"
  depends=(glibc libepoxy pixman libpixman-1.so nephrite-common=$pkgver-$pkgrel nephrite-ui-opengl=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-ui-gtk() {
  pkgdesc="Nephrite GTK UI driver"
  depends=(
    cairo
    gdk-pixbuf2 libgdk_pixbuf-2.0.so
    glib2 libgobject-2.0.so libglib-2.0.so
    glibc
    gtk3 libgdk-3.so libgtk-3.so
    libepoxy
    libgcc
    libx11
    pixman libpixman-1.so
    nephrite-common=$pkgver-$pkgrel
    nephrite-ui-opengl
    vte3 libvte-2.91.so
  )
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-ui-opengl() {
  pkgdesc="Nephrite OpenGL UI driver"
  depends=(glibc libgcc libepoxy mesa pixman libpixman-1.so nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-ui-sdl() {
  pkgdesc="Nephrite SDL UI driver"
  depends=(glib2 libglib-2.0.so glibc libx11 pixman libepoxy libpixman-1.so nephrite-common=$pkgver-$pkgrel sdl2_image sdl2)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-ui-spice-app() {
  pkgdesc="Nephrite spice app UI driver"
  depends=(glib2 libgio-2.0.so libglib-2.0.so glibc nephrite-common=$pkgver-$pkgrel nephrite-chardev-spice=$pkgver-$pkgrel nephrite-ui-spice-core=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-ui-spice-core() {
  pkgdesc="Nephrite spice core UI driver"
  depends=(glibc pixman libgcc libpixman-1.so nephrite-common=$pkgver-$pkgrel nephrite-ui-opengl=$pkgver-$pkgrel spice libspice-server.so)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-user() {
  pkgdesc="Nephrite user mode emulation"
  depends=(capstone glib2 libgcc libglib-2.0.so libgmodule-2.0.so glibc gnutls libelf liburing liburing.so numactl libnuma.so nephrite-common=$pkgver-$pkgrel zlib)
  optdepends=('nephrite-user-binfmt: for binary format rules')
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-user-binfmt() {
  pkgdesc="Binary format rules for Nephrite user mode emulation"
  depends=(nephrite-user=$pkgver-$pkgrel)
  provides=(qemu-user-binfmt-provider)
  conflicts=(qemu-user-binfmt-provider)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-user-static() {
  pkgdesc="Nephrite static user mode emulation"
  optdepends=('nephrite-user-static-binfmt: for binary format rules')
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-user-static-binfmt() {
  pkgdesc="Binary format rules for Nephrite static user mode emulation"
  depends=(nephrite-user-static=$pkgver-$pkgrel)
  provides=(qemu-user-binfmt-provider)
  conflicts=(qemu-user-binfmt-provider)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-vhost-user-gpu() {
  pkgdesc="Nephrite vhost-user-gpu display device"
  depends=(glib2 libgcc libglib-2.0.so libgmodule-2.0.so glibc pixman libepoxy libpixman-1.so mesa numactl libnuma.so nephrite-common=$pkgver-$pkgrel virglrenderer)
  mv -v $pkgname/* "$pkgdir"
  _install_licenses
}

package_nephrite-vmsr-helper() {
  pkgdesc="Nephrite virtual RAPL MSR helper"
  # NOTE: The nephrite-vmsr-helper is only available on the x86 architecture.
  arch=(x86_64)
  depends=(glib2 libgcc libglib-2.0.so libgmodule-2.0.so glibc gnutls libcap-ng libcap-ng.so liburing liburing.so numactl libnuma.so pam libpam.so nephrite-common=$pkgver-$pkgrel)
  mv -v $pkgname/* "$pkgdir"
  install -vDm 644 $pkgbase-$pkgver/contrib/systemd/$pkgname.{service,socket} -t "$pkgdir/usr/lib/systemd/system/"
  _install_licenses
}

package_nephrite-base() {
  pkgdesc="A basic Nephrite setup for headless environments"
  depends=(
    nephrite-common=$pkgver-$pkgrel
    nephrite-img=$pkgver-$pkgrel
    nephrite-system-x86=$pkgver-$pkgrel
    virtiofsd
  )
  optdepends=("${_nephrite_base_optdepends[@]}")
  optdepends_x86_64=('nephrite-vmsr-helper: for accessing the Running Average Power Limit (RAPL) MSR')
  provides=(nephrite=$pkgver)
  _install_licenses
}

package_nephrite-desktop() {
  pkgdesc="A Nephrite setup for desktop environments"
  depends=(
    nephrite-base=$pkgver-$pkgrel
    nephrite-audio-{alsa,dbus,jack,oss,pa,pipewire,sdl,spice}=$pkgver-$pkgrel
    nephrite-block-{curl,dmg,nfs,ssh}=$pkgver-$pkgrel
    nephrite-chardev-spice=$pkgver-$pkgrel
    nephrite-hw-display-{qxl,virtio-gpu{,-{gl,rutabaga,pci,pci-gl,pci-rutabaga}}}=$pkgver-$pkgrel
    nephrite-hw-display-virtio-vga{,-gl,-rutabaga}=$pkgver-$pkgrel
    nephrite-hw-uefi-vars=$pkgver-$pkgrel
    nephrite-hw-usb-{host,redirect,smartcard}=$pkgver-$pkgrel
    nephrite-ui-{curses,dbus,egl-headless,gtk,opengl,sdl,spice-{app,core}}=$pkgver-$pkgrel
    nephrite-vhost-user-gpu=$pkgver-$pkgrel
  )
  optdepends=("${_nephrite_desktop_optdepends[@]}")
  optdepends_x86_64=('nephrite-vmsr-helper: for accessing the Running Average Power Limit (RAPL) MSR')
  provides=(nephrite=$pkgver)
  _install_licenses
}

package_nephrite-emulators-full() {
  pkgdesc="All Nephrite user mode and system emulators"
  depends=(
    nephrite-system-{aarch64,alpha,arm,avr,hexagon,hppa,loongarch64,m68k,microblaze,mips,or1k,ppc,riscv,rx,s390x,sh4,sparc,tricore,x86,xtensa}=$pkgver-$pkgrel
    nephrite-user=$pkgver-$pkgrel
  )
  _install_licenses
}

package_nephrite-full() {
  pkgdesc="A full Nephrite setup"
  depends=(
    nephrite-audio-{alsa,dbus,jack,oss,pa,sdl,spice}=$pkgver-$pkgrel
    nephrite-block-iscsi=$pkgver-$pkgrel
    nephrite-chardev-baum=$pkgver-$pkgrel
    nephrite-desktop=$pkgver-$pkgrel
    nephrite-docs=$pkgver-$pkgrel
    nephrite-emulators-full=$pkgver-$pkgrel
    nephrite-hw-s390x-virtio-gpu-ccw=$pkgver-$pkgrel
    nephrite-pr-helper=$pkgver-$pkgrel
    nephrite-tests=$pkgver-$pkgrel
    nephrite-tools=$pkgver-$pkgrel
    nephrite-user=$pkgver-$pkgrel
  )
  depends_x86_64=(nephrite-vmsr-helper=$pkgver-$pkgrel)
  optdepends=("${_nephrite_full_optdepends[@]}")
  provides=(nephrite=$pkgver)
  _install_licenses
}

# vim:set ts=2 sw=2 et:
