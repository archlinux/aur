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

pkgbase=linux-cacule-rdb-rc
# pkgname=('linux-cacule' linux-cacule-headers)
_major=5.12
#_minor=1
#_minorc=$((_minor+1))
_rcver=rc8
pkgver=${_major}.${_rcver}
#_stable=${_major}.${_minor}
_stablerc=${_major}-${_rcver}
_srcname=linux-${_stablerc}
pkgrel=2
pkgdesc='Linux-CacULE-RDB Kernel by Hamad Marri and with some other patchsets'
arch=('x86_64')
url="https://github.com/hamadmarri/cacule-cpu-scheduler"
license=('GPL2')
options=('!strip')
makedepends=('kmod' 'bc' 'libelf' 'python-sphinx' 'python-sphinx_rtd_theme'
             'graphviz' 'imagemagick' 'pahole' 'cpio' 'perl' 'tar' 'xz')
_patchsource="https://raw.githubusercontent.com/ptr1337/kernel-patches/main/5.12-rc"
source=(#"https://www.kernel.org/pub/linux/kernel/v5.x/linux-${_stablerc}.tar.xz"
        "https://git.kernel.org/torvalds/t/linux-5.12-rc8.tar.gz"
        "config"
        "${_patchsource}/cacule-patches/cacule-5.12.patch"
        "${_patchsource}/cacule-patches/0002-cacule-Change-default-preemption-latency-to-2ms-for-.patch"
        "${_patchsource}/cpu-patches/0001-cpu-patches.patch"
        "${_patchsource}/ll-patches/0005-Disable-CPU_FREQ_GOV_SCHEDUTIL.patch"
        "${_patchsource}/futex2-patches/0001-futex2-resync-from-gitlab.collabora.com.patch"
        "${_patchsource}/bfq-patches/0001-bfq-patches.patch"
        "${_patchsource}/block-patches/0001-block-patches.patch"
        "${_patchsource}/fixes-miscellaneous/0001-fixes-miscellaneous.patch"
        "${_patchsource}/futex-patches/0001-futex-resync-from-gitlab.collabora.com.patch"
        "${_patchsource}/ll-patches/0001-LL-kconfig-add-750Hz-timer-interrupt-kernel-config-o.patch"
        "${_patchsource}/bbr2-patches/0001-bbr2-5.12-introduce-BBRv2.patch"
        "${_patchsource}/lqx-patches-v2/0001-lqx-patches.patch"
        "${_patchsource}/pf-patches/0001-genirq-i2c-Provide-and-use-generic_dispatch_irq.patch"
        "${_patchsource}/mm-patches/0001-mm-5.12-protect-file-mappings-under-memory-pressure.patch"
        "${_patchsource}/zstd-patches/0001-zstd-patches.patch"
        "${_patchsource}/zstd-dev-patches/0001-zstd-dev-patches.patch"
        "${_patchsource}/clearlinux-patches/0001-clearlinux-patches.patch"
        "${_patchsource}/initramfs-patches/0001-initramfs-patches.patch")

sha512sums=('a9d1da6a1bb5a2ef4c8dbd58089b8f6f3e8de61cf725434785f35821bd3f433c29019b9e0245a990c8ea035c0e8b60645b42bdf2f3b2eed3974284c8daee4d1e'
            'ab1954ccaab6d77d34b6e1b2ba9ce5dfb2ab4eae5777e071dddbd41dacdbb67e786fd210a96089f6166cae373cabaf22be89c40fea70b3b1cee4960bd5ba1ad1'
            '01a59958b88f4f0fae72943883937bccb5be2a1ceeac9ba8a689c4b47125edcd3360aa6a94a535b6dae24ea8b1ac52002431ad72b2a623373c905901af2b3609'
            'bafda1ec6114a360bed8a9f8ae6b1e8dc5c22adf15f7545c3455a090f14b491639707f6624d7a891ec66b459842e61df9d62274b070b7a611f0bdbd367219ae5'
            'f475db6e28a33cca3fde7409eb010c3472007443e62a889dd301db48516015d9f3f3d965856faa824512786255ca1236bd06bb918bac76f921ba7e1766838451'
            '8a5e530dd90ac257e1db0495db0cabd303939851c18dd5b2fd1a1e6d5eba336720cf0f2a260baaac906dead1f61989a4bd592eed632a2f5e10c00c6702f0fe58'
            '9bdc6e95c683ec0a93777234f327b8f15c6e8ba8e061ac5314d6ca875a0515d39daddce6d548a64e24052c3dfb6322ada23620c0a351fe1c7b5dd26f647a10fb'
            '0d79826b79f791af185d723af8c18cc58e7092968dadac5e304ecdd40683972fd1b9c9130765d7852fb0c9ff10cd53535196b6310d25226bde5fb5ec437bbc3b'
            '77ed5c037fd27489415f228219e3b291c655c8ba49745b04c554739ffbc40df685cca8bb5e9a12e6eda083b7f7ef74d1a3307ecc4180bec0ba422d957e10baad'
            '370014469fd04db4f00eefa1b9e415458131fdd3f8915b169cba4207a79ed20631e9e5d54f103adba64e0b932b9b34bfc825cc72cde76becddc4a8dbac772380'
            'e6c765a12435e974f2490971178b22c8b28be24613647f8ebae408c7a7a042c7a22ee5dc4fc0344fce88b2d158a5e8e37c4939a2f605e712fa1fd6ba74f66833'
            '782e98da0d0082c2c99de7c8ef5454e9a1d8e155b0c620b7a8d3ea4f9694035b475abb969fcdaf446edb2b61a6536be98f2dbde15f7d60f52bbf117222a42707'
            '094eb59f297cc8bea3f8f7373269a3753d2fbf2b43daa4a20483513349dae0547a3b5eb72d32d8ab81e459baa29382dd9edfdaad487786522050568b75bd7fd7'
            'd0463bca298b27c844efed93685c32e43d153ad46bde63180e8075246549083b83d6c81c79c217453ad000834e56aa471fbbf9cb92ecca6b988730ce173d3ec9'
            '91f858ea5e7d8257392ffe5bb6e2433ed22f715767f412b2f73bf18569e2b4c8336e4406ac816f0c2eb306bf4014782a2a60760a87e9ad7fd325d57b49245220'
            '8e962879988445ce30f47a587903f33b878206f0f0cb727c2f1610b5fa3832004f2438a28356c768a8b417638db0f394fb85352e38e7e8bbc74dd1b8f69fbd1f'
            '4ea5e17df4cb11ace456be0244768206a645e40427ea1730d61d263b0f84d86f889d1b4396d568341c0329492ce93fcffa2511f1aed280b99305440f767189da'
            '5c3ce23c42e76237a5e218b545187d91cbed46e24be8f5220802b49c3042d2c385442acbd52ecd42fb956e7edca8ecd53f3366eb33dcca5af1b7b55d60c6abec'
            'ff837a7a966bb6a5cc31fc12866c3e7d9b8b66b6d1082b59a6cb18ec7081999516157599160754dcd9435cc7925e099ad9011096792531aab641c029dfc08ced'
            'd1272b76986cd760ffbe1fc2f90897546ef65987702dfc8f15d97ea2135c3a599b9fc7e5ed607d10dc6154acbc4b6b0ab14b56ebf51ceb1af7003163b73e71d7')

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
