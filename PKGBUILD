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

_fsync=y

_futex2=y

_winesync=y
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

### IMPORTANT: Do no edit below this line unless you know what you're doing

pkgbase=linux-cacule-rdb
# pkgname=('linux-cacule' linux-cacule-headers)
_major=5.11
_minor=15
#_minorc=$((_minor+1))
#_rcver=rc7
pkgver=${_major}.${_minor}
_stable=${_major}.${_minor}
#_stablerc=${_major}-${_rcver}
_srcname=linux-${_stable}
pkgrel=9
pkgdesc='Linux-CacULE-RDB Kernel by Hamad Marri and with some other patchsets'
arch=('x86_64')
url="https://github.com/hamadmarri/cacule-cpu-scheduler"
license=('GPL2')
options=('!strip')
makedepends=('kmod' 'bc' 'libelf' 'python-sphinx' 'python-sphinx_rtd_theme'
             'graphviz' 'imagemagick' 'pahole' 'cpio' 'perl' 'tar' 'xz')
_patchsource="https://raw.githubusercontent.com/ptr1337/kernel-patches/main/5.11"
source=("https://www.kernel.org/pub/linux/kernel/v5.x/linux-$pkgver.tar.xz"
        "config"
        "${_patchsource}/cacule-patches/cacule-5.11.patch"
        "${_patchsource}/cacule-patches/0002-cacule-Change-default-preemption-latency-to-2ms-for-.patch"
        "${_patchsource}/cpu-patches/0001-cpu-5.11-merge-graysky-s-patchset.patch"
        "${_patchsource}/misc/0005-Disable-CPU_FREQ_GOV_SCHEDUTIL.patch"
        "${_patchsource}/futex-patches/0001-futex2-resync-from-gitlab.collabora.com.patch"
        "${_patchsource}/wine-patches/0007-v5.11-winesync.patch"
        "${_patchsource}/futex-patches/0007-v5.11-fsync.patch"
        "${_patchsource}/misc/0002-init-Kconfig-enable-O3-for-all-arches.patch"
        "${_patchsource}/misc/0001-LL-kconfig-add-750Hz-timer-interrupt-kernel-config-o.patch"
        "${_patchsource}/bbr2-patches/0001-bbr2-5.11-introduce-BBRv2.patch"
        "${_patchsource}/lqx-patches/0001-lqx-patches.patch"
        "${_patchsource}/xanmod-patches/0001-xanmod-patches.patch"
        "${_patchsource}/mm-patches/0001-mm-patches.patch"
        "${_patchsource}/zstd-patches/0001-zstd-patches.patch"
        "${_patchsource}/zstd-patches/0001-zstd-dev-patches.patch"
        "${_patchsource}/zswap-patches/0001-zswap-patches.patch"
        "${_patchsource}/clearlinux-patches/0001-clearlinux-patches.patch")

sha256sums=('d6a7845357cf56b695e50b4c60e09a8832b651ac701062a76145550a8e77c44a'
            '2e3b1f1b6ceb958a3e4b2a4740c77953287a2cdb156234af8c9bf9ddad9268e3'
            'c539655de9eef5084b6349389b1a2fac3aaab274149c9b95667cca93570166ea'
            'cf00507d6881b737a9814d152e27b1db02f45a4d8a8ba3f4c9f542f0964ac697'
            'b74526f681f3eafa12f74764e79792949cb949fe1c8424118746c48fe16a09a8'
            '39a36b356e2452aa244f80700524c73884f995bd29ccabd3bdb760480f37ce8e'
            '05cebcd1dbab8d5f8d26b5351ba0237d36b8e848c830dad7a4f7d1c58cc7824c'
            'd220593436059b76c975ceee061fd124dec37fff774db45a4419c2ce1839c351'
            'b302ba6c5bbe8ed19b20207505d513208fae1e678cf4d8e7ac0b154e5fe3f456'
            '15524321f6e532747be4145341dd6d426a4240bf190e85160bdf06ae6ea0ff20'
            'bc35b9f8f695d3f0ef88ba1a5abad8c881c8ad1eda681dd139d887df6f7a9849'
            '68dcadab17c405335633e0ded03d13a78ee524311bc927df2a0f0fc1a1463caf'
            'b268f8f50734239fee6910d8d7cfa5742e9f17cbd9e90f258139a5df44fed407'
            'a571b8db83f36d36222b3b11ed607fc93728a351782edbe1129b623c236f050e'
            'f797fb4fd2ac4c1116e988e9ccf8bf1b4d9ba53511c388b958f17888d33cf994'
            '3fe144975c1b30b983fca9e34ba58e7b4704456a340130584a1aca0feabdc22e'
            'ba228b7688cb3c8be9312edadf1f9067e91ce8f303941b3b921a748e3cf974d2'
            '251327be9627d8039e8c344d1beca19982676ba1eadc1b97251531fbd7611108'
            '3547dd94fceb67dbf7d013310ce2732944a2d02d82759c8b3c23f37b1bd5252b')

export KBUILD_BUILD_HOST=${KBUILD_BUILD_HOST:-archlinux}
export KBUILD_BUILD_USER=${KBUILD_BUILD_USER:-makepkg}
export KBUILD_BUILD_TIMESTAMP=${KBUILD_BUILD_TIMESTAMP:-$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})}

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

  source "${startdir}"/cacule_config

  configure

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
