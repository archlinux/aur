# Maintainer: Maik Broemme <mbroemme@libmpq.org>
# Contributor: Janne Heß <jannehess@gmail.com>
# Contributor: Arthur Borsboom <arthurborsboom@gmail.com>
# Contributor: Shanmu Thiagaraja <sthiagaraja+AUR@prshanmu.com>
# Contributor: Limao Luo
# Contributor: Luceo
# Contributor: Revellion
# Contributor: John Thomson

# Build variables to enable certain optional features.
_build_stubdom=${build_stubdom:-false}

pkgbase="xen"
pkgname=("xen" "xen-docs")
pkgver="4.11.0"
pkgrel="1"
arch=("x86_64") # TODO What about ARM?
url="http://www.xenproject.org/"
license=("GPL2")
changelog="ChangeLog"
validpgpkeys=("23E3222C145F4475FA8060A783FE14C957E82BD9")
options=(!buildflags !strip)
makedepends=(
  "bin86"
  "binutils>=2.30"
  "bridge-utils"
  "brltty"
  "cmake"
  "curl"
  "dev86"
  "fig2dev"
  "figlet"
  "ghostscript"
  "git"
  "gnutls"
  "iasl"
  "iproute2"
  "lib32-glibc"
  "libaio"
  "libcap-ng"
  "libepoxy"
  "libiscsi"
  "libnl"
  "libpng"
  "lzo"
  "markdown"
  "nasm"
  "ocaml-findlib"
  "pandoc"
  "pciutils"
  "perl"
  "python2"
  "sdl"
  "spice"
  "spice-glib"
  "spice-protocol"
  "usbredir"
  "vde2"
  "wget"
  "yajl"
)
source=(
  "https://downloads.xenproject.org/release/xen/${pkgver}/${pkgbase}-${pkgver}.tar.gz"
  "https://downloads.xenproject.org/release/xen/${pkgver}/${pkgbase}-${pkgver}.tar.gz.sig"
  "ipxe-git.tar.gz::http://xenbits.xen.org/xen-extfiles/ipxe-git-356f6c1b64d7a97746d1816cef8ca22bdd8d0b5d.tar.gz"

  # Helper and config files.
  "grub-mkconfig-helper"
  "efi-xen.cfg"
  "grub.conf"
  "${pkgbase}.conf"
  "tmpfiles.conf"

  # XSA patches.

  # Compile fixes.
  "ipxe-git-use-no-pie-on-newer-versions-of-gcc.patch::https://git.ipxe.org/ipxe.git/patch/7c395b0e21806b946fe944a27fc273407f357ea1"
)
sha256sums=(
  "826e3a9f6d0eac94a825d272cc2c1294e22640ae75af906eb13920f9ad667643"
  "SKIP"
  "251e5516d7de470c434ae5c393aacca2b61fb24d93770592a4a20add60b785c4"

  # Helper and config files.
  "23c3b0eab4cb06260bd07324d2060356560c9bc52270aaaf6130e1c130fc6e5e"
  "ceaff798a92a7aef1465a0a0b27b1817aedd2c857332b456aaa6dd78dc72438f"
  "3f0af16958c3e057b9baa5afc47050d9adf7dd553274dd97ae4f35938fefb568"
  "50a9b7fd19e8beb1dea09755f07318f36be0b7ec53d3c9e74f3266a63e682c0c"
  "40e0760810a49f925f2ae9f986940b40eba477dc6d3e83a78baaae096513b3cf"

  # XSA patches.

  # Compile fixes.
  "51ff22b2d0f7e9d7a13666adb2c32321e725e9c0bf0f434b3cc7c760d88620c6"
)
noextract=(
  "ipxe-git.tar.gz"
)

