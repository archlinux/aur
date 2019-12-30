# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributorr: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>

pkgbase=linux-rc
pkgrel=1
_srcname=linux-5.4
_major=5.4
### on initial release this is null otherwise it is the current stable subversion
### ie 1,2,3 corresponding $_major.1, $_major.3 etc.
_minor=6
### on initial release comment this out and set to =1
_minorc=$((_minor+1))
#_minorc=1
### on initial release this is just $_major
_fullver=$_major.$_minor
#_fullver=$_major
_rcver=1
_rcpatch=patch-${_major}.${_minorc}-rc${_rcver}
pkgver=${_major}.${_minorc}rc${_rcver}
arch=(x86_64)
license=(GPL2)
url="https://www.kernel.org/"
makedepends=(
       kmod inetutils bc libelf
)
options=('!strip')
source=(
  https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/"$_rcpatch".{xz,sign}
  # https://lkml.org/lkml/2019/8/23/712
  # "$_rcpatch.patch::https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/patch/?id=$_srcname.y&id2=v${_major}.${_minor}"
  https://www.kernel.org/pub/linux/kernel/v5.x/linux-$_fullver.tar.{xz,sign}
  config         # the main kernel config file
  0001-ZEN-Add-sysctl-and-CONFIG-to-disallow-unprivileged-C.patch
  0002-lib-devres-add-a-helper-function-for-ioremap_uc.patch
  0003-mfd-intel-lpss-Use-devm_ioremap_uc-for-MMIO.patch
  0004-PCI-pciehp-Do-not-disable-interrupt-twice-on-suspend.patch
  0005-PCI-pciehp-Prevent-deadlock-on-disconnect.patch
  0006-ACPI-PM-s2idle-Rework-ACPI-events-synchronization.patch
  0007-x86-MCE-AMD-Do-not-use-rdmsr_safe_on_cpu-in-smca_con.patch
  0008-x86-MCE-AMD-Allow-Reserved-types-to-be-overwritten-i.patch
  0009-x86-mce-Fix-possibly-incorrect-severity-calculation-.patch
  0010-Revert-iwlwifi-assign-directly-to-iwl_trans-cfg-in-Q.patch
  0011-iwlwifi-pcie-move-power-gating-workaround-earlier-in.patch
  0012-x86-intel-Disable-HPET-on-Intel-Coffee-Lake-H-platfo.patch
  0013-x86-intel-Disable-HPET-on-Intel-Ice-Lake-platforms.patch
  0014-drm-i915-save-AUD_FREQ_CNTRL-state-at-audio-domain-s.patch
  0015-drm-i915-Fix-audio-power-up-sequence-for-gen10-displ.patch
  0016-drm-i915-extend-audio-CDCLK-2-BCLK-constraint-to-mor.patch
  0017-ASoC-SOF-enable-sync_write-in-hdac_bus.patch
  0018-xhci-pci-Allow-host-runtime-PM-as-default-also-for-I.patch
  0019-iwlwifi-pcie-restore-support-for-Killer-Qu-C0-NICs.patch
)
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)
sha256sums=('6478624107f98d5f097e22107cb718c943adfbf8b9e8a676d3f597b4afefabb7'
            'SKIP'
            'fda561bcdea397ddd59656319c53871002938b19b554f30efed90affa30989c8'
            'SKIP'
            'b7f23bbc09b6c571b76f851f0389386a6f3a64f3d7b1b8509c8550228b0f4537'
            'c404647c64cb7b2ab6aae5333cffe072725fe1a3e3f863646656591af7b55078'
            'fe6d125c1101b8ec6e01783598b7a9a34130447b28239d47ee6cafd76f9806ae'
            'e021b7d4cfb26e851b5b55250fd4e635b66237a8863c962ede4f51022f9927cc'
            '5ccbf49c1f588f344b120750d63bf42be5b8cda4946ebe256d5d69df3fce96ac'
            '514088ce473a7160e1a906aaf44adac4389de48ba8bfaffb28ef2efaff5b2a41'
            '5fcddf32bc5017afcf20c52430febf08c4f4de2a13aa838298eb8ff982fbda77'
            '2ffc236ad41c40ec5d622ff2c8d6ae3a22e545dbeb3a0cc0f63a70d2438bb507'
            '90bb284a19e9dd8aab105a80632170e58d818200965f51cb98ee4849d9cd2594'
            'd573611616cb24b6c240c57321b3de6c2e51c49a3f8df52ef63009aeea5eb60e'
            '04c6d2408452b907b12a6ee149cc023998545199cd3e9793b555682ad99aae35'
            'c974abd5df781b303a6cfaa1685a5b1556b4104441804d14963e8a2893fcc548'
            '6556d1dfa848566774fb1014c451809fb6dfab39336b27197d1b3a23d427d1ca'
            '6b7f016aa55b9ba7ce7425b9a2f0c8b3bd8d4a4bbf703db9701c0974dc24162c'
            '02f8992b6b6c467f561dd9aa309fc00695276d11227a2fc6816860c896bd206d'
            '227668904e0d363c43e756dd08aec15accc5ebbc045b9d7b2068f27801009b63'
            '97ab714be54e5516dcd4df051c8f7b551b87a0ca85c0e6b1f50f4eb1226d95d1'
            '09749254d63826dd3ddf6451882adc91deb1a79561593a7c399a41b623310c19'
            'c81691927b5c7e36f492d5d922051fb2b26dd1b24033c3a483f40045621e3960'
            '2bde1e65dec65394c26cfe5f0ba0256d807047f7720cd3ce9367667d885fc7bd')

_kernelname=${pkgbase#linux}

export KBUILD_BUILD_HOST=archlinux
export KBUILD_BUILD_USER=$pkgbase
export KBUILD_BUILD_TIMESTAMP="$(date -Ru${SOURCE_DATE_EPOCH:+d @$SOURCE_DATE_EPOCH})"

prepare() {
  cd linux-${_fullver}

  msg2 "Setting version..."
  scripts/setlocalversion --save-scmversion
  echo "-$pkgrel" > localversion.10-pkgrel
  echo "${pkgbase#linux}" > localversion.20-pkgname

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  msg2 "Setting config..."
  cp ../config .config
  make olddefconfig

  make -s kernelrelease > version
  msg2 "Prepared %s version %s" "$pkgbase" "$(<version)"
}

build() {
  cd linux-${_fullver}

  make bzImage modules
}

_package() {
  pkgdesc="The release candidate kernel and modules"
  depends=(coreutils kmod initramfs)
  optdepends=('crda: to set the correct wireless channels of your country'
              'linux-firmware: firmware images needed for some devices')

  cd linux-${_fullver}
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
  pkgdesc="Headers and scripts for building modules for the linux-rc kernel"

  cd linux-${_fullver}
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

pkgname=("$pkgbase" "$pkgbase-headers")
for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package${_p#$pkgbase}")
    _package${_p#$pkgbase}
  }"
done

# vim:set ts=8 sts=2 sw=2 et:
