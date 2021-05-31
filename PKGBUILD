# Contributor: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>
# Maintainer: ptr1337 <admin@ptr1337.dev>

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them

# NUMA is optimized for multi-socket motherboards.
# A single multi-core CPU actually runs slower with NUMA enabled.
# See, https://bugs.archlinux.org/task/31187
_NUMAdisable=y
# Enable fsync
_fsync=y
#enable futex2
_futex2=
#enable winesync
_winesync=
### Set performance governor as default
_per_gov=y
### Disable Deadline I/O scheduler
_deadline_disable=y
### Disable Kyber I/O scheduler
_kyber_disable=y
### Running with a 2000 HZ, 1000HZ or 500HZ tick rate
_2k_HZ_ticks=
_1k_HZ_ticks=y
_500_HZ_ticks=
# Compile ONLY used modules to VASTLYreduce the number of modules built
# and the build time.
#
# To keep track of which modules are needed for your specific system/hardware,
# give module_db script a try: https://aur.archlinux.org/packages/modprobed-db
# This PKGBUILD read the database kept if it exists
#
# More at this wiki page ---> https://wiki.archlinux.org/index.php/Modprobed-db
_localmodcfg=

# Use the current kernel's .config file
# Enabling this option will use the .config of the RUNNING kernel rather than
# the ARCH defaults. Useful when the package gets updated and you already went
# through the trouble of customizing your config options.  NOT recommended when
# a new kernel is released, but again, convenient for package bumps.
_use_current=

### Do not edit below this line unless you know what you're doing

pkgbase=linux-cacule-rdb-rc
# pkgname=('linux-cacule' linux-cacule-headers)
_major=5.13
#_minor=1
#_minorc=$((_minor+1))
_rcver=rc4
pkgver=${_major}.${_rcver}
#_stable=${_major}.${_minor}
_stablerc=${_major}-${_rcver}
_srcname=linux-${_stablerc}
pkgrel=1
pkgdesc='Linux-CacULE Kernel-RC by Hamad Marri and with some other patchsets'
arch=('x86_64')
url="https://github.com/hamadmarri/cacule-cpu-scheduler"
license=('GPL2')
options=('!strip')
makedepends=('kmod' 'bc' 'libelf' 'python-sphinx' 'python-sphinx_rtd_theme'
             'graphviz' 'imagemagick' 'pahole' 'cpio' 'perl' 'tar' 'xz')
_patchsource="https://raw.githubusercontent.com/ptr1337/linux-cacule-aur/master/patches/5.12"
_patchsource2="https://raw.githubusercontent.com/ptr1337/linux-cacule-aur/master/patches/5.13"
source=(#"https://www.kernel.org/pub/linux/kernel/v5.x/linux-${_stablerc}.tar.xz"
                     "https://git.kernel.org/torvalds/t/linux-5.13-rc4.tar.gz"
                     "config"
                 #    "${_patchsource}/arch-patches-v3/0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch"
                     "${_patchsource2}/cacule-patches/cacule-5.13.patch"
                    "${_patchsource2}/cacule-patches/rdb-5.13.patch"
                     "${_patchsource2}/bbr2-5.13.patch"
                     "${_patchsource2}/bfq-5.13.patch"
                     "${_patchsource2}/ksm-5.13.patch"
                     "${_patchsource2}/cpu-5.13.patch"
                     "${_patchsource2}/fixes-5.13.patch"
                     "${_patchsource2}/zstd-5.13.patch"
                     "${_patchsource2}/futex/1001-futex-513-wait_multiple.patch"
                     "${_patchsource2}/misc/2002-tune-vm-mm-and-vfs-settings.patch"
                     "${_patchsource}/ll-patches/0005-Disable-CPU_FREQ_GOV_SCHEDUTIL.patch"
                     "${_patchsource}/lru-gen/PATCH-v3-00-14-Multigenerational-LRU-Framework.patch"
             #        "${_patchsource}/lrng/1004-dev-random-new-lrng-approach-v40.patch"
                     "${_patchsource}/ll-patches/0005-Disable-CPU_FREQ_GOV_SCHEDUTIL.patch"
      )

sha512sums=('94ee9e59d4a3edcaf229c5ec29623302b50dd62d4ef8bdd91539cf0009f5a5fd13be629dbe78d004b016fec822c9e755898ea708fa33e1c74c54a650f64e030e'
            '13e846acdb24a19e1834b62e81b144469ccfdb86cf37cb10febfaaf5052ba97db3f299feec50c935c8cb92f009ce2a40f482f3f9e54d5ccad171eb1f79402f81'
            '0ca83b1c2d97dfa6f6498694266d3785e67d877a7b5abe66505f96b8f31cb62d93e719212d19bfef522826166f8c00719cfec442a128ca0d261761a75d334ea6'
            'bf184a096b72f6ba795dd42814d8f6b1b6ea50b6efdf24d172c2cf4f6228f626aaaf665c2cec0bbd9540e7acb46d977c35eda4e66fd475c63511ef534212391d'
            '7b4911737ef22cb1209ad88b894e20b6740ade7e6a44513c5d8555090df77f84d0aa5955b21cafaa6da26f0b7e92eaca60f92662f9e5ae8f3175f908fe416214'
            '2230a9158069302b63ea7ff7902a8115e6bfb478827550f2974d8e3ee590471a587040e15614ec775d04c5983e228864f2097e757a5b6260f89022db04eed66b'
            'c1a565d63a679f00fc597ed6d63f0b1568adfbe96c484fe9f816a4aef727ed22dd108b270e4f47b1df72f1415fe645afeede3d71c8c22d9b821175a5c83a135a'
            '224fed8f664a779c66959766b15c74f11b13c5484e53ba372b5c12fc3b8885141d8dfdafdc0cd5003de130d7b63d6d786f468ca044ff522b640493a82dca27c4'
            '8646c34028a563ad4aa2f86c9c267a132504df43134ea804bc893545ac2b14eb805ee42b7954d554a4bd128a6e3a7cd5757c2d3eb7797944fbce7668bc06b37e'
            '962b0dd7be9e1298a7972680efba445061fa508bdb2d3777fb2b2e3636738654a4bd2e7dd02e7936129e536527145f906a388f65b2f25775ba9be351d1181b82'
            'd8fbb667096a8d1d84db4d40c361bce5fc55e207c73fab266dba9033c6aff0cc0307c8a854c09fd2dabd99139ce640047bc87e0fd067d12ca1bd8f76f5d10ad3'
            'a5e9b9d6a08be2d6bc6b724176c207c052d2271b3b77885b8169ed02c608b89726ea8b3e9664c4bc4c85aab938e88c67fb15de42f9f9a649d54b466b473fcdc5'
            '47f265716ebd268e4296aaba1efe5098df00736b69ec7d0413cace6dbb5cb162c1c952f7527a2a41b246ed76e6e112514c5349e8dc52f4609def30257e18d7aa'
            '341492bf6b899a8fb4a0ef375e5461ec6e49c96755c10dd85d36b3b35a62d4e15a8b2df14aecc6bcc13485a16ad21a360050a091cf69b5aa4fc84a74dee34020'
            '47f265716ebd268e4296aaba1efe5098df00736b69ec7d0413cace6dbb5cb162c1c952f7527a2a41b246ed76e6e112514c5349e8dc52f4609def30257e18d7aa')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
    cd $_srcname

    ### Setting version
        echo "Setting version..."
        sed -e "/^EXTRAVERSION =/s/=.*/=/" -i Makefile
        scripts/setlocalversion --save-scmversion
        echo "-$pkgrel" > localversion.10-pkgrel
        echo "${pkgbase#linux}" > localversion.20-pkgname

    ### Patching sources
        local src
        for src in "${source[@]}"; do
            src="${src%%::*}"
            src="${src##*/}"
            [[ $src = *.patch ]] || continue
        echo "Applying patch $src..."
        patch -Np1 < "../$src"
        done

    ### Setting config
        echo "Setting config..."
        cp ../config .config
        make olddefconfig

    ### Prepared version
        make -s kernelrelease > version
        echo "Prepared $pkgbase version $(<version)"

    ### Optionally use running kernel's config
	# code originally by nous; http://aur.archlinux.org/packages.php?ID=40191
	if [ -n "$_use_current" ]; then
		if [[ -s /proc/config.gz ]]; then
			echo "Extracting config from /proc/config.gz..."
			# modprobe configs
			zcat /proc/config.gz > ./.config
		else
			warning "Your kernel was not compiled with IKCONFIG_PROC!"
			warning "You cannot read the current config!"
			warning "Aborting!"
			exit
		fi
	fi

  source "${startdir}"/configure

  cpu_arch

  ### Optionally set tickrate to 2000HZ
    if [ -n "$_2k_HZ_ticks" ]; then
      echo "Setting tick rate to 2k..."
      scripts/config --disable CONFIG_HZ_300
      scripts/config --enable CONFIG_HZ_2000
      scripts/config --set-val CONFIG_HZ 2000
    fi

### Optionally set tickrate to 1000
   if [ -n "$_1k_HZ_ticks" ]; then
      echo "Setting tick rate to 1k..."
      scripts/config --disable CONFIG_HZ_300
      scripts/config --enable CONFIG_HZ_1000
      scripts/config --set-val CONFIG_HZ 1000
   fi

### Optionally set tickrate to 500HZ
  if [ -n "$_500_HZ_ticks" ]; then
    echo "Setting tick rate to 500HZ..."
    scripts/config --disable CONFIG_HZ_300
    scripts/config --enable CONFIG_HZ_500
    scripts/config --set-val CONFIG_HZ 500
  fi

### Optionally disable NUMA for 64-bit kernels only
  # (x86 kernels do not support NUMA)
  if [ -n "$_NUMAdisable" ]; then
    echo "Disabling NUMA from kernel config..."
    scripts/config --disable CONFIG_NUMA
  fi

  if [ -n "$_fsync" ]; then
    echo "Enable Fsync support"
    scripts/config --enable CONFIG_FUTEX
    scripts/config --enable CONFIG_FUTEX_PI
  fi

  if [ -n "$_futex2" ]; then
    echo "Enable Futex2 support"
    scripts/config --enable CONFIG_FUTEX2
  fi

  if [ -n "$_winesync" ]; then
        echo "Enable winesync support"
      scripts/config --module CONFIG_WINESYNC
  fi

### Set performance governor
  if [ -n "$_per_gov" ]; then
    echo "Setting performance governor..."
    scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL
    scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
    echo "Disabling uneeded governors..."
    scripts/config --enable CONFIG_CPU_FREQ_GOV_ONDEMAND
    scripts/config --disable CONFIG_CPU_FREQ_GOV_CONSERVATIVE
    scripts/config --disable CONFIG_CPU_FREQ_GOV_USERSPACE
    scripts/config --disable CONFIG_CPU_FREQ_GOV_SCHEDUTIL
  fi

### Disable Deadline I/O scheduler
  if [ -n "$_deadline_disable" ]; then
    echo "Disabling Deadline I/O scheduler..."
    scripts/config --disable CONFIG_MQ_IOSCHED_DEADLINE
  fi

### Disable Kyber I/O scheduler
  if [ -n "$_kyber_disable" ]; then
    echo "Disabling Kyber I/O scheduler..."
    scripts/config --disable CONFIG_MQ_IOSCHED_KYBER
  fi

  ### Enable protect file mappings under memory pressure

  echo "Enabling protect file mappings under memory pressure..."
  scripts/config --enable CONFIG_UNEVICTABLE_FILE
  scripts/config --set-val CONFIG_UNEVICTABLE_FILE_KBYTES_LOW 262144
  scripts/config --set-val CONFIG_UNEVICTABLE_FILE_KBYTES_MIN 131072

  ### Enable multigenerational LRU

  echo "Enabling multigenerational LRU..."
  scripts/config --enable CONFIG_HAVE_ARCH_PARENT_PMD_YOUNG
  scripts/config --enable CONFIG_LRU_GEN
  scripts/config --set-val CONFIG_NR_LRU_GENS 7
  scripts/config --set-val CONFIG_TIERS_PER_GEN 4
  scripts/config --enable CONFIG_LRU_GEN_ENABLED
  scripts/config --disable CONFIG_LRU_GEN_STATS

### Enabling ZSTD COMPRESSION ##
  #  echo "Set module compression to ZSTD"
#    scripts/config --enable CONFIG_MODULE_COMPRESS
#    scripts/config --disable CONFIG_MODULE_COMPRESS_XZ
#    scripts/config --enable CONFIG_MODULE_COMPRESS_ZSTD
    scripts/config --set-val CONFIG_MODULE_COMPRESS_ZSTD_LEVEL 19
    scripts/config --disable CONFIG_KERNEL_ZSTD_LEVEL_ULTRA

### Enabling Cacule-Config ##
    echo "Enable CacULE CPU scheduler..."
    scripts/config --enable CONFIG_CACULE_SCHED
    scripts/config --enable CONFIG_CACULE_RDB
    scripts/config --enable CONFIG_FAIR_GROUP_SCHED
    scripts/config --disable CONFIG_SCHED_AUTOGROUP
    scripts/config --disable CONFIG_EXPERT
    scripts/config --disable CONFIG_SCHED_DEBUG
    scripts/config --disable CONFIG_SCHED_INFO
    scripts/config --disable CONFIG_SCHEDSTATS
    scripts/config --disable CONFIG_DEBUG_KERNEL
    scripts/config --enable CONFIG_NO_HZ
    scripts/config --enable CONFIG_NO_HZ_COMMON
    echo "Enabling KBUILD_CFLAGS -O3..."
    scripts/config --disable CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE
    scripts/config --enable CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3
    echo "Enable PREEMPT"
    scripts/config --disable CONFIG_PREEMPT_NONE
    scripts/config --disable CONFIG_PREEMPT_VOLUNTARY
    scripts/config --enable CONFIG_PREEMPT
    scripts/config --enable CONFIG_PREEMPT_COUNT
    scripts/config --enable CONFIG_PREEMPTION
    echo "Enable NTFS3"
    scripts/config --module CONFIG_NTFS_FS
    scripts/config --enable CONFIG_NTFS_RW
    scripts/config --enable CONFIG_NTFS_DEBUG
    scripts/config --module CONFIG_NTFS3_FS
    scripts/config --enable CONFIG_NTFS3_64BIT_CLUSTER
    scripts/config --enable CONFIG_NTFS3_LZX_XPRESS
    scripts/config --enable CONFIG_NTFS3_FS_POSIX_ACL
### Enable ANBOX
    echo "Enable Anbox"
    scripts/config --module  CONFIG_ASHMEM
    scripts/config --enable  CONFIG_ANDROID_BINDER_IPC_SELFTEST
    scripts/config --enable  CONFIG_ANDROID
    scripts/config --enable  CONFIG_ANDROID_BINDER_IPC
    scripts/config --enable  CONFIG_ANDROID_BINDERFS
    scripts/config --set-str CONFIG_ANDROID_BINDER_DEVICES binder,hwbinder,vndbinder
    echo "Disabling TCP_CONG_CUBIC..."
    scripts/config --module CONFIG_TCP_CONG_CUBIC
    scripts/config --disable CONFIG_DEFAULT_CUBIC
    echo "Enabling TCP_CONG_BBR2..."
    scripts/config --enable CONFIG_TCP_CONG_BBR2
   scripts/config --enable CONFIG_DEFAULT_BBR2
    scripts/config --set-str CONFIG_DEFAULT_TCP_CONG bbr2
    echo "Enable CONFIG_VHBA"
    scripts/config --module CONFIG_VHBA
    scripts/config --disable CONFIG_BPF_PRELOAD
    scripts/config --disable CONFIG_GCC_PLUGINS



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

### Save configuration for later reuse
   echo "Save config for reuse"
   cat .config > "${startdir}/config.last"

}

build() {
  cd $_srcname

  make all
}

_package() {
    pkgdesc="The $pkgdesc kernel and modules"
    depends=('coreutils' 'kmod' 'initramfs')
    optdepends=('crda: to set the correct wireless channels of your country'
                'linux-firmware: firmware images needed for some devices'
                'modprobed-db: Keeps track of EVERY kernel module that has ever been probed - useful for those of us who make localmodconfig')


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
  make INSTALL_MOD_PATH="$pkgdir/usr" INSTALL_MOD_STRIP=1 modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}
}

_package-headers() {
    pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
    depends=('linux-cacule-rdb-rc' 'pahole')

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

  echo "Stripping vmlinux..."
  strip -v $STRIP_STATIC "$builddir/vmlinux"

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