# Stub Domain files (grep '_VERSION=' stubdom/configure).
if [ "${_build_stubdom}" = true ] ; then
  source+=(
    "zlib.tar.gz::http://xenbits.xen.org/xen-extfiles/zlib-1.2.3.tar.gz"
    "pciutils.tar.bz2::http://xenbits.xen.org/xen-extfiles/pciutils-2.2.9.tar.bz2"
    "newlib.tar.gz::http://xenbits.xen.org/xen-extfiles/newlib-1.16.0.tar.gz"
    "lwip.tar.gz::http://xenbits.xen.org/xen-extfiles/lwip-1.3.0.tar.gz"
    "grub.tar.gz::http://xenbits.xen.org/xen-extfiles/grub-0.97.tar.gz"
    "ocaml.tar.gz::http://caml.inria.fr/pub/distrib/ocaml-3.11/ocaml-3.11.0.tar.gz"
    "gmp.tar.bz2::http://xenbits.xen.org/xen-extfiles/gmp-4.3.2.tar.bz2"
    "polarssl-gpl.tgz::http://xenbits.xen.org/xen-extfiles/polarssl-1.1.4-gpl.tgz"
    "tpm_emulator.tar.gz::http://xenbits.xen.org/xen-extfiles/tpm_emulator-0.7.4.tar.gz"
  )
  sha256sums+=(
    "1795c7d067a43174113fdf03447532f373e1c6c57c08d61d9e4e9be5e244b05e"
    "f60ae61cfbd5da1d849d0beaa21f593c38dac9359f0b3ddc612f447408265b24"
    "db426394965c48c1d29023e1cc6d965ea6b9a9035d8a849be2750ca4659a3d07"
    "772e4d550e07826665ed0528c071dd5404ef7dbe1825a38c8adbc2a00bca948f"
    "4e1d15d12dbd3e9208111d6b806ad5a9857ca8850c47877d36575b904559260b"
    "ecdd4f8473ab0dee5d3acb5c0a31a4c1dd6aa12179895cf1903dd0f455c43a4f"
    "936162c0312886c21581002b79932829aa048cfaf9937c6265aeaa14f1cd1775"
    "2d29fd04a0d0ba29dae6bd29fb418944c08d3916665dcca74afb297ef37584b6"
    "4e48ea0d83dd9441cc1af04ab18cd6c961b9fa54d5cbf2c2feee038988dea459"
  )
  noextract+=(
    "zlib.tar.gz"
    "pciutils.tar.bz2"
    "newlib.tar.gz"
    "lwip.tar.gz"
    "grub.tar.gz"
    "ocaml.tar.gz"
    "gmp.tar.bz2"
    "polarssl-gpl.tgz"
    "tpm_emulator.tar.gz"
  )
fi

prepare() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  # Preparing downloads.
  msg2 'Copying downloaded files...'
  cp "${srcdir}/ipxe-git.tar.gz" tools/firmware/etherboot/ipxe.tar.gz

  # XSA patches.
  msg2 'Applying XSA patches...'

  # Security patches and compile fixes (qemu-xen-traditional).
  msg2 'Applying tools patches (qemu-xen-traditional)...'
  cd tools/qemu-xen-traditional
  cd ../..

  # Security patches and compile fixes (qemu-xen).
  msg2 'Applying tools patches (qemu-xen)...'
  cd tools/qemu-xen
  cd ../..

  # Misc compile fixes (removed in future versions if not needed anymore).
  msg2 'Applying misc compile fixes...'

  # Compile fix for ipxe package with gcc-8.
  cp "${srcdir}/ipxe-git-use-no-pie-on-newer-versions-of-gcc.patch" "${srcdir}/${pkgbase}-${pkgver}/tools/firmware/etherboot/patches"
  echo "ipxe-git-use-no-pie-on-newer-versions-of-gcc.patch" >> "${srcdir}/${pkgbase}-${pkgver}/tools/firmware/etherboot/patches/series"

  # Fix Install Paths.
  msg2 'Fixing installation paths...'
  sed 's,/var/run,/run,g' -i tools/hotplug/Linux/locking.sh
  sed 's,/var/run,/run,g' -i tools/misc/xenpvnetboot
  sed 's,/var/run,/run,g' -i tools/xenmon/xenbaked.c
  sed 's,/var/run,/run,g' -i tools/xenmon/xenmon.py
  sed 's,/var/run,/run,g' -i tools/pygrub/src/pygrub

  # Copy supporting tarballs into place.
  if [ "${_build_stubdom}" = true ] ; then
    msg2 'Copying stubdom files...'
    cp "${srcdir}/zlib.tar.gz" stubdom/
    cp "${srcdir}/pciutils.tar.bz2" stubdom/
    cp "${srcdir}/newlib.tar.gz" stubdom/
    cp "${srcdir}/lwip.tar.gz" stubdom/
    cp "${srcdir}/grub.tar.gz" stubdom/
    cp "${srcdir}/ocaml.tar.gz" stubdom/
    cp "${srcdir}/gmp.tar.bz2" stubdom/
    cp "${srcdir}/polarssl-gpl.tgz" stubdom/
    cp "${srcdir}/tpm_emulator.tar.gz" stubdom/
  fi
}

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  if [ "${_build_stubdom}" = true ] ; then
    _config_stubdom='--enable-stubdom'
  else
    _config_stubdom='--disable-stubdom'
  fi

  # Configure Xen.
  msg2 'Configuring...'
  ./autogen.sh
  PYTHON=/usr/bin/python2 ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --with-sysconfig-leaf-dir=conf.d \
    --with-rundir=/run \
    --enable-systemd \
    --enable-ovmf \
    --with-system-ovmf=/usr/share/ovmf/x64/OVMF_CODE.fd \
    --with-system-seabios=/usr/share/qemu/bios-256k.bin \
    "${_config_stubdom}" \
    --with-extra-qemuu-configure-args=" \
      --disable-bluez \
      --disable-gtk \
      --disable-vte \
      --disable-werror \
      --disable-virglrenderer \
      --disable-libnfs \
      --disable-glusterfs \
      --disable-numa \
      --disable-smartcard \
      --disable-fdt \
      --enable-spice \
      --enable-usb-redir \
      --with-sdlabi=1.2"

  msg2 'Building Xen...'
  make LANG=C PYTHON=python2 dist
}

