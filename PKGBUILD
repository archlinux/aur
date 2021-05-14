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
_futex2=y
#enable winesync
_winesync=y
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

pkgbase=linux-cacule-testing
# pkgname=('linux-cacule' linux-cacule-headers)
_major=5.12.4
#_minor=1
#_minorc=$((_minor+1))
#_rcver=rc8
pkgver=${_major}
#_stable=${_major}.${_minor}
#_stablerc=${_major}-${_rcver}
_srcname=linux-${_major}
pkgrel=2
pkgdesc='Linux-CacULE-testing Kernel by Hamad Marri and with some other patchsets'
arch=('x86_64')
url="https://github.com/hamadmarri/cacule-cpu-scheduler"
license=('GPL2')
options=('!strip')
makedepends=('kmod' 'bc' 'libelf' 'python-sphinx' 'python-sphinx_rtd_theme'
             'graphviz' 'imagemagick' 'pahole' 'cpio' 'perl' 'tar' 'xz')
_patchsource="https://raw.githubusercontent.com/ptr1337/linux-cacule-aur/master/patches/5.12"
source=(#"https://www.kernel.org/pub/linux/kernel/v5.x/linux-${_stablerc}.tar.xz"
        "https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/$_srcname.tar.xz"
        "config"
        "${_patchsource}/arch-patches-v2/0001-arch-patches.patch"
        "${_patchsource}/cacule-patches/IL.patch"
        "${_patchsource}/cacule-patches/0002-cacule-Change-default-preemption-latency-to-2ms-for-.patch"
        "${_patchsource}/cpu-patches/0001-cpu-patches.patch"
        "${_patchsource}/futex-patches/0001-futex-resync-from-gitlab.collabora.com.patch"
        "${_patchsource}/futex2-stable-patches-v2/0001-futex2-resync-from-gitlab.collabora.com.patch"
        "${_patchsource}/wine-esync-patches/0001-v5.12-winesync.patch"
        "${_patchsource}/zen-patches-v2/0001-zen-patches.patch"
        "${_patchsource}/bfq-patches-v4/0001-bfq-patches.patch"
        "${_patchsource}/block-patches/0001-block-patches.patch"
        "${_patchsource}/ll-patches/0005-Disable-CPU_FREQ_GOV_SCHEDUTIL.patch"
        "${_patchsource}/fixes-miscellaneous/0001-fixes-miscellaneous.patch"
        "${_patchsource}/bbr2-patches-v2/0001-bbr2-5.12-introduce-BBRv2.patch"
        "${_patchsource}/btrfs-patches-v4/0001-btrfs-patches.patch"
        "${_patchsource}/android-patches/0001-android-export-symbold-and-enable-building-ashmem-an.patch"
        "${_patchsource}/pf-patches-v2/0001-pf-patches.patch"
        "${_patchsource}/lru-patches-v4/0001-lru-patches.patch"
        "${_patchsource}/ntfs3-patches/0001-ntfs3-patches.patch"
        "${_patchsource}/zstd-dev-patches-v3/0001-zstd-dev-patches.patch"
        "${_patchsource}/clearlinux-patches-v2/0001-clearlinux-patches.patch"
        "${_patchsource}/initramfs-patches/0001-initramfs-patches.patch" )

sha512sums=('db6dd1746ffbf2e702336e444ddf31d2f50d62998566663ed07ec696dd2af860255cc6636ace639b696240212e7b757be5b65885f8b3a0812931aec892be2752'
            '7112e1c4d827423505c48df55d10526041fac7c90ffa5dd0a4d9f00e44eb564842611bdf3b00342397edf2bfac1a4905f763709d8febc6cc8a438ed449747a23'
            'd7015f3886a66d1a0d6f919566417e754a5f94d5ddb323c459424b6acf04bf6af942e9c3dc1c81962adb14803e1de8585c703a96bb665484941e91c57e92724b'
            '5c30a2d672c433fa3c3b013338bffb0f03adf145b3ed623993d511947be91757b08ebdb2a21b997cdbcb7af53c28dd96b8d09e421cd51b5f3b19c5d3f096f186'
            'bafda1ec6114a360bed8a9f8ae6b1e8dc5c22adf15f7545c3455a090f14b491639707f6624d7a891ec66b459842e61df9d62274b070b7a611f0bdbd367219ae5'
            '15933126feeb56ccc6ace70db9fa7afb64d148900e41a780e42e03ce09faf7bab12413f526675b918aeff55e91dc038ad58884bb7add4a45962aca79d576cb93'
            '449570b8b9a04391cc2cc171cc806b3a132c6e969c7cedf9c4925d24244888e6f2e5afb6c551521fe62fcb7e2bf08cb8d396f9ec785ecfcdd5ea27dd9ffed4ea'
            'a0ba9fd091e4cc30b2a493e23299c0ce242ee26e8af399ea9aa115face3b90a723fb20f8877042c6b311a9eca20513bb932c1fd1c5db262b1df7b37160c0634e'
            '905f97cdff3e096552159a229d069d1b1418f4142b2927134110f504bfe0883309b3f29c2aeeb94c528b63e0eec7d0d69b44c3d498211c610811969cc4d07a56'
            '1c6cdf40009ce6c62b0a35cc7c2a74818b7169d32e18fb3c2bb8761762c15c579f64cb36f9076c4f78d3f88f077f6246ee75ba93f370cc40dae450d6d71117bb'
            'bd90ea2c83488c2dda03d0bab544e4d749de96d39f004de4bfe71a1432e637f8efa1663c5e34cadf328aeaee139661e7cdcd8d6e32cff47667351ed8395d3d05'
            'daeec34905469d8e3a10eca2bf71e3875423fc72a92ff62bff74aef8f0af90cfc3282d5c67483379feb33b1c518287b6165b5fe42f9a8bcbc6dd3dbfcde38121'
            '47f265716ebd268e4296aaba1efe5098df00736b69ec7d0413cace6dbb5cb162c1c952f7527a2a41b246ed76e6e112514c5349e8dc52f4609def30257e18d7aa'
            '5081a6a3a3db160ef0a23acd0c0db403cc4b3eb2dfd280b1b7ba2ae907d362e4d6a653d546523c870af07009c62f58eec26e7b8174a3f4fcbaa32808d965ad73'
            '28446f518e88ab934330111a01019cb164bfdd21094c69e96cc16c7931440d069ef997ae141154c97c80fcb727e8c4d940b8bf63554e3f4179652523e285c5b4'
            'b765ef2b4b783f490fff9071727ace1215b9b588666c9518765323b9ada9207b3cfb9918a16b3f7eeb3cf5784d4c5919d7f3cde41236712c210dd9a733ff8320'
            '1b3b48246fe70e8ca7390cacacf560696c1d98604a7716ac32df8f3d7fc7cc2ab733ab24e372fffa63016344f2e4ed078f7d597c3c1261f0ca3ff1c87a13dcb9'
            '076a48767614ec97a84ccefa5795e4f36973f64a7728a9f716d5d9ecb6f6907ffcc74f7fab845e9d9aef3ef5d3d4df4e03f6c5a755c7fdd4bc43751003902e71'
            'd428d3f54634b91e41cac279f7c7b708a174d9cac085b7497802c5a50f77bbfcfdd8799c1db3351ba18e8316685b729d292bb45de0da443762dbd1b87cbc7dad'
            '6d837eed8014bbb09b580867ed94fa03373a6a063ee68a0337109aff20b0e469c985d42b71704d08f4ea30d359cebd0a4a801a5ef6ec02c21331e40e5be1e602'
            'db592b1e12651ae494f1414079a3f268175776a067c69148387e05f86b6656308c810eb20cc5c1fe7804030abcb8c37ba5ab7480660c224c591f2718569c2cc9'
            'cfc3af4eeab5e17a37a336211ea979a76e235228fd51a7dea8a722935747aa1048ab42ddade7100b07a53fc924fd6adb0929ee00025ae8a6417e6178fa725ea6'
            '21a613ef65497ecf66daf31b43e02022c71195b48082ae7628a9d2ba8619819f69a6702c4c87e39e8718074c7ebfd674694a29a962049a16d47f1e5f748c78c3')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
    cd $_srcname

    ### Setting version
        echo "Setting version..."
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
      cp "${srcdir}"/config .config
      make olddefconfig


  ### Prepared version
        make -s kernelrelease > version
        echo "Prepared $pkgbase version $(<version)"

    ### Optionally use running kernel's config
	# code originally by nous; http://aur.archlinux.org/packages.php?#ID=40191
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

  ### CPU_ARCH SCRIPT ##
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
    scripts/config --set-val CONFIG_NR_LRU_GENS 5
    scripts/config --set-val CONFIG_TIERS_PER_GEN 3
    scripts/config --enable CONFIG_LRU_GEN_ENABLED
    scripts/config --disable CONFIG_LRU_GEN_STATS

  ### Enabling ZSTD COMPRESSION ##
#      echo "Set module compression to ZSTD"
#      scripts/config --enable CONFIG_MODULE_COMPRESS
#      scripts/config --disable CONFIG_MODULE_COMPRESS_XZ
#      scripts/config --enable CONFIG_MODULE_COMPRESS_ZSTD
#      scripts/config --set-val CONFIG_MODULE_COMPRESS_ZSTD_LEVEL 19
#      scripts/config --disable CONFIG_KERNEL_ZSTD_LEVEL_ULTRA

  ### Enabling Cacule-Config ##
      echo "Enable CacULE CPU scheduler..."
      scripts/config --enable CONFIG_CACULE_SCHED
      scripts/config --enable CONFIG_FAIR_GROUP_SCHED
      scripts/config --enable CONFIG_SCHED_AUTOGROUP
      scripts/config --disable CONFIG_SCHED_DEBUG
      scripts/config --enable CONFIG_SCHED_INFO
      scripts/config --disable CONFIG_SCHEDSTATS
      scripts/config --disable CONFIG_DEBUG_KERNEL
      scripts/config --disable CONFIG_EXPERT
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
      # disable CONFIG_DEBUG_INFO at build time otherwise memory usage blows up and
      # can easily overwhelm a system with 32 GB of memory using a tmpfs build.
      # introduced by FS#66260, see:
      # https://git.archlinux.org/svntogit/packages.git/commit/trunk?h=packages/linux&id=663b08666b269eeeeaafbafaee07fd03389ac8d7
#      scripts/config --disable CONFIG_DEBUG_INFO
#      scripts/config --disable CONFIG_CGROUP_BPF
#      scripts/config --disable CONFIG_BPF_LSM
#      scripts/config --disable CONFIG_BPF_PRELOAD
#      scripts/config --disable CONFIG_BPF_LIRC_MODE2
#      scripts/config --disable CONFIG_BPF_KPROBE_OVERRIDE

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
    depends=('linux-cacule-testing' 'pahole')

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
