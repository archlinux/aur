# Maintainer : Vitalii Babichuk <vitalii.babichuk@gmail.com>
# Original : https://gitea.artixlinux.org/packages/grub/src/commit/84e357704cfea4b6bb9e1699d78532d37e245b46

## "1" to enable IA32-EFI build in Arch x86_64, "0" to disable
_IA32_EFI_IN_ARCH_X64="1"

## "1" to enable EMU build, "0" to disable
_GRUB_EMU_BUILD="0"

[[ "${CARCH}" == 'x86_64' ]] && _EFI_ARCH='x86_64'
[[ "${CARCH}" == 'i686' ]] && _EFI_ARCH='i386'

[[ "${CARCH}" == 'x86_64' ]] && _EMU_ARCH='x86_64'
[[ "${CARCH}" == 'i686' ]] && _EMU_ARCH='i386'

pkgname='grub-argon2-git'
pkgdesc='GNU GRand Unified Bootloader (2) with Argon2 support'
epoch=2
_pkgver=2.12
_unifont_ver='16.0.03'
#pkgver=${_pkgver/-/}
pkgver='2.12.r292.g73d1c959'
pkgrel=1
url='https://www.gnu.org/software/grub/'
arch=('x86_64')
license=('GPL-3.0-or-later')
backup=(
  etc/default/grub
  etc/grub.d/40_custom
)
install="grub.install"
options=('!makeflags')
conflicts=(
  grub-bios
  grub-common
  grub-efi-${_EFI_ARCH}
  grub-emu
  grub-legacy
  grub
)
replaces=(
  grub-common
  grub-bios
  grub-emu 
  grub-efi-${_EFI_ARCH}
  grub
)
provides=(
  grub-bios
  grub-common
  grub-efi-${_EFI_ARCH}
  grub-emu
  grub
)
makedepends=(
  autogen
  device-mapper
  freetype2
  fuse3
  gettext
  git
  help2man
  python
  rsync
  texinfo
  ttf-dejavu
  xz
)
depends=(
  device-mapper
  gettext
  sh
  xz
)
optdepends=(
  'dosfstools: For grub-mkrescue FAT FS and EFI support'
  'efibootmgr: For grub-install EFI support'
  'freetype2: For grub-mkfont usage'
  'fuse3: For grub-mount usage'
  'libisoburn: Provides xorriso for generating grub rescue iso using grub-mkrescue'
  'lzop: For grub-mkrescue LZO support'
  'mtools: For grub-mkrescue FAT FS support'
  'os-prober: To detect other OSes when generating grub.cfg in BIOS systems'
)

if [[ "${_GRUB_EMU_BUILD}" == "1" ]]; then
  makedepends+=(
  libusbx
  sdl
  )
  optdepends+=(
  'libusbx: For grub-emu USB support'
  'sdl: For grub-emu SDL support'
  )
fi

validpgpkeys=(
  'E53D497F3FA42AD8C9B4D1E835A93B74E82E4209'  # Vladimir 'phcoder' Serbinenko <phcoder@gmail.com>
  'BE5C23209ACDDACEB20DB0A28C8189F1988C2166'  # Daniel Kiper <dkiper@net-space.pl>
  '95D2E9AB8740D8046387FD151A09227B1F435A33') # Paul Hardy <unifoundry@unifoundry.com>

# The original GNU Savannah Git repository is horribly slow. It's better to use a slightly older version of libreboot,
# but cloning is faster.
source=(
  "git+https://codeberg.org/libreboot/grub.git#tag=grub-${_pkgver}"
  'git+https://codeberg.org/libreboot/gnulib.git'
  "https://ftp.gnu.org/gnu/unifont/unifont-${_unifont_ver}/unifont-${_unifont_ver}.bdf.gz"{,.sig}
  '0001-00_header-add-GRUB_COLOR_-variables.patch'
  '0002-10_linux-detect-archlinux-initramfs.patch'
  '0003-support-dropins-for-default-configuration.patch'
  '0004-support-argon2_1.patch'
  '0004-support-argon2_2.patch'
  '0004-support-argon2_3.patch'
  '0004-support-argon2_4.patch'
  '0004-support-argon2_5.patch'
  'grub.default'
  'sbat.csv'
)
b2sums=('a6cec7271c3ea54a99f02ee6bc0a5825c8be657af68ba9a32b39a5fe8bcb571fb1ba39210426f6bf6a48d913e6e00df37dc2123ea1b39330f4c47bd9dbac9ae3'
        'SKIP'
        'b67b0b1fe896ed403b23ec34d929d95324ffb710467ffcd2f2292dedb652c097b941337d18621fa6a7f955e1331d552e14b3f71353f523b3846f433a645f9bcb'
        'SKIP'
        '992c71790785304c28fbaf0dba21dab3e283b199509f0e7e1aa0df08126da75e15b6626c3638279ff2ecaa59b925096d7dbd67d6a53cebd0ce4326ff3719d25b'
        'b4cd9ac976a579eca19d54c0b31c8d6324525fe5a0b9f5405deb63845367ac1adaa80ece4c166dfd5304608c41aa44b4f64efe235c03f437523b993be06e06e3'
        'a7820bfe9bddc34af49de63222b3d2a9788367083e29db13b33120269adbfa1619ac421d8597f662f756592889f5cc5538544a17d9936d1420bd5742282c710c'
        'c06186915eda67f6aa1942415153d019728458882c635e4c543fed193af4128a8e8466eac5de4809b916c5a92f2e2b1d216c984581d3d46cd71e3850ee2922e8'
        'e588f5af33516affebce163fca3cfe2a17a9127e7b94ebdffcabbefbbcc816e38cba4e468052e47b5e3274a4608abcda71307baa337e6aa3bcc315d362080bfd'
        'e0cc0efb59e2978fa116f27b10b900d068ed8f98ce4dc9484fda4c4967ac9b4751ee69b1198e902a370c7611af5319eac0bf292f145f429e7988701466628256'
        'f8532738d2d3d90f07782a593486c4758aae0df5cdd6ef287c433e02e9787a0be47794bb46c8f3657ed401a3a31da6cefd18b73425799435de92ebe466330f4c'
        '351fe62566caf3dc2a033e08d483c63786dcc2f1dbbbd7eb9e06578fbef7ab012b0d760b395cfde676149231b8a6c5cf90fbef3dcc46f19185f7ed2e74af6c30'
        'cc37eb36944fc2d61a6f07f9957e2092288d6e5aceb317bd61d2ed3234b8fb479a5bf41570cebded2ba565bb8c9ed3743982bc108748d8e2de1aae8f287b49fc'
        'e3a1d429fb02c30f8eb8316db5074b37e08bfcb007385dd050977068816e4e46fae48a228f982efd15150d177c7838fe9caf29f7620b35ab156508bd9264577a')

_backports=(
  # current git master for loads of security fixes
  # https://lists.gnu.org/archive/html/grub-devel/2025-02/msg00024.html
  "grub-${_pkgver}..73d1c959ea3417e9309ba8c6102d7d6dc7c94259"
)

_reverts=(
)

_configure_options=(
  PACKAGE_VERSION="${epoch}:${pkgver}-${pkgrel}"
  FREETYPE="pkg-config freetype2"
  BUILD_FREETYPE="pkg-config freetype2"
  --enable-nls
  --enable-device-mapper
  --enable-cache-stats
  --enable-grub-mkfont
  --enable-grub-mount
  --prefix="/usr"
  --bindir="/usr/bin"
  --sbindir="/usr/bin"
  --mandir="/usr/share/man"
  --infodir="/usr/share/info"
  --datarootdir="/usr/share"
  --sysconfdir="/etc"
  --program-prefix=""
  --with-bootdir="/boot"
  --with-grubdir="grub"
  --disable-silent-rules
  --disable-werror
)

