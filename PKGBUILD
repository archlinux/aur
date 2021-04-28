# Maintainer: ptr1337 <admin@ptr1337.dev>
# Contributor: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

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
_winesync=
### Enable protect file mappings under memory pressure
_mm_protect=y
### Set performance governor as default
_per_gov=y
### Disable Deadline I/O scheduler
_deadline_disable=y
### Disable Kyber I/O scheduler
_kyber_disable=y
### Running with a 1000 HZ, 750HZ or 500HZ tick rate
_1k_HZ_ticks=y
_750_HZ_ticks=
_500_HZ_ticks=
### Tweak kernel options prior to a build via nconfig
_makenconfig=
### Tweak kernel options prior to a build via menuconfig
_makemenuconfig=
### Tweak kernel options prior to a build via xconfig
_makexconfig=
### Tweak kernel options prior to a build via gconfig
_makegconfig=
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

pkgbase=linux-cacule-rdb
# pkgname=('linux-cacule-rdb' linux-cacule-rdb-headers)
_major=5.12
#_minor=1
#_minorc=$((_minor+1))
#_rcver=rc8
pkgver=${_major}
#_stable=${_major}.${_minor}
#_stablerc=${_major}-${_rcver}
_srcname=linux-${_major}
pkgrel=4
pkgdesc='Linux-CacULE Kernel by Hamad Marri and with some other patchsets'
arch=('x86_64')
url="https://github.com/hamadmarri/cacule-cpu-scheduler"
license=('GPL2')
options=('!strip')
makedepends=('kmod' 'bc' 'libelf' 'python-sphinx' 'python-sphinx_rtd_theme'
             'graphviz' 'imagemagick' 'pahole' 'cpio' 'perl' 'tar' 'xz')
_patchsource="https://raw.githubusercontent.com/ptr1337/linux-cacule-aur/master/patches/5.12"
source=(#"https://www.kernel.org/pub/linux/kernel/v5.x/linux-${_stablerc}.tar.xz"
        "https://git.kernel.org/torvalds/t/linux-5.12.tar.gz"
        "config"
        "${_patchsource}/arch-patches/0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch"
        "${_patchsource}/cacule-patches/cacule-5.12.patch"
        "${_patchsource}/cacule-patches/0002-cacule-Change-default-preemption-latency-to-2ms-for-.patch"
        "${_patchsource}/cpu-patches/0001-cpu-patches.patch"
        "${_patchsource}/futex-patches/0001-futex-resync-from-gitlab.collabora.com.patch"
        "${_patchsource}/futex2-patches/0001-futex2-resync-from-gitlab.collabora.com.patch"
        "${_patchsource}/bfq-patches/0001-bfq-patches.patch"
        "${_patchsource}/block-patches/0001-block-patches.patch"
        "${_patchsource}/ll-patches/0001-LL-kconfig-add-750Hz-timer-interrupt-kernel-config-o.patch"
        "${_patchsource}/ll-patches/0005-Disable-CPU_FREQ_GOV_SCHEDUTIL.patch"
        "${_patchsource}/fixes-miscellaneous/0001-fixes-miscellaneous.patch"
        "${_patchsource}/bbr2-patches-v2/0001-bbr2-5.12-introduce-BBRv2.patch"
        "${_patchsource}/btrfs-patches/0001-btrfs-patches.patch"
        "${_patchsource}/android-patches/0001-android-export-symbold-and-enable-building-ashmem-an.patch"
        "${_patchsource}/pf-patches/0001-genirq-i2c-Provide-and-use-generic_dispatch_irq.patch"
        "${_patchsource}/mm-patches/0001-mm-5.12-protect-file-mappings-under-memory-pressure.patch"
        "${_patchsource}/zstd-upstream-patches-v2/0001-zstd-upstream-patches.patch"
        "${_patchsource}/zstd-ll-patches/0001-zstd-patches.patch"
        "${_patchsource}/clearlinux-patches/0001-clearlinux-patches.patch"
        "${_patchsource}/initramfs-patches/0001-initramfs-patches.patch")

sha512sums=('c2f3510ea7feb8d334592a00b0ff74ad7821b1d4a38a6025c5c30e8f565fbb7ec4cd653ec5629d12f22a13c1235635addf28172354388c1dc8291517ca2ece69'
            '1ab27f634f844a096c1c6572349581495fa76555888100028a694abfe5529900ed4ba748be2452f1fcdf97c1fbbf25cd2cb3b8f2e00dff83cb86632988926bd9'
            '88f9f1e6ea206068fd029566e4610c16b7c3007f10363c7db37cd922fe75646437d2e4814317bc292d06eff7e9ebd29d8cd1ee82c8abf45ddd1843c1ff55f5c7'
            '01a59958b88f4f0fae72943883937bccb5be2a1ceeac9ba8a689c4b47125edcd3360aa6a94a535b6dae24ea8b1ac52002431ad72b2a623373c905901af2b3609'
            'bafda1ec6114a360bed8a9f8ae6b1e8dc5c22adf15f7545c3455a090f14b491639707f6624d7a891ec66b459842e61df9d62274b070b7a611f0bdbd367219ae5'
            '15933126feeb56ccc6ace70db9fa7afb64d148900e41a780e42e03ce09faf7bab12413f526675b918aeff55e91dc038ad58884bb7add4a45962aca79d576cb93'
            '449570b8b9a04391cc2cc171cc806b3a132c6e969c7cedf9c4925d24244888e6f2e5afb6c551521fe62fcb7e2bf08cb8d396f9ec785ecfcdd5ea27dd9ffed4ea'
            '898c02e531dec8be746bec715127e9827bd8b1a181cc24489a1969a75c974b8b7ca3db6bfc5544f808404938e348fc70581dffdfb0b83ef5d1430f819ea3a63d'
            '86da27380a3a8d17b5b6705cab3e0e0258a241fc5e9f07d403e3da13346fb9c426b85243125b94e9d0880fbd29c81451753e977b3b42e5cdf63acedb91c61010'
            'daeec34905469d8e3a10eca2bf71e3875423fc72a92ff62bff74aef8f0af90cfc3282d5c67483379feb33b1c518287b6165b5fe42f9a8bcbc6dd3dbfcde38121'
            '58bdb0b745c8b52cd65e48af41764d4b5c54f054878e3fe9c83d4580fd94e190693c77a2b76990db79ef68e441c21cbd6f475137823c6e02b38e7c38602b7934'
            '47f265716ebd268e4296aaba1efe5098df00736b69ec7d0413cace6dbb5cb162c1c952f7527a2a41b246ed76e6e112514c5349e8dc52f4609def30257e18d7aa'
            '5081a6a3a3db160ef0a23acd0c0db403cc4b3eb2dfd280b1b7ba2ae907d362e4d6a653d546523c870af07009c62f58eec26e7b8174a3f4fcbaa32808d965ad73'
            '28446f518e88ab934330111a01019cb164bfdd21094c69e96cc16c7931440d069ef997ae141154c97c80fcb727e8c4d940b8bf63554e3f4179652523e285c5b4'
            'c9d7d9fc00e46fefd9c947fd75e344ba314f97a764f9e2356817323a7d76efc632e0aac0b62a5f393540d8a0de42209878055a6a3581ca926df3982f2657723c'
            '1b3b48246fe70e8ca7390cacacf560696c1d98604a7716ac32df8f3d7fc7cc2ab733ab24e372fffa63016344f2e4ed078f7d597c3c1261f0ca3ff1c87a13dcb9'
            '800ce2518d4ff38c2d40399a5b104bb4552ba81c67398cc301adcb1f80035c2531a188f42eb20526f5384028fa0e39578b4b36ebfb9a8c0d70fb0283577f6faf'
            '0563235769866375905d9bf6c33acae6aaff7b39351b4c9693f0f7dc7fef45d5850f267519a2ab8cc05ce60899f41080f071f00a417cf09d3985d89407a40f86'
            '07f68347a31b6c65f7a9dcd3d0940da26ee79fd922799ca64b8d6888087dec25bb2776c9a995c9865652c68c1b25bfccdc7298b0a8599f4f0cac7d26acea31a0'
            'e9a405643af07f8065c53c24b7ffce89d65716a6c009984c6fcd26fecf345a3a38c2ab0e58a0fac0f48ec9ea6a9cf74e06c04631ea4fcaaae4a4e7c51447a0d6'
            'a441e14f4fa25e771d51e2d0e5cb626a8eddc4dfd0e9e91c6585b35cdf4e238bc56c76ad81aa269f25067cb60eeb6f9d431b710d6f40349867cbae73b434b3bd'
            '21a613ef65497ecf66daf31b43e02022c71195b48082ae7628a9d2ba8619819f69a6702c4c87e39e8718074c7ebfd674694a29a962049a16d47f1e5f748c78c3')

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

    ### Optionally set tickrate to 1000
	if [ -n "$_1k_HZ_ticks" ]; then
		echo "Setting tick rate to 1k..."
                scripts/config --disable CONFIG_HZ_300
                scripts/config --enable CONFIG_HZ_1000
                scripts/config --set-val CONFIG_HZ 1000
	fi

  ### Optionally set tickrate to 750HZ
  if [ -n "$_750_HZ_ticks" ]; then
    echo "Setting tick rate to 1k..."
                scripts/config --disable CONFIG_HZ_300
                scripts/config --enable CONFIG_HZ_750
                scripts/config --set-val CONFIG_HZ 750
  fi

  ### Optionally set tickrate to 500HZ
  if [ -n "$_500_HZ_ticks" ]; then
    echo "Setting tick rate to 1k..."
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

        ### Enable protect file mappings under memory pressure
    	if [ -n "$_mm_protect" ]; then
    		echo "Enabling protect file mappings under memory pressure..."
    		scripts/config --enable CONFIG_UNEVICTABLE_FILE
    		scripts/config --set-val CONFIG_UNEVICTABLE_FILE_KBYTES_LOW 262144
    		scripts/config --set-val CONFIG_UNEVICTABLE_FILE_KBYTES_MIN 131072
    	fi

      ### Set performance governor
          if [ -n "$_per_gov" ]; then
  		echo "Setting performance governor..."
  		scripts/config --disable CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL
  		scripts/config --enable CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE
  		echo "Disabling uneeded governors..."
  		scripts/config --disable CONFIG_CPU_FREQ_GOV_ONDEMAND
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

        echo "Set module compression to ZSTD"
        scripts/config --enable CONFIG_MODULE_COMPRESS
        scripts/config --disable CONFIG_MODULE_COMPRESS_XZ
        scripts/config --enable CONFIG_MODULE_COMPRESS_ZSTD
        scripts/config --set-val CONFIG_MODULE_COMPRESS_ZSTD_LEVEL 19
        scripts/config --disable CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE
    	scripts/config --enable CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3

        echo "Enable CacULE CPU scheduler..."
        scripts/config --enable CONFIG_CACULE_SCHED
        scripts/config --enable CONFIG_CACULE_RDB
        #scripts/config --enable CONFIG_FAIR_GROUP_SCHED
        #scripts/config --disable CONFIG_SCHED_AUTOGROUP
        #scripts/config --set-val CONFIG_NR_CPUS "12"
        scripts/config --disable CONFIG_SCHED_DEBUG
        scripts/config --disable CONFIG_SCHED_INFO
        scripts/config --disable CONFIG_SCHEDSTATS
        scripts/config --disable CONFIG_DEBUG_KERNEL
        scripts/config --disable CONFIG_EXPERT
        echo "Enable PREEMPT"
        scripts/config --disable CONFIG_PREEMPT_NONE
        scripts/config --disable CONFIG_PREEMPT_VOLUNTARY
        scripts/config --enable CONFIG_PREEMPT
        scripts/config --enable CONFIG_PREEMPT_COUNT
        scripts/config --enable CONFIG_PREEMPTION




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

    ### Running make nconfig
	[[ -z "$_makenconfig" ]] ||  make nconfig

    ### Running make menuconfig
	[[ -z "$_makemenuconfig" ]] || make menuconfig

    ### Running make xconfig
	[[ -z "$_makexconfig" ]] || make xconfig

    ### Running make gconfig
	[[ -z "$_makegconfig" ]] || make gconfig

    ### Save configuration for later reuse
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
    depends=('linux-cacule-rdb' 'pahole')

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
