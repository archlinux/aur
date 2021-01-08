# Maintainer: Leonidas Spyropoulos <artafinde AT gmail DOT com>
# Credit to graysky for shamelessly copying PKGBUILD from linux-ck

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them

# Tweak kernel options prior to a build via nconfig
_makenconfig=

# Compile ONLY used modules to VASTLYreduce the number of modules built
# and the build time.
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db script a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD read the database kept if it exists
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
_localmodcfg=

### IMPORTANT: Do no edit below this line unless you know what you're doing

pkgbase=linux-gc
pkgver=5.10.5
pkgrel=1
pkgdesc='Linux'
url="https://cchalpha.blogspot.co.uk/"
arch=(x86_64)
license=(GPL2)
makedepends=(
  bc kmod libelf pahole
  xmlto python-sphinx python-sphinx_rtd_theme graphviz imagemagick
  git
)
options=('!strip')
_srcname=linux-${pkgver}
_arch_tag_commit=85a93920af2d3fffff676e90c5560089496cba81
_bmqversion=5.10-r2
_bmq_patch="prjc_v${_bmqversion}.patch"
_gcc_more_v='20201113'
source=(
  "https://www.kernel.org/pub/linux/kernel/v5.x/linux-$pkgver.tar".{xz,sign}
  "config::https://raw.githubusercontent.com/archlinux/svntogit-packages/${_arch_tag_commit}/trunk/config"
  "${_bmq_patch}::https://gitlab.com/alfredchen/projectc/raw/master/${_bmqversion%-*}/${_bmq_patch}"
  "enable_additional_cpu_optimizations-${_gcc_more_v}.tar.gz::https://github.com/graysky2/kernel_gcc_patch/archive/${_gcc_more_v}.tar.gz"
  "0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch::https://git.archlinux.org/linux.git/patch/?id=3925c72c3245f3bdef8224114f665acb3ba65434"
  "0002-Bluetooth-Fix-attempting-to-set-RPA-timeout-when-uns.patch::https://git.archlinux.org/linux.git/patch/?id=7c2e4c1ef7e5c78a2e668e744563c9bd5f2b488f"
  "0003-HID-quirks-Add-Apple-Magic-Trackpad-2-to-hid_have_sp.patch::https://git.archlinux.org/linux.git/patch/?id=ab24a3058ff19f9578b93a4073773e11a2d3b9bf"
  "0004-btrfs-Fix-500-2000-performance-regression-w-5.10.patch::https://git.archlinux.org/linux.git/patch/?id=24141c21ecdb5d95665d74b31c4a0b76110606bb"
  "0005-iwlwifi-Fix-regression-from-UDP-segmentation-support.patch::https://git.archlinux.org/linux.git/patch/?id=c954d99bf3e3ceaefd1c1b5293393a8614bd7571"
  "0006-ALSA-hda-hdmi-fix-locking-in-silent_stream_disable.patch::https://git.archlinux.org/linux.git/patch/?id=a204be2dae771de5b62758710938b96a398a52cc"
  "0006-Revert-drm-amd-display-Fix-memory-leaks-in-S3-resume.patch::https://git.archlinux.org/linux.git/patch/?id=a70000cd95f7d55a8df0a7f5e0ed41c5656a0f53"
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
  'A2FF3A36AAA56654109064AB19802F8B0D70FC30'  # Jan Alexander Steffens (heftig)
)
b2sums=('25b71eb091ea6526a7ebfef5bc201b76d612e5138b6b3caa708f90e76196c30d1865c223e2084a118a3883a9620d47c9576b1ab7db2c8d9c0f204dda7c640eab'
        'SKIP'
        'cb3a58e4eef8395b75887d94a84bba25f05fbec8f576a791623057a190a1d51b412a19ecf1b600ac3f9f6c46968eb0e130d571743e61afc231a97146ee4b52d0'
        '964457a55fe70988fcba968d2940d78d3daff5d1629863279ee15e07f8c1bb4e58e4d22b2cae9e66ab0c61c4d54de04e7a6eb2710eaaa536ec11f29efa961f1c'
        '7f1eb5938472f57748216bd00e0c875feab99fc1c5cb89babfea467ee30ca5c8e9fc5a691efe2e602bef1ea79820c5383822d7cec354b48d23321ccda8ee8127'
        'c986b237af87ea6f4113b64d74d433c01d02149d2a32a5b5b23ebcdeefc67d28ef463bd5f0e4e693ab72b1939b6b587f86ae3ddcf8d4ac7a08307af3ba8ef660'
        '92bc0930b7001377091f8d92b301643603ddcab24181e48835aea8794c3d2e60dcbb6666188f6c98694475eb35e3fcdba15427b0bfe858c18906aceccf8915ce'
        '0704667810f2b8ec7530de2a42846835ed16484390e29a0ce700e605c3751152a0338662c5fd0970db00da7aedcb7a305b1ff7d94e39ab10daf6f2d7edd9f79f'
        '14c6cf3d7aade158390ad5a3b8b44e537605045a004df74c70f1b49985228043c4284146ef050889f6a9427a5ac295cd9bd46a95397cea5fedb60793ef8d5ffe'
        '869269a1703d7b1249e17e24756d599412c6549f8aa2676459af8cd6435b2e3a53ff0b9ddbc88bd7b81313fbf21a9257e47bb104092bad52b419bf9e4d3324d0'
        'eae587f948f21d94616fe384a8676b269e39b552086037c1a16c96497a752c08628dfc1a83ed57ccdea19389a0a03826c6c116ff6aa25dcedce1027a94564b6d'
        '6db620d44c908f14fec4dd74b345ee2829fff1fad8783deb3c31cc9c4e298c269711dcc478dfd72c72a5d8b36447d6ff892589eb322bf0811810cd861805d3eb')

_kernelname=${pkgbase#linux}
: ${_kernelname:=-gc}
export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd $_srcname

  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "$_kernelname" > localversion.20-pkgname

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = 0*.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  echo "Setting config..."
  cp ../config .config

  # disable CONFIG_DEBUG_INFO=y at build time introduced in this commit
  # https://git.archlinux.org/svntogit/packages.git/commit/trunk?h=packages/linux&id=663b08666b269eeeeaafbafaee07fd03389ac8d7
  sed -i -e 's/CONFIG_DEBUG_INFO=y/# CONFIG_DEBUG_INFO is not set/' \
      -i -e '/CONFIG_DEBUG_INFO_DWARF4=y/d' -i -e '/CONFIG_DEBUG_INFO_BTF=y/d' ./.config

  echo "Applying patch ${_bmq_patch}..."
  patch -Np1 -i "$srcdir/${_bmq_patch}"

  # non-interactively apply ck1 default options
  # this isn't redundant if we want a clean selection of subarch below
  make olddefconfig

  # https://github.com/graysky2/kernel_gcc_patch
  echo "Applying enable_additional_cpu_optimizations-${_gcc_more_v}..."
  patch -Np1 -i "$srcdir/kernel_gcc_patch-$_gcc_more_v/enable_additional_cpu_optimizations_for_gcc_v10.1+_kernel_v5.8+.patch"

  make oldconfig

  ### Optionally load needed modules for the make localmodconfig
  # See https://aur.archlinux.org/packages/modprobed-db
  if [ -n "$_localmodcfg" ]; then
    if [ -f $HOME/.config/modprobed.db ]; then
      echo "Running Steven Rostedt's make localmodconfig now"
      make LSMOD=$HOME/.config/modprobed.db localmodconfig
    else
      echo "No modprobed.db data found"
      exit
    fi
  fi

  make -s kernelrelease > version
  echo "Prepared ${pkgbase} version $(<version)"

  [[ -z "$_makenconfig" ]] || make nconfig

  # save configuration for later reuse
  cat .config > "${startdir}/config.last"
}

build() {
  cd $_srcname
  make all
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules with the Project C scheduler"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')

  cd $_srcname
  local kernver="$(<version)"
  local modulesdir="$pkgdir/usr/lib/modules/$kernver"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  echo "Installing modules..."
  #make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install
  # not needed since not building with CONFIG_DEBUG_INFO=y

  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}

  echo "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the ${pkgbase/linux/Linux} kernel"
  depends=('linux-gc')

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # add xfs and shmem for aufs building
  mkdir -p "$builddir"/{fs/xfs,mm}

  echo "Installing headers..."
  cp -t "$builddir" -a include
  cp -t "$builddir/arch/x86" -a arch/x86/include
  install -Dt "$builddir/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

  install -Dt "$builddir/drivers/md" -m644 drivers/md/*.h
  install -Dt "$builddir/net/mac80211" -m644 net/mac80211/*.h

  # http://bugs.archlinux.org/task/13146
  install -Dt "$builddir/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # http://bugs.archlinux.org/task/20402
  install -Dt "$builddir/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "$builddir/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "$builddir/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  echo "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  echo "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
    echo "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  echo "Removing documentation..."
  rm -r "$builddir/Documentation"

  echo "Removing broken symlinks..."
  find -L "$builddir" -type l -printf 'Removing %P\n' -delete

  echo "Removing loose objects..."
  find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

  echo "Stripping build tools..."
  local file
  while read -rd '' file; do
    case "$(file -bi "$file")" in
      application/x-sharedlib\;*)      # Libraries (.so)
        strip -v $STRIP_SHARED "$file" ;;
      application/x-archive\;*)        # Libraries (.a)
        strip -v $STRIP_STATIC "$file" ;;
      application/x-executable\;*)     # Binaries
        strip -v $STRIP_BINARIES "$file" ;;
      application/x-pie-executable\;*) # Relocatable binaries
        strip -v $STRIP_SHARED "$file" ;;
    esac
  done < <(find "$builddir" -type f -perm -u+x ! -name vmlinux -print0)

  #echo "Stripping vmlinux..."
  #strip -v $STRIP_STATIC "$builddir/vmlinux"
  # not needed since not building with CONFIG_DEBUG_INFO=y

  echo "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"

  echo "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

pkgname=("$pkgbase" "$pkgbase-headers")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
