# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>

### BUILD OPTIONS
# Set the next two variables to ANYTHING that is not null to enable them

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
### Enable protect file mappings under memory pressure
_mm_protect=y
### Enable multigenerational LRU
_lru_enable=y
### Enable Linux Random Number Generator
_lrng_enable=
### Enable SECURITY_FORK_BRUTE
# WARNING Not recommended.
# An experimental solution, still in testing phase.
# Possible compilation and installation errors.
# Leave it unselected.
_fork_brute=
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

# Use the current kernel's .config file
# Enabling this option will use the .config of the RUNNING kernel rather than
# the ARCH defaults. Useful when the package gets updated and you already went
# through the trouble of customizing your config options.  NOT recommended when
# a new kernel is released, but again, convenient for package bumps.
_use_current=

### IMPORTANT: Do no edit below this line unless you know what you're doing

pkgbase=linux-cacule-rdb-llvm
pkgname=("${pkgbase}" "${pkgbase}-headers")
pkgver=5.13.5
pkgrel=1
arch=(x86_64 x86_64_v3)
pkgdesc='Linux Kernel with cacule scheduler and lto compiled'
_gittag=v${pkgver%.*}-${pkgver##*.}
url="https://kernel.org/"
license=(GPL2)
makedepends=(
  bc kmod libelf pahole cpio perl tar xz
  xmlto python-sphinx python-sphinx_rtd_theme
  graphviz imagemagick git llvm clang
)
_patchsource="https://raw.githubusercontent.com/ptr1337/linux-cacule-aur/master/patches/5.13"
_caculepatches="https://raw.githubusercontent.com/ptr1337/linux-cacule-aur/master/patches/CacULE"
source=(
  "https://cdn.kernel.org/pub/linux/kernel/v${pkgver:0:1}.x/linux-${pkgver}.tar.xz"
  'config' # kernel config file
  #'0002-x86-fpu-2021-07-07.patch'
#  '0003-clang.patch'
"${_patchsource}/arch-patches-v2/0001-arch-patches.patch"
"${_caculepatches}/v5.13/cacule-5.13.patch"
"${_caculepatches}/v5.13/rdb-5.13.patch"
"${_patchsource}/cpu-patches/0001-cpu-patches.patch"
"${_patchsource}/futex-patches/0001-futex-resync-from-gitlab.collabora.com.patch"
"${_patchsource}/futex2/0007-v5.13-futex2_interface.patch"
"${_patchsource}/winesync/5.13-winesync.patch"
"${_patchsource}/zen-patches/0001-zen-patches.patch"
"${_patchsource}/lqx-patches-v2/0001-lqx-patches.patch"
"${_patchsource}/bfq-patches-v3/0001-bfq-patches.patch"
"${_patchsource}/block-patches-v2/0001-block-patches.patch"
"${_patchsource}/fixes-miscellaneous/0001-fixes-miscellaneous.patch"
"${_patchsource}/bbr2-patches-v2/0001-bbr2-patches.patch"
"${_patchsource}/btrfs-patches-v2/0001-btrfs-patches.patch"
"${_patchsource}/android-patches/0001-android-export-symbold-and-enable-building-ashmem-an.patch"
"${_patchsource}/pf-patches-v6/0001-pf-patches.patch"
"${_patchsource}/lru-patches-v5/0001-lru-patches.patch"
"${_patchsource}/ntfs3-patches/0001-ntfs3-patches.patch"
"${_patchsource}/lrng-patches/0001-lrng-patches.patch"
"${_patchsource}/security-patches/0001-security-patches.patch"
"${_patchsource}/alsa-patches/0001-alsa-patches.patch"
"${_patchsource}/zstd-upstream-patches/0001-zstd-upstream-patches.patch"
"${_patchsource}/clearlinux-patches-v2/0001-clearlinux-patches.patch"
"${_patchsource}/v4l2loopback-patches/0001-v4l2loopback-patches.patch"
)

BUILD_FLAGS=(
      LLVM=1
      LLVM_IAS=1
      CC=clang
      CXX=clang++
      LD=ld.lld
      AR=llvm-ar
      NM=llvm-nm
      STRIP=llvm-strip
      READELF=llvm-readelf
      HOSTCC=clang
      HOSTCXX=clang++
      HOSTAR=llvm-ar
      HOSTLD=ld.lld
      OBJCOPY=llvm-objcopy
      OBJDUMP=objdump
    )
sha256sums=('951c7c3ee07b393925d75699eccc20c9929cbe484fcdc047de79d9def33c1053'
            '6aa1147f9adadadc11d56956bb6534552e5497506b613f66bea55a08121819da'
            '2578b367f30ddf43569280403c75c056d61883128ea7827356b681fa7970bed4'
            'f42a65d6211b3861c132c72160274252cd825c9217727d0fca9c09e1f58dbf90'
            '0f1cfcd29f1a4be50b3c70925e15c039ae9f86f18d98dff00920aca8bf8b061e'
            '476c99cb010eb536ebf8b68044cd7f2a581c74e4d5c5e71e0983541f727bafde'
            'a65035f7b751ea792989784083d5063293d1a0979bcf4c428b4ba94aeac17809'
            '9ec679871cba674cf876ba836cde969296ae5034bcc10e1ec39b372e6e07aab0'
            '034d12a73b507133da2c69a34d61efd2f6b6618549650aa26d748142d22002e1'
            'f39ce0a6a967e4c83f665288479c3236b211bbbb4ee508d6fbefee2904a4e80c'
            'bd5588d4e3803913283f67232778f259b689b77e4883a2f578bbc74132bd0629'
            'c5501f058a8accf538fdb9cc541bd08419cd4d597e2c5bc31365d70c68bba5b3'
            '0735544a91293d9c192b7f9283541fe62ea5517c11e4b421b502ab76c064bd62'
            '320e67ab827abb506481b9053fae85e494195e5d0ee3b61948999965856b425c'
            '744a615a9099df44bb9c181f1d140a099fe11136c8dbb0b26e4af045460298a6'
            'aa5cbec74dc27591d47616c6c0748475ab55b5efdcbc9d81c2cc49b9b0bf2c00'
            '7289f4ce29d653a0ca511410b66bd3cb42fbcc54f5e097c85e528d4e27ce41ff'
            '04acf65e5761e787b64e59b44c7792146470c1a29c998339e53c9e02f652fbc7'
            'e33908a2aca1b5b52609075c32c714e4c3f6b52c054da2b2982a86f6f3c4b87a'
            '0a32d43109ab235ac4d49b28af0c5a3e1653a2581facd4595f098977bf19dd80'
            '5b05ebca44ff6b00ac49ec36ab360f6fa47ff809e82f40fe4299d8a1a99da4dc'
            'd562264ae4492ec07c55690cac0ee95703beed453330ab7a147e60c25b52e20f'
            '8e56f88209ec69bf7004c52a7f31ba5fffa2c6af3db306e7ec385210a0b5944e'
            '78b07f9d39573633ac7035201d7a95c44675084562995b7e60e549e44fbcfcb7'
            '04205c627cd3dcb737bd7b432cd7172d30f4ca0114b003bc3ac0dc8dadfa3c01'
            '586d03baec3f8b583b1b73e838f5e69c1d25c502e4d7e6738e1291de1b52af15')
options=('!strip')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER="${pkgbase}"
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {

  cd "${srcdir:?}/linux-${pkgver}" || (
    echo -e "\E[1;31mCan't cd to ${srcdir:?}/linux-${pkgver} directory! Prepare failed! \E[0m"
    exit 1
  )

  ### Setting version
  echo "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  local src
      for src in "${source[@]}"; do
      src="${src%%::*}"
      src="${src##*/}"
      [[ $src = *.patch ]] || continue
      echo "Applying patch $src..."
      patch -Np1 < "../$src"
  done


  echo "Setting config..."
  cp ../config .config

  make ${BUILD_FLAGS[*]} olddefconfig

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
        if [ -n "$_mm_protect" ]; then
          echo "Enabling protect file mappings under memory pressure..."
          scripts/config --enable CONFIG_UNEVICTABLE_FILE
          scripts/config --set-val CONFIG_UNEVICTABLE_FILE_KBYTES_LOW 262144
          scripts/config --set-val CONFIG_UNEVICTABLE_FILE_KBYTES_MIN 131072
          scripts/config --enable CONFIG_UNEVICTABLE_ANON
          scripts/config --set-val CONFIG_UNEVICTABLE_ANON_KBYTES_LOW 65536
          scripts/config --set-val CONFIG_UNEVICTABLE_ANON_KBYTES_MIN 32768
        fi

            ### Enable multigenerational LRU
        if [ -n "$_lru_enable" ]; then
          echo "Enabling multigenerational LRU..."
          scripts/config --enable CONFIG_HAVE_ARCH_PARENT_PMD_YOUNG
          scripts/config --enable CONFIG_LRU_GEN
          scripts/config --set-val CONFIG_NR_LRU_GENS 7
          scripts/config --set-val CONFIG_TIERS_PER_GEN 4
          scripts/config --enable CONFIG_LRU_GEN_ENABLED
          scripts/config --disable CONFIG_LRU_GEN_STATS
        fi

      ### Enable Linux Random Number Generator
      if [ -n "$_lrng_enable" ]; then
          echo "Enabling Linux Random Number Generator ..."
          scripts/config --enable CONFIG_LRNG
          scripts/config --disable CONFIG_LRNG_OVERSAMPLE_ENTROPY_SOURCES
          scripts/config --enable CONFIG_LRNG_CONTINUOUS_COMPRESSION_ENABLED
          scripts/config --disable CONFIG_LRNG_CONTINUOUS_COMPRESSION_DISABLED
          scripts/config --disable CONFIG_LRNG_SWITCHABLE_CONTINUOUS_COMPRESSION
          scripts/config --set-val CONFIG_LRNG_COLLECTION_SIZE 1024
          scripts/config --disable CONFIG_LRNG_HEALTH_TESTS
          scripts/config --set-val CONFIG_LRNG_IRQ_ENTROPY_RATE 256
          scripts/config --disable CONFIG_LRNG_JENT
          scripts/config --set-val CONFIG_LRNG_JENT_ENTROPY_RATE 16
          scripts/config --set-val CONFIG_LRNG_CPU_ENTROPY_RATE 8
          scripts/config --disable CONFIG_LRNG_DRNG_SWITCH
          scripts/config --disable CONFIG_LRNG_DRBG
          scripts/config --disable CONFIG_LRNG_TESTING_MENU
          scripts/config --disable CONFIG_LRNG_SELFTEST
      fi

          ### Enable SECURITY_FORK_BRUTE
      if [ -n "$_fork_brute" ]; then
          echo "Enabling SECURITY_FORK_BRUTE..."
          scripts/config --enable CONFIG_SECURITY_FORK_BRUTE
          scripts/config --set-str CONFIG_LSM lockdown,yama,brute
      fi

  ### Enabling ZSTD COMPRESSION ##
        echo "Set module compression to ZSTD"
       scripts/config --enable CONFIG_MODULE_COMPRESS
        scripts/config --disable CONFIG_MODULE_COMPRESS_XZ
        scripts/config --enable CONFIG_MODULE_COMPRESS_ZSTD
  #      scripts/config --set-val CONFIG_MODULE_COMPRESS_ZSTD_LEVEL 19
  #      scripts/config --disable CONFIG_KERNEL_ZSTD_LEVEL_ULTRA

  ### Enabling Cacule-Config ##
      echo "Enable CacULE CPU scheduler..."
      scripts/config --enable CONFIG_CACULE_SCHED
      scripts/config --enable CONFIG_CACULE_RDB
      scripts/config --set-val CONFIG_RDB_INTERVAL 19
      scripts/config --disable CONFIG_RDB_TASKS_GROUP
      scripts/config --disable CONFIG_FAIR_GROUP_SCHED
      scripts/config --disable CONFIG_SCHED_AUTOGROUP
      scripts/config --disable CONFIG_EXPERT
      scripts/config --disable CONFIG_SCHED_DEBUG
      scripts/config --disable CONFIG_SCHED_INFO
      scripts/config --disable CONFIG_SCHEDSTATS
      scripts/config --disable CONFIG_DEBUG_KERNEL
#        scripts/config --disable CONFIG_RT_GROUP_SCHED
      echo "Enabling Full Tickless"
      scripts/config --disable CONFIG_HZ_PERIODIC
      scripts/config --disable CONFIG_NO_HZ_IDLE
      scripts/config --enable CONFIG_NO_HZ_FULL
      scripts/config --enable CONFIG_NO_HZ
      scripts/config --enable CONFIG_NO_HZ_COMMON
      scripts/config --enable CONFIG_CONTEXT_TRACKING
      scripts/config --disable CONFIG_CONTEXT_TRACKING_FORCE
      echo "Enabling KBUILD_CFLAGS -O3..."
      scripts/config --disable CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE
      scripts/config --enable CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3
      echo "Enable PREEMPT"
      scripts/config --disable CONFIG_PREEMPT_NONE
      scripts/config --disable CONFIG_PREEMPT_VOLUNTARY
      scripts/config --enable CONFIG_PREEMPT
      scripts/config --enable CONFIG_PREEMPT_COUNT
      scripts/config --enable CONFIG_PREEMPTION
      scripts/config --enable CONFIG_PREEMPT_DYNAMIC
      echo "Enable NTFS3"
      scripts/config --module CONFIG_NTFS_FS
      scripts/config --enable CONFIG_NTFS_RW
      scripts/config --enable CONFIG_NTFS_DEBUG
      scripts/config --module CONFIG_NTFS3_FS
      scripts/config --enable CONFIG_NTFS3_64BIT_CLUSTER
      scripts/config --enable CONFIG_NTFS3_LZX_XPRESS
      scripts/config --enable CONFIG_NTFS3_FS_POSIX_ACL
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
      echo "Enable VHBA-Module"
      scripts/config --module CONFIG_VHBA
      # General Setup
  scripts/config --disable CONFIG_BSD_PROCESS_ACCT
  scripts/config --disable CONFIG_TASK_XACCT
  scripts/config --enable CONFIG_PSI
  scripts/config --disable CONFIG_MEMCG
  scripts/config --enable CONFIG_CGROUP_CPUACCT
  scripts/config --disable CONFIG_CGROUP_DEBUG
  scripts/config --disable CONFIG_CHECKPOINT_RESTORE
  scripts/config --disable CONFIG_SLAB_MERGE_DEFAULT
  scripts/config --disable CONFIG_SLAB_FREELIST_HARDENED
  scripts/config --disable CONFIG_SLUB_CPU_PARTIAL
  scripts/config --disable CONFIG_PROFILING

  # Processor type and features
  scripts/config --disable CONFIG_X86_5LEVEL
  scripts/config --disable CONFIG_KEXEC
  scripts/config --disable CONFIG_KEXEC_FILE
  scripts/config --disable CONFIG_CRASH_DUMPs
  scripts/config --disable CONFIG_KPROBES
  # Kernel hacking
  scripts/config --disable CONFIG_FTRACE
  scripts/config --disable CONFIG_DEBUG_KERNEL
  scripts/config --disable CONFIG_PAGE_EXTENSION
  scripts/config --set-val CONFIG_RCU_CPU_STALL_TIMEOUT 4
  scripts/config --disable CONFIG_PRINTK_TIME
  scripts/config --disable CONFIG_DEBUG_INFO
  scripts/config --disable CONFIG_ENABLE_MUST_CHECK
  scripts/config --disable CONFIG_STRIP_ASM_SYMS
  scripts/config --disable CONFIG_UNUSED_SYMBOLS
  scripts/config --disable CONFIG_DEBUG_FS
  scripts/config --disable CONFIG_OPTIMIZE_INLINING
  scripts/config --disable CONFIG_DEBUG_SECTION_MISMATCH
  scripts/config --disable CONFIG_SECTION_MISMATCH_WARN_ONLY
  scripts/config --disable CONFIG_STACK_VALIDATION
  scripts/config --disable CONFIG_DEBUG_FORCE_WEAK_PER_CPU
  scripts/config --disable CONFIG_MAGIC_SYSRQ
  scripts/config --disable CONFIG_MAGIC_SYSRQ_SERIAL
  scripts/config --disable CONFIG_PAGE_EXTENSION
  scripts/config --disable CONFIG_DEBUG_PAGEALLOC
  scripts/config --disable CONFIG_PAGE_OWNER
  scripts/config --disable CONFIG_DEBUG_MEMORY_INIT
  scripts/config --disable CONFIG_HARDLOCKUP_DETECTOR
  scripts/config --disable CONFIG_SOFTLOCKUP_DETECTOR
  scripts/config --disable CONFIG_DETECT_HUNG_TASK
  scripts/config --disable CONFIG_WQ_WATCHDOG
  scripts/config --set-val CONFIG_PANIC_TIMEOUT 10
  scripts/config --disable CONFIG_SCHEDSTATS
  scripts/config --disable CONFIG_SCHED_STACK_END_CHECK
  scripts/config --disable CONFIG_STACKTRACE
  scripts/config --disable CONFIG_DEBUG_BUGVERBOSE
  scripts/config --disable CONFIG_RCU_TRACE
  scripts/config --disable CONFIG_FAULT_INJECTION
  scripts/config --disable CONFIG_LATENCYTOP
  scripts/config --disable CONFIG_PROVIDE_OHCI1394_DMA_INIT
  scripts/config --disable RUNTIME_TESTING_MENU
  scripts/config --disable CONFIG_MEMTEST
  scripts/config --disable CONFIG_KGDB
  scripts/config --disable CONFIG_EARLY_PRINTK
  scripts/config --disable CONFIG_DOUBLEFAULT


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

  ### Optionally load needed modules for the make localmodconfig
  # See https://aur.archlinux.org/packages/modprobed-db
  if [ -n "$_localmodcfg" ]; then
      if [ -e $HOME/.config/modprobed.db ]; then
          echo "Running Steven Rostedt's make localmodconfig now"
          make LSMOD=$HOME/.config/modprobed.db localmodconfig
      else
          echo "No modprobed.db data found"
          exit
      fi
  fi


  make ${BUILD_FLAGS[*]} -s kernelrelease >version
  echo "Prepared ${pkgbase} version $(<version)"


    [[ -z "$_makenconfig" ]] || make nconfig

    ## Save configuration for later reuse
    cp -Tf ./.config "${startdir}/config-${pkgver}-${pkgrel}${pkgbase#linux}"
  }

build() {

  cd "${srcdir:?}/linux-${pkgver}" || (
    echo -e "\E[1;31mCan't cd to ${srcdir:?}/linux-${pkgver} directory! Build failed! \E[0m"
    exit 1
  )

 make ${BUILD_FLAGS[*]} all

}

package_linux-cacule-rdb-llvm() {

  pkgdesc="The ${pkgdesc} and modules"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
    'linux-firmware: firmware images needed for some devices')
  provides=(VIRTUALBOX-GUEST-MODULES WIREGUARD-MODULE)
  replaces=(virtualbox-guest-modules-arch wireguard-arch)

  cd "${srcdir:?}/linux-${pkgver}" || (
    echo -e "\E[1;31mCan't cd to ${srcdir:?}/linux-${pkgver} directory! Package linux kernel failed! \E[0m"
    exit 1
  )

  local kernver="$(<version)"
  local modulesdir="${pkgdir:?}/usr/lib/modules/$kernver"

  echo "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "${modulesdir}/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "${pkgbase}" | install -Dm644 /dev/stdin "${modulesdir}/pkgbase"

  echo "Installing modules..."
  make INSTALL_MOD_PATH="${pkgdir:?}/usr" INSTALL_MOD_STRIP=1 modules_install

  # remove build and source links
  rm "${modulesdir}/"{source,build}

}

package_linux-cacule-rdb-llvm-headers() {

  pkgdesc="Headers and scripts for building modules for the ${pkgdesc}"
  depends=("linux-cacule-rdb-llvm=${pkgver}" pahole)

  cd "${srcdir:?}/linux-${pkgver}" || (
    echo -e "\E[1;31mCan't cd to ${srcdir:?}/linux-${pkgver} directory! Package linux headers failed! \E[0m"
    exit 1
  )

  local builddir="${pkgdir:?}/usr/lib/modules/$(<version)/build"

  echo "Installing build files..."
  install -Dt "${builddir}" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "${builddir}/kernel" -m644 kernel/Makefile
  install -Dt "${builddir}/arch/x86" -m644 arch/x86/Makefile
  cp -t "${builddir}" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "${builddir}/tools/objtool" tools/objtool/objtool

  # add xfs and shmem for aufs building
  mkdir -p "${builddir}"/{fs/xfs,mm}

  echo "Installing headers..."
  cp -t "${builddir}" -a include
  cp -t "${builddir}/arch/x86" -a arch/x86/include
  install -Dt "${builddir}/arch/x86/kernel" -m644 arch/x86/kernel/asm-offsets.s

  install -Dt "${builddir}/drivers/md" -m644 drivers/md/*.h
  install -Dt "${builddir}/net/mac80211" -m644 net/mac80211/*.h

  # https://bugs.archlinux.org/task/13146
  install -Dt "${builddir}/drivers/media/i2c" -m644 drivers/media/i2c/msp3400-driver.h

  # https://bugs.archlinux.org/task/20402
  install -Dt "${builddir}/drivers/media/usb/dvb-usb" -m644 drivers/media/usb/dvb-usb/*.h
  install -Dt "${builddir}/drivers/media/dvb-frontends" -m644 drivers/media/dvb-frontends/*.h
  install -Dt "${builddir}/drivers/media/tuners" -m644 drivers/media/tuners/*.h

  # https://bugs.archlinux.org/task/71392
  install -Dt "${builddir}/drivers/iio/common/hid-sensors" -m644 drivers/iio/common/hid-sensors/*.h

  echo "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "${builddir}/{}" \;

  echo "Removing unneeded architectures..."
  local arch
  for arch in "${builddir}"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
    echo "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  echo "Removing documentation..."
  rm -r "${builddir}/Documentation"

  echo "Removing broken symlinks..."
  find -L "${builddir}" -type l -printf 'Removing %P\n' -delete

  echo "Removing loose objects..."
  find "${builddir}" -type f -name '*.o' -printf 'Removing %P\n' -delete

  echo "Stripping build tools..."
  local file
  while read -rd '' file; do
    case "$(file -bi "$file")" in
    application/x-sharedlib\;*) # Libraries (.so)
      strip -v "${STRIP_SHARED}" "$file" ;;
    application/x-archive\;*) # Libraries (.a)
      strip -v "${STRIP_STATIC}" "$file" ;;
    application/x-executable\;*) # Binaries
      strip -v "${STRIP_BINARIES}" "$file" ;;
    application/x-pie-executable\;*) # Relocatable binaries
      strip -v "${STRIP_SHARED}" "$file" ;;
    esac
  done < <(find "${builddir}" -type f -perm -u+x ! -name vmlinux -print0)

  echo "Stripping vmlinux..."
  strip -v "${STRIP_STATIC}" "${builddir}/vmlinux"

  echo "Adding symlink..."
  mkdir -p "${pkgdir:?}/usr/src"
  ln -sr "${builddir}" "${pkgdir:?}/usr/src/${pkgbase}"

}
