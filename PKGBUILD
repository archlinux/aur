# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

### BUILD OPTIONS
# Set these variables to ANYTHING that is not null to enable them

### Tweak kernel options prior to a build via nconfig
_makenconfig=

### Tweak kernel options prior to a build via menuconfig
_makemenuconfig=

### Tweak kernel options prior to a build via xconfig
_makexconfig=

### Tweak kernel options prior to a build via gconfig
_makegconfig=

### Running with a 1000 HZ tick rate
_1k_HZ_ticks=y

# NUMA is optimized for multi-socket motherboards.
# A single multi-core CPU actually runs slower with NUMA enabled.
# See, https://bugs.archlinux.org/task/31187
_NUMAdisable=y

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

pkgbase=linux-rt-bfq
# pkgname=('linux-rt-bfq' 'linux-rt-bfq-headers' 'linux-rt-bfq-docs')
_major=5.4
_minor=5
_rtver=3
_rtpatchver=rt${_rtver}
pkgver=${_major}.${_minor}.${_rtpatchver}
_pkgver=${_major}.${_minor}
_srcname=linux-${_pkgver}
pkgrel=4
pkgdesc='Linux RT-BFQ-dev'
arch=('x86_64')
url="https://github.com/sirlucjan/bfq-mq-lucjan"
license=('GPL2')
options=('!strip')
makedepends=('kmod' 'bc' 'libelf' 'python-sphinx' 'python-sphinx_rtd_theme'
             'graphviz' 'imagemagick')
#_lucjanpath="https://raw.githubusercontent.com/sirlucjan/kernel-patches/master/${_major}"
_lucjanpath="https://gitlab.com/sirlucjan/kernel-patches/raw/master/${_major}"
_bfq_path="bfq-dev-lucjan"
_bfq_ver="v11"
_bfq_rel="r2K191206"
_bfq_patch="${_major}-${_bfq_path}-${_bfq_ver}-${_bfq_rel}.patch"
_gcc_path="https://raw.githubusercontent.com/graysky2/kernel_gcc_patch/master"
_gcc_patch="enable_additional_cpu_optimizations_for_gcc_v9.1+_kernel_v4.13+.patch"

source=("https://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.xz"
        "https://www.kernel.org/pub/linux/kernel/v5.x/${_srcname}.tar.sign"
        "http://www.kernel.org/pub/linux/kernel/projects/rt/${_major}/patch-${_pkgver}-${_rtpatchver}.patch.xz"
        "http://www.kernel.org/pub/linux/kernel/projects/rt/${_major}/patch-${_pkgver}-${_rtpatchver}.patch.sign"
        "${_lucjanpath}/${_bfq_path}/${_bfq_patch}"
        "${_gcc_path}/${_gcc_patch}"
        "${_lucjanpath}/arch-patches-rt-sep/0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch"
        "${_lucjanpath}/arch-patches-rt-sep/0002-lib-devres-add-a-helper-function-for-ioremap_uc.patch"
        "${_lucjanpath}/arch-patches-rt-sep/0003-mfd-intel-lpss-Use-devm_ioremap_uc-for-MMIO.patch"
        "${_lucjanpath}/arch-patches-rt-sep/0004-PCI-pciehp-Do-not-disable-interrupt-twice-on-suspend.patch"
        "${_lucjanpath}/arch-patches-rt-sep/0005-PCI-pciehp-Prevent-deadlock-on-disconnect.patch"
        "${_lucjanpath}/arch-patches-rt-sep/0006-ACPI-PM-s2idle-Rework-ACPI-events-synchronization.patch"
        "${_lucjanpath}/arch-patches-rt-sep/0007-x86-MCE-AMD-Do-not-use-rdmsr_safe_on_cpu-in-smca_con.patch"
        "${_lucjanpath}/arch-patches-rt-sep/0008-x86-MCE-AMD-Allow-Reserved-types-to-be-overwritten-i.patch"
        "${_lucjanpath}/arch-patches-rt-sep/0009-x86-mce-Fix-possibly-incorrect-severity-calculation-.patch"
        "${_lucjanpath}/arch-patches-rt-sep/0010-Revert-iwlwifi-assign-directly-to-iwl_trans-cfg-in-Q.patch"
        "${_lucjanpath}/arch-patches-rt-sep/0011-iwlwifi-pcie-move-power-gating-workaround-earlier-in.patch"
        "${_lucjanpath}/arch-patches-rt-sep/0012-x86-intel-Disable-HPET-on-Intel-Coffee-Lake-H-platfo.patch"
        "${_lucjanpath}/arch-patches-rt-sep/0013-x86-intel-Disable-HPET-on-Intel-Ice-Lake-platforms.patch"
        "${_lucjanpath}/arch-patches-rt-sep/0014-drm-i915-save-AUD_FREQ_CNTRL-state-at-audio-domain-s.patch"
        "${_lucjanpath}/arch-patches-rt-sep/0015-drm-i915-Fix-audio-power-up-sequence-for-gen10-displ.patch"
        "${_lucjanpath}/arch-patches-rt-sep/0016-drm-i915-extend-audio-CDCLK-2-BCLK-constraint-to-mor.patch"
        "${_lucjanpath}/arch-patches-rt-sep/0017-ASoC-SOF-enable-sync_write-in-hdac_bus.patch"
        "${_lucjanpath}/arch-patches-rt-sep/0018-xhci-pci-Allow-host-runtime-PM-as-default-also-for-I.patch"
        "${_lucjanpath}/arch-patches-rt-sep/0019-iwlwifi-pcie-restore-support-for-Killer-Qu-C0-NICs.patch"
        "${_lucjanpath}/arch-patches-rt-sep/0020-drm-i915-gt-Detect-if-we-miss-WaIdleLiteRestore.patch"
        "${_lucjanpath}/arch-patches-rt-sep/0021-pinctrl-sunrisepoint-Add-missing-Interrupt-Status-re.patch"
        "${_lucjanpath}/arch-patches-rt-sep/0022-Revert-iwlwifi-mvm-fix-scan-config-command-size.patch"
        "${_lucjanpath}/arch-patches-rt-sep/0023-e1000e-Revert-e1000e-Make-watchdog-use-delayed-work.patch"
         # the main kernel config files
        'config')

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
    cd $_srcname

    ### Add rt patch
        msg2 "Add rt patch"
        patch -Np1 -i ../patch-${_pkgver}-${_rtpatchver}.patch

    ### Setting version
        msg2 "Setting version..."
        scripts/setlocalversion --save-scmversion
        echo "-$pkgrel" > localversion.10-pkgrel
        echo "${pkgbase#linux}" > localversion.20-pkgname

    ### Patching sources
        local src
        for src in "${source[@]}"; do
            src="${src%%::*}"
            src="${src##*/}"
            [[ $src = *.patch ]] || continue
        msg2 "Applying patch $src..."
        patch -Np1 < "../$src"
        done

    ### Setting config
        msg2 "Setting config..."
        cp ../config .config
        make olddefconfig

    ### Prepared version
        make -s kernelrelease > version
        msg2 "Prepared %s version %s" "$pkgbase" "$(<version)"

    ### Optionally use running kernel's config
	# code originally by nous; http://aur.archlinux.org/packages.php?ID=40191
	if [ -n "$_use_current" ]; then
		if [[ -s /proc/config.gz ]]; then
			msg2 "Extracting config from /proc/config.gz..."
			# modprobe configs
			zcat /proc/config.gz > ./.config
		else
			warning "Your kernel was not compiled with IKCONFIG_PROC!"
			warning "You cannot read the current config!"
			warning "Aborting!"
			exit
		fi
	fi

    ### Optionally set tickrate to 1000
	if [ -n "$_1k_HZ_ticks" ]; then
		msg2 "Setting tick rate to 1k..."
		sed -i -e 's/^CONFIG_HZ_300=y/# CONFIG_HZ_300 is not set/' \
                    -i -e 's/^# CONFIG_HZ_1000 is not set/CONFIG_HZ_1000=y/' \
                    -i -e 's/^CONFIG_HZ=300/CONFIG_HZ=1000/' ./.config
	fi
	
    ### Optionally disable NUMA for 64-bit kernels only
        # (x86 kernels do not support NUMA)
        if [ -n "$_NUMAdisable" ]; then
            msg2 "Disabling NUMA from kernel config..."
            sed -i -e 's/CONFIG_NUMA=y/# CONFIG_NUMA is not set/' \
                -i -e '/CONFIG_AMD_NUMA=y/d' \
                -i -e '/CONFIG_X86_64_ACPI_NUMA=y/d' \
                -i -e '/CONFIG_NODES_SPAN_OTHER_NODES=y/d' \
                -i -e '/# CONFIG_NUMA_EMU is not set/d' \
                -i -e '/CONFIG_NODES_SHIFT=6/d' \
                -i -e '/CONFIG_NEED_MULTIPLE_NODES=y/d' \
                -i -e '/# CONFIG_MOVABLE_NODE is not set/d' \
                -i -e '/CONFIG_USE_PERCPU_NUMA_NODE_ID=y/d' \
                -i -e '/CONFIG_ACPI_NUMA=y/d' ./.config
        fi

    ### Optionally load needed modules for the make localmodconfig
        # See https://aur.archlinux.org/packages/modprobed-db
        if [ -n "$_localmodcfg" ]; then
            if [ -f $HOME/.config/modprobed.db ]; then
            msg2 "Running Steven Rostedt's make localmodconfig now"
            make LSMOD=$HOME/.config/modprobed.db localmodconfig
        else
            msg2 "No modprobed.db data found"
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

  make bzImage modules htmldocs
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

  msg2 "Installing boot image..."
  # systemd expects to find the kernel here to allow hibernation
  # https://github.com/systemd/systemd/commit/edda44605f06a41fb86b7ab8128dcf99161d2344
  install -Dm644 "$(make -s image_name)" "$modulesdir/vmlinuz"

  # Used by mkinitcpio to name the kernel
  echo "$pkgbase" | install -Dm644 /dev/stdin "$modulesdir/pkgbase"

  msg2 "Installing modules..."
  make INSTALL_MOD_PATH="$pkgdir/usr" modules_install

  # remove build and source links
  rm "$modulesdir"/{source,build}

  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-headers() {
    pkgdesc="Headers and scripts for building modules for the $pkgdesc kernel"
    depends=('linux-rt-bfq')

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  msg2 "Installing build files..."
  install -Dt "$builddir" -m644 .config Makefile Module.symvers System.map \
    localversion.* version vmlinux
  install -Dt "$builddir/kernel" -m644 kernel/Makefile
  install -Dt "$builddir/arch/x86" -m644 arch/x86/Makefile
  cp -t "$builddir" -a scripts

  # add objtool for external module building and enabled VALIDATION_STACK option
  install -Dt "$builddir/tools/objtool" tools/objtool/objtool

  # add xfs and shmem for aufs building
  mkdir -p "$builddir"/{fs/xfs,mm}

  msg2 "Installing headers..."
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

  msg2 "Installing KConfig files..."
  find . -name 'Kconfig*' -exec install -Dm644 {} "$builddir/{}" \;

  msg2 "Removing unneeded architectures..."
  local arch
  for arch in "$builddir"/arch/*/; do
    [[ $arch = */x86/ ]] && continue
    echo "Removing $(basename "$arch")"
    rm -r "$arch"
  done

  msg2 "Removing documentation..."
  rm -r "$builddir/Documentation"

  msg2 "Removing broken symlinks..."
  find -L "$builddir" -type l -printf 'Removing %P\n' -delete

  msg2 "Removing loose objects..."
  find "$builddir" -type f -name '*.o' -printf 'Removing %P\n' -delete

  msg2 "Stripping build tools..."
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

  msg2 "Adding symlink..."
  mkdir -p "$pkgdir/usr/src"
  ln -sr "$builddir" "$pkgdir/usr/src/$pkgbase"

  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

_package-docs() {
    pkgdesc="Documentation for the $pkgdesc kernel"
    depends=('linux-rt-bfq')

  cd $_srcname
  local builddir="$pkgdir/usr/lib/modules/$(<version)/build"

  msg2 "Installing documentation..."
  local src dst
  while read -rd '' src; do
    dst="${src#Documentation/}"
    dst="$builddir/Documentation/${dst#output/}"
    install -Dm644 "$src" "$dst"
  done < <(find Documentation -name '.*' -prune -o ! -type d -print0)

  msg2 "Adding symlink..."
  mkdir -p "$pkgdir/usr/share/doc"
  ln -sr "$builddir/Documentation" "$pkgdir/usr/share/doc/$pkgbase"

  msg2 "Fixing permissions..."
  chmod -Rc u=rwX,go=rX "$pkgdir"
}

pkgname=("$pkgbase" "$pkgbase-headers" "$pkgbase-docs")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

sha512sums=('462bddae3e0410f8a65393631fac4bcde19def55a21890d88ed4929948cbbb95ec4d3a310f507c71588269598c518b0072f2fc536be116337b627da6ae151e5e'
            'SKIP'
            '2aa7122dbd9a11de62ce5cb5cff6b855cc371dc636e09c238155026b40ccb73d85c0b2565a8001e6c321f9a09089a949fd864aee48580704a044a99f09dbdd57'
            'SKIP'
            '10c9bbb02c6a0afe869efae97fe6133062110f46c973fd7b60cdd8a88f14de7646d206d5c2bbbf1170ca0aa9cf7c2d0daab477d12c074dc18e9b98075cd2b57c'
            '2eb574fbfac6e334d3b06e52e466dbf8e88034515729b6571990b10f75a0fe2a52f188615405c5a695b5820669e595deead44d7961a97c5872359be3435fdf63'
            '47aa3e960f34c8f148d333846b8924c9d63639f162e8b0639041951ff5c56b1a1cedb703ad9c273c9bf15160e8108d4f77d934cfbddc4dda910a5861253823b5'
            'b09dde85c58ae032c4784878029720987b381250cb6a28ff5248461fc6c6ebf4ef2f9ac194d244aaacea4bf71cc953a24061d0dd724550b5006aaddbf677f5a8'
            '1d9a2973fc1f7e1d8afd489757b2462e3b5c6c077eec610fcc27dd95e2db409d72a713c293a597015df04c45bd7262c67bd4352815225b62d0268bd6f9313462'
            'cac62c1655945d0868cd0578203b6c86192e982ce79f6395fb3eaa384e89e652ea406551d6ea42319e62f7b041df7e747d1a2450bd640d32b408b71facfa65cd'
            '586b36091f0214e921ebd5bc01a1d563aa355b61aa6f1254719a81019e65575217da9c794511af02a751f5e5271ab481520196aafc51c0e9834ad9bda4f279d9'
            '859a0bced992b4d76c0887624a928e3b9d3b3ddf8772b579b2e2622bda77d8ea703687e9438a8c92f67032c517e3df89945e8b1590a591d3c0e7d04650a3c4c3'
            '5b56b36603736814abf42add8113566e6d9bb0825ee9aa97c66b11ebc32b78f534159d9b2aee6afcdb126e22360b9f01393f635b3649e7e470de2383eb6691f3'
            'a6630c76823d253256f25743482409f5a77602e0c4498abac01a221457aa04165b14bbf72e1deaf8e2abbf3986450c9a2d663e06f7419aac2749ecfa3aaeacfb'
            '193755cba7b1b363bec6140d89452cf484670c2b2c3a4eeabe7bce30b04f3bdc0ca35c7453966e5d0c4d714d699820bb14e9451151f4660b331a91dd009819df'
            '72bb7dd7aba396ae8abfbd1f9a77e52b408d355b431aa54ab045aecaaa161b0a291e994572eabf63538221a52dd6d180d71bc354009f76c24863c03037ae191e'
            '224bda9a7b515c7813e08902de5f3069800d36036349dadaff687ee9145ca6d3fb46639d98e54201146e9089da9a4c977f18db750669e9d77954f8928eb24b98'
            'db12b1052fec8724525cdb7c54bbfe67c6ad4e2398491da2bbfb5c4868f4d943bfca2f8149685dba326bb1ace54c7cce7af0fcc8accc73dcc7ffa12937d3cf9f'
            '53b9cd33e0f4fbb46dd49393650bec0bb4d57b3846dc8439b15057853ef5e662d144e48325f64ef58c1016a7443add460dc71b2a901d95108374395006b078ab'
            'dd696419da28b52068420efbb4f24ec58fc833720d659ddb23c784f5161b7eb23076cf80061e2bd3388b5724b662f037403e874309abd79927803ae09ddfa4ee'
            '568cfcd0d7f410d25988b24746b6cb8d605db40ebec9d0b336f3c06100d2d79c2347a84bdc9807a4c1507ecbb8f6e65a4c1b927a239f3b8a1b1cdd1bbb3e5b1f'
            '8e3f54aad28b027e28039aa414ede2d6b5cb58423e515f4fc10fbd08fcd4ce3513809629b01f3ef9cccf1e967880ef5538ac8502f950badc39a227e563befd41'
            '52f62783f4dc861bbc69c79e23d62eda26714b55a904d27db208117f984b7bf9bf65917ef8d5d630cddd5c0ef8df1367c13abf2ced8a39db24edbf5d3de7c56f'
            '08f7c6f9eb61ff8b93c2e8acdf2f088c8edf408a1e3ac6015c7f9d475383cd9edf737441b0049306c5b4f70224e88ca2005a94649d2b488e5b9c013076322b3a'
            'ae9fbfca5516d37b7b98765daecf383ec3bb832484283535e22dc53b93df1d69e29d40bd107e2d915325cffcc1e920eeaf3c397592719950d1695583bdae54d4'
            '38f58bb0c79f6adf27fd9091e1a8f040216ef4e39846d6cd2b70dcec4c5c0d44ff1ccc19910bc617c2d178f36eb7176d2b21bf899ebd7140911bcb71d4ecb4ed'
            '5fb038ea01dd61b3c79cfe1af9fcb5b246fb3e6fdf848f7217375e1cc310cd85b39eba0b46f1ae8f7b80795fb9f0153f67f6d0f17654ea9d9a729f28c070375c'
            '078e7b5c35361e90b4465c50c88443cff5ad2f5ec94cb40a6b631da45a19982871b942f0316d7681c6f171f57a39a9f6f4c2edee4076666fe7fa48688f66421d'
            '514243a092ba618d30316efc955ae3ffe0203d33668a78c5044add976abbecc37c7a6fe5b4082dd2ff6ea31cb5d7420e05dd22e9a44798c37cccf55e2de12438'
            'c204c994de4f843e703221c50176f6b47b635e05c3048977a1ad7b1df8d15cbb27fcb964c28d321644de022597cb252091e54c0b7c860c46fd52b607b5e55a8f')

validpgpkeys=(
              'ABAF11C65A2970B130ABE3C479BE3E4300411886' # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E' # Greg Kroah-Hartman
              '64254695FFF0AA4466CC19E67B96E8162A8CF5D1' # Sebastian Andrzej Siewior
              '5ED9A48FC54C0A22D1D0804CEBC26CDB5A56DE73' # Steven Rostedt
              'E644E2F1D45FA0B2EAA02F33109F098506FF0B14' # Thomas Gleixner
              )