prepare() {
  cd "${srcdir}/grub/"

  echo "Apply backports..."
  local _c _l
  for _c in "${_backports[@]}"; do
    if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
    git log --oneline "${_l}" "${_c}"
    git cherry-pick --mainline 1 --no-commit "${_c}"
  done

  echo "Apply reverts..."
  local _c _l
  for _c in "${_reverts[@]}"; do
    if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
    git log --oneline "${_l}" "${_c}"
    git revert --mainline 1 --no-commit "${_c}"
  done

  echo "Patch to enable GRUB_COLOR_* variables in grub-mkconfig..."
  ## Based on http://lists.gnu.org/archive/html/grub-devel/2012-02/msg00021.html
  patch -Np1 -i "${srcdir}/0001-00_header-add-GRUB_COLOR_-variables.patch"

  echo "Patch to detect of Arch Linux initramfs images by grub-mkconfig..."
  patch -Np1 -i "${srcdir}/0002-10_linux-detect-archlinux-initramfs.patch"

  echo "Patch to support dropins for default configuration..."
  patch -Np1 -i "${srcdir}/0003-support-dropins-for-default-configuration.patch"

  echo "Patch to support Argon2..."
  # Patch made by Patrick Steinhardt in scope of:
  # https://aur.archlinux.org/packages/grub-improved-luks2-git
  patch -Np1 -i "${srcdir}/0004-support-argon2_1.patch"
  patch -Np1 -i "${srcdir}/0004-support-argon2_2.patch"
  patch -Np1 -i "${srcdir}/0004-support-argon2_3.patch"
  patch -Np1 -i "${srcdir}/0004-support-argon2_4.patch"
  patch -Np1 -i "${srcdir}/0004-support-argon2_5.patch"

  echo "Fix DejaVuSans.ttf location so that grub-mkfont can create *.pf2 files for starfield theme..."
  sed 's|/usr/share/fonts/dejavu|/usr/share/fonts/dejavu /usr/share/fonts/TTF|g' -i "configure.ac"

  echo "Fix mkinitcpio 'rw' FS#36275..."
  sed 's| ro | rw |g' -i "util/grub.d/10_linux.in"

  echo "Fix OS naming FS#33393..."
  sed 's|GNU/Linux|Linux|' -i "util/grub.d/10_linux.in"

  echo "Pull in latest language files..."
  ./linguas.sh

  echo "Avoid problem with unifont during compile of grub..."
  # http://savannah.gnu.org/bugs/?40330 and https://bugs.archlinux.org/task/37847
  gzip -cd "${srcdir}/unifont-${_unifont_ver}.bdf.gz" > "unifont.bdf"

  echo "Run bootstrap..."
  ./bootstrap \
    --gnulib-srcdir="${srcdir}/gnulib/" \
    --no-git

  echo "Make translations reproducible..."
  sed -i '1i /^PO-Revision-Date:/ d' po/*.sed
}

_build_grub-common_and_bios() {
  echo "Set ARCH dependent variables for bios build..."
  if [[ "${CARCH}" == 'x86_64' ]]; then
    _EFIEMU="--enable-efiemu"
  else
    _EFIEMU="--disable-efiemu"
  fi

  echo "Copy the source for building the bios part..."
  cp -r "${srcdir}/grub/" "${srcdir}/grub-bios/"
  cd "${srcdir}/grub-bios/"

  echo "Unset all compiler FLAGS for bios build..."
  unset CFLAGS
  unset CPPFLAGS
  unset CXXFLAGS
  unset LDFLAGS
  unset MAKEFLAGS

  echo "Run ./configure for bios build..."
  ./configure \
    --with-platform="pc" \
    --target="i386" \
    "${_EFIEMU}" \
    --enable-boot-time \
    "${_configure_options[@]}"

  if [ ! -z "${SOURCE_DATE_EPOCH}" ]; then
    echo "Make info pages reproducible..."
    touch -d "@${SOURCE_DATE_EPOCH}" $(find -name '*.texi')
  fi

  echo "Run make for bios build..."
  make
}

_build_grub-efi() {
  echo "Copy the source for building the ${_EFI_ARCH} efi part..."
  cp -r "${srcdir}/grub/" "${srcdir}/grub-efi-${_EFI_ARCH}/"
  cd "${srcdir}/grub-efi-${_EFI_ARCH}/"

  echo "Unset all compiler FLAGS for ${_EFI_ARCH} efi build..."
  unset CFLAGS
  unset CPPFLAGS
  unset CXXFLAGS
  unset LDFLAGS
  unset MAKEFLAGS

  echo "Run ./configure for ${_EFI_ARCH} efi build..."
  ./configure \
    --with-platform="efi" \
    --target="${_EFI_ARCH}" \
    --disable-efiemu \
    --enable-boot-time \
    "${_configure_options[@]}"

  echo "Run make for ${_EFI_ARCH} efi build..."
  make
}

_build_grub-emu() {
  echo "Copy the source for building the emu part..."
  cp -r "${srcdir}/grub/" "${srcdir}/grub-emu/"
  cd "${srcdir}/grub-emu/"

  echo "Unset all compiler FLAGS for emu build..."
  unset CFLAGS
  unset CPPFLAGS
  unset CXXFLAGS
  unset LDFLAGS
  unset MAKEFLAGS

  echo "Run ./configure for emu build..."
  ./configure \
    --with-platform="emu" \
    --target="${_EMU_ARCH}" \
    --enable-grub-emu-usb=no \
    --enable-grub-emu-sdl=no \
    --disable-grub-emu-pci \
    "${_configure_options[@]}"

  echo "Run make for emu build..."
  make
}

build() {
  cd "${srcdir}/grub/"

  echo "Build grub bios stuff..."
  _build_grub-common_and_bios

  echo "Build grub ${_EFI_ARCH} efi stuff..."
  _build_grub-efi

  if [[ "${CARCH}" == "x86_64" ]] && [[ "${_IA32_EFI_IN_ARCH_X64}" == "1" ]]; then
    echo "Build grub i386 efi stuff..."
    _EFI_ARCH="i386" _build_grub-efi
  fi

  if [[ "${_GRUB_EMU_BUILD}" == "1" ]]; then
    echo "Build grub emu stuff..."
    _build_grub-emu
  fi
}

_package_grub-common_and_bios() {
  cd "${srcdir}/grub-bios/"

  echo "Run make install for bios build..."
  make DESTDIR="${pkgdir}/" bashcompletiondir="/usr/share/bash-completion/completions" install

  echo "Remove gdb debugging related files for bios build..."
  rm -f "${pkgdir}/usr/lib/grub/i386-pc"/*.module || true
  rm -f "${pkgdir}/usr/lib/grub/i386-pc"/*.image || true
  rm -f "${pkgdir}/usr/lib/grub/i386-pc"/{kernel.exec,gdb_grub,gmodule.pl} || true

  echo "Install /etc/default/grub (used by grub-mkconfig)..."
  install -D -m0644 "${srcdir}/grub.default" "${pkgdir}/etc/default/grub"
}

_package_grub-efi() {
  cd "${srcdir}/grub-efi-${_EFI_ARCH}/"

  echo "Run make install for ${_EFI_ARCH} efi build..."
  make DESTDIR="${pkgdir}/" bashcompletiondir="/usr/share/bash-completion/completions" install

  echo "Remove gdb debugging related files for ${_EFI_ARCH} efi build..."
  rm -f "${pkgdir}/usr/lib/grub/${_EFI_ARCH}-efi"/*.module || true
  rm -f "${pkgdir}/usr/lib/grub/${_EFI_ARCH}-efi"/*.image || true
  rm -f "${pkgdir}/usr/lib/grub/${_EFI_ARCH}-efi"/{kernel.exec,gdb_grub,gmodule.pl} || true

  sed -e "s/%PKGVER%/${epoch}:${pkgver}-${pkgrel}/" < "${srcdir}/sbat.csv" > "${pkgdir}/usr/share/grub/sbat.csv"
}

_package_grub-emu() {
  cd "${srcdir}/grub-emu/"

  echo "Run make install for emu build..."
  make DESTDIR="${pkgdir}/" bashcompletiondir="/usr/share/bash-completion/completions" install

  echo "Remove gdb debugging related files for emu build..."
  rm -f "${pkgdir}/usr/lib/grub/${_EMU_ARCH}-emu"/*.module || true
  rm -f "${pkgdir}/usr/lib/grub/${_EMU_ARCH}-emu"/*.image || true
  rm -f "${pkgdir}/usr/lib/grub/${_EMU_ARCH}-emu"/{kernel.exec,gdb_grub,gmodule.pl} || true
}

package() {
  cd "${srcdir}/grub/"

  echo "Package grub ${_EFI_ARCH} efi stuff..."
  _package_grub-efi

  if [[ "${CARCH}" == "x86_64" ]] && [[ "${_IA32_EFI_IN_ARCH_X64}" == "1" ]]; then
    echo "Package grub i386 efi stuff..."
    _EFI_ARCH="i386" _package_grub-efi
  fi

  if [[ "${_GRUB_EMU_BUILD}" == "1" ]]; then
    echo "Package grub emu stuff..."
    _package_grub-emu
  fi

  echo "Package grub bios stuff..."
  _package_grub-common_and_bios

  install -m0755 /dev/stdin "${pkgdir}"/usr/bin/update-grub <<END
#!/bin/sh
grub-mkconfig -o /boot/grub/grub.cfg
END
}

# vim: set ts=4 sw=4 noexpandtab:
