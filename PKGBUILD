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
_NUMAdisable=
# Enable fsync
_fsync=y
#enable futex2
_futex2=
#enable winesync
_winesync=
### Set performance governor as default
_per_gov=
### Disable Deadline I/O scheduler
_deadline_disable=
### Disable Kyber I/O scheduler
_kyber_disable=
### Running with a 2000 HZ, 1000HZ or 500HZ tick rate
_2k_HZ_ticks=
_1k_HZ_ticks=
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

pkgbase=linux-cacule-rc
# pkgname=('linux-cacule' linux-cacule-headers)
_major=5.14
#_minor=1
#_minorc=$((_minor+1))
_rcver=rc5
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
_caculepatches="https://raw.githubusercontent.com/ptr1337/linux-cacule-aur/master/patches/CacULE"
_patchsource="https://raw.githubusercontent.com/ptr1337/linux-cacule-aur/master/patches/5.14"
source=("https://git.kernel.org/torvalds/t/linux-${_stablerc}.tar.gz"
        "config"
    #    "${_patchsource}/arch-patches-v3/0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch"
        "${_caculepatches}/v5.14/cacule-5.14.patch"
      #  "${_patchsource}/misc/0003-clang.patch"
        "${_patchsource}/bbr2-5.14.patch"
        "${_patchsource}/lrng-5.14.patch"
        "${_patchsource}/misc/0004-folio-mm.patch"
        "${_patchsource}/misc/0007-string.patch"
        "${_patchsource}/cpu-5.14.patch"
       # "${_patchsource}/misc-5.14.patch"
        "${_patchsource}/zstd-5.14.patch"
#        "${_patchsource}/lrng/1004-dev-random-new-lrng-approach-v40.patch"
   #     "${_patchsource}/cpu-patches-v2/0001-cpu-patches.patch"
      #  "${_patchsource}/futex-patches/0001-futex-resync-from-gitlab.collabora.com.patch"
      #  "${_patchsource}/futex2-stable-patches-v3/0001-futex2-resync-from-gitlab.collabora.com.patch"
       # "${_patchsource}/wine-esync-patches/0001-v5.12-winesync.patch"
       # "${_patchsource}/zen-patches-v2/0001-zen-patches.patch"
       # "${_patchsource}/lqx-patches-v2/0001-lqx-patches.patch"
      #  "${_patchsource}/bfq-patches-v8/0001-bfq-patches.patch"
  #  "${_patchsource}/fixes-miscellaneous/0001-fixes-miscellaneous.patch"
    #    "${_patchsource}/bbr2-patches-v2/0001-bbr2-5.12-introduce-BBRv2.patch"
      #  "${_patchsource}/btrfs-patches-v8/0001-btrfs-patches.patch"
       # "${_patchsource}/android-patches/0001-android-export-symbold-and-enable-building-ashmem-an.patch"
       # "${_patchsource}/pf-patches-v2/0001-pf-patches.patch"
       # "${_patchsource}/ntfs3-patches-v2/0001-ntfs3-patches.patch"
      #  "${_patchsource}/zstd-dev-patches-v3/0001-zstd-dev-patches.patch"
      #  "${_patchsource}/clearlinux-patches-v3/0001-clearlinux-patches.patch"
      #  "${_patchsource}/initramfs-patches/0001-initramfs-patches.patch"
      )

sha512sums=('612ed50eeed5fc2a96943b0d957ab8262e4e41dc155e6521310f754c4fd2b494265db5d0f49c3f0d24ff4e7bb76c4ec02d599f5b17695777ac12007e44fbffa5'
            'b4fcfc2d6a95f8ed1ab8bf8647b67d33cc5aa6440074f859613603968d4b66f5b311c4b8804dfddbe8e3d42fe123c54ec0a45d9636b8070b8a0f8850502b19ab'
            '38b0fd8b67d577cadc6afbaf545752eb7a38779f29f5a465035183a3e2f6112244b5b38f15801f819b7672ab8645c0d7ec14694ad7bf44aaec02c4c53f811798'
            '7f46e2c51d2f694ca851ef0f88c824e69425015deade8167ddf4694610b614ebd74784892c596105dad7cc422c35637b85f8eeff0855a1c619dc31bc6e5fb5f8'
            '424da49dbb06288a73bf737b68e281575ef3cc1090dc26ecf9fcd0531b2aad28bdee871dcc893e35b6c4372cc5571504134626f86bcb5197d32361e7955002fe'
            '0dd6130aee07532e2318421c85a68be5aa97f94445f94480a133cd788906912314944881ad39f994f48ffe9ec65cd35bc584adb5b33f9b5acc801ebc04e5fe24'
            'ed2e61717b37570c7f058915b8ee2f6515ec3b22884be4646f3bcf2d5b48f17b57be93cfc63970f6988fc70e6e236b574b30c5ce09f54a56b601827cc1793299'
            'b928e2233fab6aa7919b95ca7c35442dc8e48998f1ef195f24b5ee13f8d275397ddfacb9275031553512273f8045c6a2c8df10b48a5d408f945bd2dd6d677b30'
            '9d19321f93637094bdbaaa91b9a8acb216a4f0e9b2a106c46782b1f2e57c7da98a74fe5fa840f1fd700aa1de831aa71615f5a48b43de70d63d1b9df813916cee')
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
        make ${BUILD_FLAGS[*]} olddefconfig

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

  make ${BUILD_FLAGS[*]} all
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
    depends=('linux-cacule-rc' 'pahole')

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
