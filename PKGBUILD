# Maintainer: Leonidas Spyropoulos <artafinde AT gmail DOT com>
# Credit to graysky for shamelessly copying PKGBUILD from linux-ck

### BUILD OPTIONS
# Set the next three variables to ANYTHING that is not null to enable them

# Tweak kernel options prior to a build via nconfig
_makenconfig=

# Only compile active modules to VASTLY reduce the number of modules built and
# the build time.
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD reads the database kept if it exists
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
_localmodcfg=

# Optionally select a sub architecture by number or leave blank which will
# require user interaction during the build. Note that the generic (default)
# option is 36.
#
#  1. AMD Opteron/Athlon64/Hammer/K8 (MK8)
#  2. AMD Opteron/Athlon64/Hammer/K8 with SSE3 (MK8SSE3) (NEW)
#  3. AMD 61xx/7x50/PhenomX3/X4/II/K10 (MK10) (NEW)
#  4. AMD Barcelona (MBARCELONA) (NEW)
#  5. AMD Bobcat (MBOBCAT) (NEW)
#  6. AMD Jaguar (MJAGUAR) (NEW)
#  7. AMD Bulldozer (MBULLDOZER) (NEW)
#  8. AMD Piledriver (MPILEDRIVER) (NEW)
#  9. AMD Steamroller (MSTEAMROLLER) (NEW)
#  10. AMD Excavator (MEXCAVATOR) (NEW)
#  11. AMD Zen (MZEN) (NEW)
#  12. AMD Zen 2 (MZEN2) (NEW)
#  13. AMD Zen 3 (MZEN3) (NEW)
#  14. Intel P4 / older Netburst based Xeon (MPSC)
#  15. Intel Core 2 (MCORE2)
#  16. Intel Atom (MATOM)
#  17. Intel Nehalem (MNEHALEM) (NEW)
#  18. Intel Westmere (MWESTMERE) (NEW)
#  19. Intel Silvermont (MSILVERMONT) (NEW)
#  20. Intel Goldmont (MGOLDMONT) (NEW)
#  21. Intel Goldmont Plus (MGOLDMONTPLUS) (NEW)
#  22. Intel Sandy Bridge (MSANDYBRIDGE) (NEW)
#  23. Intel Ivy Bridge (MIVYBRIDGE) (NEW)
#  24. Intel Haswell (MHASWELL) (NEW)
#  25. Intel Broadwell (MBROADWELL) (NEW)
#  26. Intel Skylake (MSKYLAKE) (NEW)
#  27. Intel Skylake X (MSKYLAKEX) (NEW)
#  28. Intel Cannon Lake (MCANNONLAKE) (NEW)
#  29. Intel Ice Lake (MICELAKE) (NEW)
#  30. Intel Cascade Lake (MCASCADELAKE) (NEW)
#  31. Intel Cooper Lake (MCOOPERLAKE) (NEW)
#  32. Intel Tiger Lake (MTIGERLAKE) (NEW)
#  33. Intel Sapphire Rapids (MSAPPHIRERAPIDS) (NEW)
#  34. Intel Rocket Lake (MROCKETLAKE) (NEW)
#  35. Intel Alder Lake (MALDERLAKE) (NEW)
#  36. Generic-x86-64 (GENERIC_CPU)
#  37. Generic-x86-64-v2 (GENERIC_CPU2) (NEW)
#  38. Generic-x86-64-v3 (GENERIC_CPU3) (NEW)
#  39. Generic-x86-64-v4 (GENERIC_CPU4) (NEW)
#  40. Intel-Native optimizations autodetected by GCC (MNATIVE_INTEL) (NEW)
#  41. AMD-Native optimizations autodetected by GCC (MNATIVE_AMD) (NEW)
_subarch=

### IMPORTANT: Do no edit below this line unless you know what you're doing

pkgbase=linux-prjc
pkgver=5.15.4
pkgrel=1
pkgdesc='Linux'
url="https://gitlab.com/alfredchen/linux-prjc"
arch=(x86_64)
license=(GPL2)
makedepends=(bc kmod libelf pahole cpio xmlto python-sphinx python-sphinx_rtd_theme graphviz imagemagick git)
options=('!strip')
_srcname=linux-${pkgver}
_arch_config_commit=1c61d8bae658098893817c837fbb8393247e726c
_prjc_version=5.15-r1
_prjc_patch="prjc_v${_prjc_version}.patch"
_gcc_more_v=20211114
source=(
  "https://www.kernel.org/pub/linux/kernel/v5.x/linux-$pkgver.tar".{xz,sign}
  "config::https://raw.githubusercontent.com/archlinux/svntogit-packages/${_arch_config_commit}/trunk/config"
  "${_prjc_patch}::https://gitlab.com/alfredchen/projectc/raw/master/${_prjc_version%-*}/${_prjc_patch}"
  "more-uarches-$_gcc_more_v.tar.gz::https://github.com/graysky2/kernel_compiler_patch/archive/$_gcc_more_v.tar.gz"
  "0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch::https://github.com/archlinux/linux/commit/8f4b84416e1738041fe3cae3ee00e5227365c11c.patch"
  "0002-staging-r8188eu-Fix-breakage-introduced-when-5G-code.patch::https://github.com/archlinux/linux/commit/564a2d913e6d580a28c2e7710f04f2a27ec027f2.patch"
  "0003-PCI-Add-more-NVIDIA-controllers-to-the-MSI-masking-q.patch::https://github.com/archlinux/linux/commit/b6f0344961e165919bfddb0e03033792b9ea8a28.patch"
  "0004-drm-amd-pm-avoid-duplicate-powergate-ungate-setting.patch::https://github.com/archlinux/linux/commit/4e023bf774e59df151f0b056179ab46f5d60423e.patch"
  "0005-iommu-intel-do-deep-dma-unmapping-to-avoid-kernel-fl.patch::https://github.com/archlinux/linux/commit/e17b993a29594029001366eb183c527ef9144d6c.patch"
  "0006-cpufreq-intel_pstate-ITMT-support-for-overclocked-sy.patch::https://github.com/archlinux/linux/commit/43c4562c8109e71a5a363af5ddb027ef734132b0.patch"
  "0007-Bluetooth-btintel-Fix-bdaddress-comparison-with-garb.patch::https://github.com/archlinux/linux/commit/236027c0ae73217898ac8249e44394cc1026dada.patch"
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
b2sums=('1ce31010ecd0945fa8c521da092f6dacef9b1223723fba9c271424427a4b23decac11c6dcf68eabf4f5f0f91cc4abab50e3bcbd776632f345fdc86be5ca7d986'
        'SKIP'
        '1154722c5d8a33dedbd18679724ef34ac3aa96900c53aa8ebbba10ea87b0aaa0363d278b0aa4e5e5fed7e85c05e9b7892ba6bdd72f87117f584fef785d6f91d0'
        '110a03b5658200f7414922cf4ed361b6127c08d99359111209c86d951907626c92ff1e50f6906a0f56534e24aa2f35520dae11fa0d148ade488b93a401cb706f'
        '534091fb5034226d48f18da2114305860e67ee49a1d726b049a240ce61df83e840a9a255e5b8fa9279ec07dd69fb0aea6e2e48962792c2b5367db577a4423d8d'
        'c9d4d9ac756342cadbccbb278d3b412cd5bd265195f11374651cc0f8f82f1dba5a9150593e30b1931a1c97d8eae22352c8e605a1461f9cd2549bc410e36ddd5d'
        '530d50fa961785eb2bb443b4a5327d416ac95922cc3cf7220e9e597bd158e0a0c767ec90fcb6f2ab8ecb6370c7eadd4d8e61a8ad9bf887735fe094d202df5568'
        '0da1f147a5a2053e786056937b7acd5cfb747108a603a2f20533b1e9beb43c48bf533b3700dc51a5ee263895e736fa4782a8d176c99c24a7355a2a3f06d87e6e'
        '3996d46019d9c80bb53e2a73ea584c5b530696c71b6ca3708cf8e00daa9c9c53d7e90eb2a2dc0acd31aa84cc32731a9b01aaf5bfc29c8d11690531e86a0c5243'
        '805d36318c1da46f41344781c559ade4e714c429ad49d3b021e8b13c445247d2a3c1ffd2257bf83ab77011ffc98444639a3b29279caf4bc98864c858f30fbc28'
        '55ef23269648b8132403dcb537ccd63c9a1ed729c12693dc55bb7506f8fb8b97d66e86cf6496be3c7738ae8e9f044e5240ca415ea75b7f8ff04ef0d6cd67da06'
        '6dddaf79c531b5b1fa8e600710c24beeaee7ca07125543e09f44b17e869e4314e9aa56fe3ecf5b4e5816d81e67ed83a7ecc86b1a69b4262657bda74706b97c1d')

_kernelname=${pkgbase#linux}
: ${_kernelname:=-prjc}
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

  # disable CONFIG_DEBUG_INFO=y at build time otherwise memory usage blows up
  # and can easily overwhelm a system with 32 GB of memory using a tmpfs build
  # partition ... this was introduced by FS#66260, see:
  # https://git.archlinux.org/svntogit/packages.git/commit/trunk?h=packages/linux&id=663b08666b269eeeeaafbafaee07fd03389ac8d7
  scripts/config --disable CONFIG_DEBUG_INFO
  scripts/config --disable CONFIG_CGROUP_BPF
  scripts/config --disable CONFIG_BPF_LSM
  scripts/config --disable CONFIG_BPF_PRELOAD
  scripts/config --disable CONFIG_BPF_LIRC_MODE2
  scripts/config --disable CONFIG_BPF_KPROBE_OVERRIDE

  # https://bbs.archlinux.org/viewtopic.php?pid=1824594#p1824594
  scripts/config --enable CONFIG_PSI_DEFAULT_DISABLED

  # https://bbs.archlinux.org/viewtopic.php?pid=1863567#p1863567
  scripts/config --disable CONFIG_LATENCYTOP
  scripts/config --disable CONFIG_SCHED_DEBUG

  # FS#66613
  # https://bugzilla.kernel.org/show_bug.cgi?id=207173#c6
  scripts/config --disable CONFIG_KVM_WERROR

  echo "Applying patch ${_prjc_patch}..."
  patch -Np1 -i "$srcdir/${_prjc_patch}"

  # non-interactively apply prjc default options
  # this isn't redundant if we want a clean selection of subarch below
  make olddefconfig

  # https://github.com/graysky2/kernel_gcc_patch
  # make sure to apply after olddefconfig to allow the next section
  echo "Patching to enable GCC optimization for other uarchs..."
  patch -Np1 -i "$srcdir/kernel_compiler_patch-$_gcc_more_v/more-uarches-for-kernel-5.15+.patch"

  if [ -n "$_subarch" ]; then
    # user wants a subarch so apply choice defined above interactively via 'yes'
    yes "$_subarch" | make oldconfig
  else
    # no subarch defined so allow user to pick one
    make oldconfig
  fi

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

  # uncomment if you want to build with distcc
  ### sed -i '/HAVE_GCC_PLUGINS/d' arch/x86/Kconfig
}

build() {
  cd $_srcname
  make all
}

_package() {
  pkgdesc="The ${pkgbase/linux/Linux} kernel and modules with the Project C patch set"
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
}

_package-headers() {
  pkgdesc="Headers and scripts for building modules for the ${pkgbase/linux/Linux} kernel"
  depends=('linux-prjc')

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

}

pkgname=("$pkgbase" "$pkgbase-headers")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