package_xen() {
  pkgdesc="Virtual Machine Hypervisor & Tools"
  depends=(
    "bridge-utils"
    "brltty"
    "curl"
    "gnutls"
    "iproute2"
    "lib32-glibc"
    "libaio"
    "libcap-ng"
    "libepoxy"
    "libiscsi"
    "libnl"
    "libpng"
    "lzo"
    "pciutils"
    "python2"
    "sdl"
    "spice"
    "usbredir"
    "vde2"
    "yajl"
  )
  optdepends=(
    "xen-docs: Official Xen Documentation"
    "openvswitch: Optional Networking support"
    "seabios: Boot VMs with BIOS"
    "ovmf: Boot VMs with UEFI"
  )
  provides=("xen-${pkgver}")
  install="${pkgbase}.install"
  backup=(
    "etc/conf.d/xencommons"
    "etc/conf.d/xendomains"
    "etc/${pkgbase}/efi-xen.cfg"
    "etc/${pkgbase}/cpupool"
    "etc/${pkgbase}/grub.conf"
    "etc/${pkgbase}/oxenstored.conf"
    "etc/${pkgbase}/xl.conf"
  )

  cd "${srcdir}/${pkgbase}-${pkgver}"
  msg2 'Installing Xen...'
  make DESTDIR="${pkgdir}" LANG=C PYTHON=python2 install

  # Install files for Arch Linux.
  msg2 'Installing Arch-specific files...'
  install -D -m 0644 "${srcdir}/grub.conf" "${pkgdir}/etc/xen/grub.conf"
  install -D -m 0755 "${srcdir}/grub-mkconfig-helper" "${pkgdir}/etc/grub.d/09_xen"
  install -D -m 0644 "${srcdir}/efi-xen.cfg" "${pkgdir}/etc/xen/efi-xen.cfg"
  install -D -m 0644 "${srcdir}/xen.conf" "${pkgdir}/usr/lib/modules-load.d/xen.conf"
  install -D -m 0644 "${srcdir}/tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgbase}.conf"

  # Create missing directories.
  msg2 'Create missing directories...'
  mkdir -p "${pkgdir}/var/log/xen/console"

  # Move EFI binaries to right location.
  msg2 'Moving efi binary...'
  mv "${pkgdir}/usr/lib64/efi/xen"*.efi "${pkgdir}/boot"
  rmdir "${pkgdir}/usr/lib64/efi"
  rmdir "${pkgdir}/usr/lib64"

  # Clean up.
  msg2 'Cleaning up...'

  # Remove hypervisor symlinks.
  find "${pkgdir}/boot" -type l -delete

  # Remove syms.
  find "${pkgdir}/usr/lib/debug" -type f \( -name '*-syms*' -or -name '*\.map' \) -delete
  rmdir "${pkgdir}/usr/lib/debug/usr/lib/xen/boot"
  rmdir "${pkgdir}/usr/lib/debug/usr/lib/xen"
  rmdir "${pkgdir}/usr/lib/debug/usr/lib"
  rmdir "${pkgdir}/usr/lib/debug/usr"
  rmdir "${pkgdir}/usr/lib/debug"

  # Remove SysVinit files.
  rm -r "${pkgdir}/etc/init.d"

  # Remove temporary directories.
  rm -r "${pkgdir}/run"

  # Remove documentation (included in separate xen-docs package).
  rm -r "${pkgdir}/usr/share/doc"
  rm -r "${pkgdir}/usr/share/man"

  # Remove unnecessary qemu support files.
  rm "${pkgdir}/usr/share/qemu-xen/qemu/palcode-clipper"
  rm "${pkgdir}/usr/share/qemu-xen/qemu/openbios-ppc"
  rm "${pkgdir}/usr/share/qemu-xen/qemu/openbios-sparc32"
  rm "${pkgdir}/usr/share/qemu-xen/qemu/openbios-sparc64"
}

package_xen-docs() {
  pkgdesc="Virtual Machine Hypervisor documentation"
  arch=("any")
  provides=("xen-docs-${pkgver}")

  cd "${srcdir}/${pkgbase}-${pkgver}"
  msg2 'Installing documentation...'
  make DESTDIR="${pkgdir}" LANG=C PYTHON=python2 install-docs
}
