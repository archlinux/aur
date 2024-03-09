# Maintainer: Laszlo Gombos <laszlo.gombos@gmail.com>
# Contributor: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
pkgname=dracut-git
pkgver=060.r6794.4980bad
pkgrel=16
pkgdesc='An event driven initramfs infrastructure'
arch=('x86_64')
url='https://github.com/dracutdevs/dracut'
license=('GPL-2.0-or-later')
depends=(
  'bash'
  'coreutils'
  'cpio'
  'findutils'
  'gawk'
  'grep'
  'kmod'
  'pkgconf'
  'procps'
  'sed'
  'systemd'
  'util-linux'
)
makedepends=(
  'asciidoc'
  'bash-completion'
  'git'
)
optdepends=(
  'binutils: --uefi option support'
  'biosdevname: BIOS network device renaming'
  'bluez: bluetooth (keyboard)'
  'btrfs-progs: scan for Btrfs on block devices'
  'busybox: allows use of busybox (on your own risk)'
  'bzip2: bzip2 compression'
  'cifs-utils: support CIFS'
  'connman: support for connman networking'
  'dash: allows use of dash (on your own risk)'
  'dhclient: legacy networking support'
  'dmraid: dmraid dracut module support'
  'e2fsprogs: ext2/3/4 filesystem support'
  'elfutils: strip binaries to reduce initramfs size'
  'f2fs-tools: fsfs filesystem support'
  'fuse3: live on NTFS (dmsquash-live-ntfs module)'
  'gzip: gzip compression'
  'hardlink: --hardlink option support'
  'iproute2: legacy networking support'
  'iputils: networking support'
  'jq: NVMe-oF support (nvmf module)'
  'lvm2: support Logical Volume Manager'
  'lzop: lzop compression'
  'mdadm: support MD devices, also known as software RAID devices'
  'memstrack: memstrack module support'
  'multipath-tools: dmraid dracut module support'
  'nbd: support network block devices'
  'ndctl: NVDIMM support'
  'networkmanager: networkmanager support'
  'nfs-utils: support NFS'
  'ntfs-3g: live on NTFS (dmsquash-live-ntfs module)'
  'nvme-cli: NVMe-oF support (nvmf module)'
  'open-iscsi: support iSCSI (iscsi module)'
  'openssh: install ssh and scp along with config files and specified keys (ssh-client module)'
  'pigz: faster gzip compression'
  'plymouth: plymouth boot splash'
  'rng-tools: enable rngd service to help generating entropy early during boot'
  'sbsigntools: uefi_secureboot_cert/key configuration option support'
  'squashfs-tools: support for building a squashed initramfs'
  'tar: live tar image'
  'tpm2-tools: tpm2-tss module support'
  'xz: xz compression'
)
checkdepends=(
  'btrfs-progs'
  'connman'
  'dash'
  'dhclient'
  'dhcp'
  'dmraid'
  'linux'
  'lvm2'
  'mdadm'
  'multipath-tools'
  'nbd'
  'networkmanager'
  'nfsidmap'
  'nfs-utils'
  'ntfs-3g'
  'open-iscsi'
  'parted'
  'pigz'
  'qemu'
  'squashfs-tools'
)
provides=("${pkgname%-git}" 'initramfs')
conflicts=("${pkgname%-git}")
backup=('etc/dracut.conf')
source=(
  git+${url}.git
  2250.patch::${url}/commit/94ce821d49205044a3336d63f837d6e4ff8d6a85.patch    # fix(net-lib): add a new dracut module called net-lib
  2269-1.patch::${url}/commit/0057c3bb7afa803928b0214f8bbcb33e7d5e0c39.patch  # fix(overlayfs): allow hostonly
  2269-2.patch::${url}/commit/51f1211be3610e57937fe2235d8088565b4f2639.patch  # fix(overlayfs): to allow overlay on top of network device
  2429.patch::${url}/commit/71055058c0bdb6fec0dbebf2ec8bbfc968820b88.patch    # fix(test): running tests no longer requires to be root
  2494.patch::${url}/commit/b88d0bab791bdc4ca75d13802f0391caf537650d.patch    # fix(resume): include in hostonly mode if resume= on cmdline
  2527.patch::${url}/commit/a2fe89116db4b286fbf515f26bd1773b5e6ee8ad.patch    # fix(resume): add new systemd-hibernate-resume.service
  2531.patch::${url}/commit/a8015f7dfc682100434e3ee051bf9472a8e6cad4.patch    # fix(resume): add new systemd-hibernate-resume.service
  2544.patch::${url}/commit/c1a69b81f6ebd62a40054be2375cb77c040694aa.patch    # fix(dracut.sh): skip README for AMD microcode generation
  2547-1.patch::${url}/commit/6da61a2c0e38da4e6e880e1bb7f47d55d2c54c65.patch  # fix(pcsc): add opensc load module file
  2547-2.patch::${url}/commit/842be0c89fe0cc8cac9efa88e68b07ae1c2d2464.patch  # fix(pcsc): add --disable-polkit to pcscd.service
  2549.patch::${url}/commit/c20533f9cba63f796d6ee34724e430a712125877.patch    # test(FULL SYSTEMD): no need to include dbus to the target
  2556.patch::${url}/commit/19a0ba94275e2d64f6b1a3130f137f626c648939.patch    # fix(90kernel-modules): add intel_lpss_pci for MacBook Pro
  2565.patch::${url}/commit/8b3d8c73eba275c01d9714807c10899a5703f656.patch    # test(UEFI): make test determinsitic
  2582.patch::${url}/commit/b3c70d337fe108bb24fb50923a360d8957006b86.patch    # fix: do not use modprobe --all
  2593-1.patch::${url}/commit/ca69cc20833577fac415e36c66495c6dc5b1c721.patch  # fix(dracut.sh): do not add device if `find_block_device`
  2593-2.patch::${url}/commit/03cd454845346c206194c214f9b9ec15ec91d9b4.patch  # feat(dracut.sh): protect `push_host_devs` function
  2610.patch::${url}/commit/f68d056bd9d32f4fc0c15163b256d1811a552302.patch    # fix(systemd-255): handle systemd-pcr{phase -> extend} rename
  2613.patch::${url}/commit/619de721cff44ed7c0b809bee80aee6986577e59.patch    # fix(i18n): handle symlinked keymap
)
sha512sums=('SKIP'
            'def345164b010cf97b66c29daa1fd7066b73f76e15287d474dd91aeafd9b248018b20b4bd38ebfead32c3848e85d818bb8b979697c1889d8b32c93cf8b0cbea4'
            'c529f7a2aa13733c1567bf4ff52df49ad4ba13ab46c5090bdc77dd0c6d7a1d7442d659900a425e1ac590449ea553bfb1ab09716cfd561f7d4441f57086e24197'
            '4b48a6cdfbf5289b031abe18450e29cf3a3fe6c1d05ba667a5fe26b0e3ba84f765b789cfae307c9718a0feb0abf5ab727fd1e818eb138518f7ea6c97ec2242ce'
            '83c1f6ff6cdee619dfe8bc7dd6401797e427678701424c85c0dd91268575ce2dd8d164ff8bf029afcf884835bd220929d22a15ab5da2ddf3cfffdc80dbdcf3c3'
            'addb075072359b4317844d24b456f110186ad110e9b0ed148ed0ae85350086decc71cb7d1a1aac275142537f0bff05f385d82102c1d802691cccdb349f0a62a3'
            'bba154e13463fb759e1cfd5f461b2b4e786ad8c6f4cacacbd918e911efc7d5a5368300676d6e6d8e9b7b2f4333314886bb1e34daac9f0c73c1c441baf7918063'
            'caaee57cb86268f49c36223bb4add6a798ee0e1c2cd0556b80946e09b7d25e51c3f54eaac42c4e529194dcb4af7dd80464c73c7196c0e8d8c929b579c2c443d0'
            '6ec47d79f4363a0c0723480ca8b22a37aad054150f0496af5c54aa17392ab53ca130d8c8849412a5391a9374a232f95571cee799e1296a764964cc5aed000e41'
            '4845ea5baa480d2b6ab52bc97eeb59a3778857caaefe63e3e4d715c0b727d2c138abe2b367da3bbc21cce14e16873bccd5cfbe21840354d6072360c8a53baf92'
            '8111a49888257e9d8be72bb60189edb98f57b88c110fb4ef13fd0b0c8ffb524c156169a1271fc70e8f7da21b646978c3975434715be7ca1ba5a08f743203009b'
            'a6565ee8bb9c54183078e41c04fb5c29262c3a357a79d5c38bb801f39668ef9f3f56fd4d497208bc5f40ebdfdc82a0b45c52d4e0efb746384dc7f0f48b98c9e4'
            '191633e5f88743433678e859ad3333273185872a2464c2842341e90edfca1eea14829a00d5bf5db23c2a8a0e56778e631d2f9d67c0f0fe891b409b02d5affba8'
            '81bcdfc63864fa6b820c78d9b70854998f86d35cb34913b564ce94dcc094e7fc31038ea14a5a5e3870748824b63a24cca8c7db572d6cf7b4e31f30399f3ab064'
            '4aa808f891409756720cc53f6ac9a229c2b543419da23bd69796df5861bb11563755433728f12379950dbbb557ec183e02ba9ba70d37739f2b3a078392aa939f'
            '295e4847d1a1e8a2d0572ed42b2e992b37aa3875295027fb8b42e128458ed0766a8cd2cb56f455fe863086f357d536b55d9af7f3ff5293b734bd539a1cb86b5c'
            'ea6ac33900494d166e87ffc2a5a3891777f480c2c2299c5cc101e8ba91aa1b25840ace0ae4514c684de942d42a030b086f56bc048244bc0ee0525ea1c45feca0'
            'fdffc9362d72c98cd595f458b7a20157868e4f445ad692afde8337df77496bc905597d18d646b01ee58f9cdd3eefc848bfe04e9aa565fde6e4a2e65aa3fe75e0'
            'd55de661daadd47d2b08ae5d0bc7d651f5bc93a189b58d1f0fac2496b31069212e2e120f7ba56e3afa5cfe7360070a1afd3ed609760d812264829fb8ec9c246f')

pkgver() {
  cd "${pkgname%-git}"

  # populate DRACUT_VERSION from upstream source
  source dracut-version.sh

  # use number of revisions since beginning of the history
  printf "%s.r%s.%s" "$DRACUT_VERSION" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"

  # apply all patches
  for p in ../*.patch ; do
    patch -Np1 < $p
    P=$(echo $p | sed 's/^\.\.\///g' | sed 's/\.patch$//g')
    S=$(cat ../$p | grep 'Subject:' | sed 's/^Subject:\ \[PATCH\]\ //g')
    printf "%s:\t%s\n" "$P" "$S" >> manifest
  done

  printf "\nPatch manifest:\n===============\n"
  cat manifest

  # remove dracut modules not meant for arch x86_64
  for f in 45ifcfg 80cms 81cio_ignore 91zipl 95dasd 95dasd_mod \
    95dasd_rules 95dcssblk 95fcoe* 95qeth_rules 95zfcp \
    95zfcp_rules 95znet; do
    rm -rf modules.d/$f
  done
}

build() {
  cd "${pkgname%-git}"

  local prefix=/usr sysconfdir=/etc
  ./configure \
    --sysconfdir=${sysconfdir} \
    --prefix=${prefix} \
    --libdir=${prefix}/lib \
    --systemdsystemunitdir=${prefix}/lib/systemd/system \
    --bashcompletiondir=$(pkg-config --variable=completionsdir bash-completion)
  make
}

check() {
  cd "${pkgname%-git}/test"

  SKIP=${SKIP-"20 50 60"} TESTS=${TESTS-"18"} KVERSION="$(cd /lib/modules && ls -1 | tail -1)" make check
}

package() {
  cd "${pkgname%-git}"

  DESTDIR="$pkgdir" make install
}
