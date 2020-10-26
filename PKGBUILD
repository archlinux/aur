# Maintainer: zer0def <zer0def@github>
# Contributor: Kaushal M <kshlmster cat gmail dog com>
# Contributor: Stefan Zwanenburg <stefan cat zwanenburg dog info>
pkgbase=kata2-containers
_pkgbase=kata-containers
pkgname=(
  kata2-agent
  kata2-runtime
  kata2-linux-container
  kata2-containers-image
)
pkgver=2.0.0
_pkgver=${pkgver/\~/-}
pkgrel=2
pkgdesc="Lightweight virtual machines for containers, version 2"
arch=('x86_64')
url="https://katacontainers.io/"
license=('Apache')
makedepends=(
  'go' 'bc' 'rust'
  'yq2-bin'  # quietly pulled by Kata's codebase to read versions.yaml from repo
  'mkinitcpio'  # initrd build
  'udisks2'  # rootless image build
)

_gh_org="github.com/kata-containers"
_kata_kernel_ver="${KATA_KERNEL_VER:-5.4.71}"
_arch_bootstrap_ver="${ARCH_BOOTSTRAP_VER:-2020.11.01}"

source=(
  "${_pkgbase}-${_pkgver}.tar.gz::https://${_gh_org}/kata-containers/archive/${_pkgver}.tar.gz"
  "https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${_kata_kernel_ver}.tar.xz"
  "https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-${_kata_kernel_ver}.tar.sign"

  # mknitcpio-busybox
  "mkinitcpio-agent.conf"
  "install_kata-agent.tpl"

  # mknitpcio-systemd
  "install_sd-kata-agent.tpl"
  "kata-agent.service.in"
  "kata-containers.target"

  # image build
  "http://mirrors.evowise.com/archlinux/iso/${_arch_bootstrap_ver}/archlinux-bootstrap-${_arch_bootstrap_ver}-x86_64.tar.gz"
  "http://mirrors.evowise.com/archlinux/iso/${_arch_bootstrap_ver}/archlinux-bootstrap-${_arch_bootstrap_ver}-x86_64.tar.gz.sig"
  "image_builder.sh"
  "rootfs-builder-config.sh"
  "rootfs-builder-lib.sh"
)
sha512sums=(
  "3106c05aa2ab613525ef4eff545059a9af864bf0fc44f67a5966ad9a0fb27cfd6c67f5d8f004a186a0d57ae52d419bce2462a6a751723a135b4419951eb78ef7"
  "${KATA_KERNEL_SUM_SHA512:-2b9c83425c3fd40abb76197e65933d1f79c60b71b3eccc6e0dcbb6748001ccbd002366cc2b61a796536166f08d831478a840bcb1e19ca0531b7f180a451e4d1c}"
  "SKIP"

  "182a249aecbab33b8704e9567e96d33b535ee59e6d2f52f0c30fbc3d12813f60192886539cc745933caaf59268925d78db9e0b6b427321e2bac932ebde77d62e"
  "0250e52251986f36cfb9e378d848f755caaf5253daa8ff7d87172f2622754c1eb4180b338a497e3fbeb880e232eef19d5e512f5a8e610e7a6eb468f210849a08"

  "60e2dee0afcfc52b6075309b4eeb55c75dc4a8f063274f2cd481a0056fae0e78e414f0422af26acddff93edb43a23cb52c26aefd92677160fd8eb6a685b6a6d6"
  "8f927f482d54a762ae5c952883034355a76c5547993ed4245a434a74014aa96e6c5182e3ece0a431e075c1d2f86e99ed0d0d8d839586821c5a7cdf053ec6963d"
  "b599a62d07f4451f52747eaf185142fbe8eeb9aced211369fc83d88c43483ef1008f87615fcfcf30d74a557569b89d5fcb4a61326ffc8cb0559ec51807d808ca"

  "${ARCH_BOOTSTRAP_SUM_SHA512:-91a3f0a1cbc7addb1941bc583b364b411e28223580980063ddc950cf4a0d247b0c40dbac6462f39d4d2f20102a8ff643b02179fa7dba685ae588962ea778c5d3}"
  "SKIP"
  "6f476297d9001eef9a0665689f752cf5124907522cfc87240df16488379a5c7c9820a6e33a576dbf7f75c4fdfa7cab7a0e395b05c9339069dedbdaac42fb6c04"
  "375990194988a019f2429ed85eb996222929a028a52ec609de106df8939704db6654af6d92aec5e192693d7758fc9561f236bbb29df319c2d506b5b2d2b16553"
  "f163aa40aea809e8cb9acdc78de6ea504e6fa608a3f71d5c62418a3f23390e006e5a6c81a0aa96a2f9319ff67ca31ae85084caf26df7bc61739f0a21a967d5ec"
)
b2sums=(
  "818e5cf96e85d0116c350bf09666073579c1126d6c7ca23412352e0aebb0794605a42052317d2313c28e9dc24192f9436c996b202e5de5bf6868f2a2b22aba6f"
  "${KATA_KERNEL_SUM_B2:-450f91dd84df37cb16c6937e2a4cc55a8b2e5046b6396685cf2ae5a733a925ed5502944b5a60a1056827c788407fa3f916e04b48b9c8e3d68df6b0830039ff0b}"
  "SKIP"

  "43c81141a65fd14b60ae72c5b98168bec531990903cc7c8b224b416c71d1d05c1cf3f73891954604e0b0c6f48c52a3a41a8e9e78874a79e72b14282373108e8b"
  "9abf2208af353019ba177d8a48ba613401742cd21258a79c5d9cb8518a51f4f22a41dc386b71f2d6521d03f6ff65d8710dc59d1ca9c7c1dc5f94061c7374286c"
  "1ce51ec8cfac8149e3d421d58ec4cb5df2119f4c4d6371da3406297f87a35b6453a9a91bfce9b3b6ac81945b9c8c8237d5818b7321198635614148a8001e3da7"
  "8b5371fe7b1858dc61dcf4153b58f9c7a5ba564299d657c2bc4eac2328801346e9ca3f6f441dcca710e89495e5b7f9d35b002a8e031eb3cbd4a4fa850566309a"
  "60bb47bec6e35ccc460ac066d7205d084ab8bdc7d1749918ce0497983a6e7eb770ca9fd996f44b05dbdbfc35390bf2d02b7e8abc619fa6d9df298988d5f19053"

  "${ARCH_BOOTSTRAP_SUM_B2:-ce8bfce07a121780e6a09f2b652b0be3fb3c728cd0cccedaad4add394784a6ded18c5163d2a999fc8043cdc9eb6fc347aa6a26a990b31f1f4a445f83460eccc3}"
  "SKIP"
  "1745aa5d5df0af2452381de163e3964511172e045c13736a062bb2c932e3306250d24992b2bdbc534ced188b35d3b1f4958a5680c99356afd3097d11c84aee31"
  "a0d55c2fbd3d94859c156e7f68033091430d523e374a7058cbcbe029cb9dc41c5c6c56560425c698438f66ab3754423f656885962ac40d8cd5aeb2f8039a77c9"
  "f1be90935e6201bb8d0c911d75d3c5f52ee6530ea8cd7b42f405bd09485e89e0465dcfe01648d2e3efe20bd19a84c19ae19f907ed1de90e940d9891c945393f6"
)
noextract=("archlinux-bootstrap-${_arch_bootstrap_ver}-x86_64.tar.gz")
validpgpkeys=(
  647F28654894E3BD457199BE38DBBDC86092693E  # kernel
  4AA4767BBC9C4B1D18AE28B77F2D434B9741E8AC  # arch
)

case "${CARCH}" in
  x86_64)     _KARCH=x86_64;;
  aarch64)    _KARCH=arm64;;
  s390|s390x) _KARCH=s390;;
  ppc64le)    _KARCH=powerpc;;
esac

_kernel_prepare(){
  # kata2-linux-container prep (ref: https://github.com/kata-containers/packaging/tree/master/kernel )
  cd "${srcdir}/linux-${_kata_kernel_ver}"
  #for p in $(find "${srcdir}/${_pkgbase}-${_pkgver}/tools/packaging/kernel/patches" -type f -name "*.patch"); do
  #  patch -p1 <"${p}"
  #done

  # kernel config prep from upstream ("${srcdir}/${_pkgbase}-${_pkgver}/tools/packaging/obs-packaging/linux-container/kata-linux-container.spec-template")
  make -s mrproper
  rm -f .config

  local -r _KCONFIG="$(find "${srcdir}/${_pkgbase}-${_pkgver}/tools/packaging/kernel/configs" -type f -name "${_KARCH}_kata_kvm_${_kata_kernel_ver%.*}.x")"
  if [ -z "${_KCONFIG}" ]; then
    KCONFIG_CONFIG=.config ARCH=${_KARCH} scripts/kconfig/merge_config.sh -r -n "${srcdir}/${_pkgbase}-${_pkgver}/tools/packaging/kernel/configs/fragments/common/"*.conf "${srcdir}/${_pkgbase}-${_pkgver}/tools/packaging/kernel/configs/fragments/${_KARCH}/"*.conf
  else
    install -Dm 0644 "${_KCONFIG}" .config
  fi
  make -s ARCH="${_KARCH}" oldconfig
}

prepare(){
  _kernel_prepare

  install -dm0755 "${srcdir}/bin"
  ln -sf "$(type -p yq)" "${srcdir}/bin/yq"

  # agent-based initrd
  BINSRC="${srcdir}/${_pkgbase}-${_pkgver}/src/agent/target/${_KARCH}-unknown-linux-gnu/release/kata-agent" envsubst <"${srcdir}/install_kata-agent.tpl" >"${srcdir}/install_kata-agent"
  install -Dm0644 "${srcdir}/install_kata-agent" "${srcdir}/initcpio-agent/install/kata-agent"

  # systemd units
  install -Dm0644 "${srcdir}/kata-agent.service.in" "${srcdir}/${_pkgbase}-${_pkgver}/src/agent/kata-agent.service.in"
  install -Dm0644 "${srcdir}/kata-containers.target" "${srcdir}/${_pkgbase}-${_pkgver}/src/agent/kata-containers.target"

  # systemd-based initrd
  SRCDIR="${srcdir}/${_pkgbase}-${_pkgver}/src/agent" KARCH="${_KARCH}" envsubst <"${srcdir}/install_sd-kata-agent.tpl" >"${srcdir}/install_sd-kata-agent"
  install -Dm0644 "${srcdir}/install_sd-kata-agent" "${srcdir}/initcpio-systemd/install/sd-kata-agent"

  # remove subrepos without the `install` makefile target
  sed -i \
    -e '/COMPONENTS += trace-forwarder/d' \
    -e '/TOOLS += agent-ctl/d' \
    "${srcdir}/${_pkgbase}-${_pkgver}/Makefile"
  install -m0755 "${srcdir}/image_builder.sh" "${srcdir}/${_pkgbase}-${_pkgver}/tools/osbuilder/image-builder/image_builder.sh"
}

_kata_image_build() {
  # image build (it's horrid, but works without root)
  local -r _ROOTFS_DIR="${srcdir}/${_pkgbase}-${_pkgver}/tools/osbuilder/rootfs-builder/rootfs"

  # build rootfs
  install -Dm 0644 "${srcdir}/rootfs-builder-config.sh" "${srcdir}/${_pkgbase}-${_pkgver}/tools/osbuilder/rootfs-builder/archlinux/config.sh"
  install -Dm 0644 "${srcdir}/rootfs-builder-lib.sh" "${srcdir}/${_pkgbase}-${_pkgver}/tools/osbuilder/rootfs-builder/archlinux/rootfs_lib.sh"

  cd "${srcdir}/${_pkgbase}-${_pkgver}/tools/osbuilder/rootfs-builder"
  GOPATH="${srcdir}" AGENT_SOURCE_BIN="${srcdir}/${_pkgbase}-${_pkgver}/src/agent/target/${_KARCH}-unknown-linux-gnu/release/kata-agent" ROOTFS_DIR="${_ROOTFS_DIR}" ARCH_BOOTSTRAP_VER="${_arch_bootstrap_ver}" fakeroot -- ./rootfs.sh archlinux

  install -Dm0644 "${srcdir}/${_pkgbase}-${_pkgver}/src/agent/kata-containers.target" "${_ROOTFS_DIR}/usr/lib/systemd/system/kata-containers.target"
  sed -e 's#@BINDIR@#/usr/bin#' -e 's#@AGENT_NAME@#kata-agent#' "${srcdir}/${_pkgbase}-${_pkgver}/src/agent/kata-agent.service.in" >"${_ROOTFS_DIR}/usr/lib/systemd/system/kata-agent.service"

  # might not be entirely necessary
  pushd "${_ROOTFS_DIR}/etc/systemd/system/multi-user.target.wants"
  ln -sf ../../../../usr/lib/systemd/system/kata-containers.target
  popd

  # rootfs image (builds filesystem with uid:gid of building system user! beware!)
  cd "${srcdir}/${_pkgbase}-${_pkgver}/tools/osbuilder/image-builder"
  ./image_builder.sh -f ext4 "${_ROOTFS_DIR}"
}

build(){
  cd "${srcdir}/${_pkgbase}-${_pkgver}"
  GOPATH="${srcdir}" make BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib" LIBC=gnu

  # kernel build
  cd "${srcdir}/linux-${_kata_kernel_ver}"
  make -s ARCH="${_KARCH}"

  mkinitcpio -c "${srcdir}/mkinitcpio-agent.conf" -g "${srcdir}/initrd-arch-agent.img" -D "${srcdir}/initcpio-agent"
  #mkinitcpio -c "${srcdir}/mkinitcpio-systemd.conf" -g "${srcdir}/initrd-arch-systemd.img" -D "${srcdir}/initcpio-systemd"
  _kata_image_build
}

package_kata2-agent(){
  cd "${srcdir}/${_pkgbase}-${_pkgver}/src/agent"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib" LIBC=gnu

  # install hooks
  install -dm0755 "${pkgdir}/usr/lib/initcpio/install"
  BINSRC="/usr/bin/kata-agent" envsubst <"${srcdir}/install_kata-agent.tpl" >"${pkgdir}/usr/lib/initcpio/install/kata-agent"
  #SRCDIR="${srcdir}/${_pkgbase}-${_pkgver}/src/agent" KARCH="${_KARCH}" envsubst <"${srcdir}/install_sd-kata-agent.tpl" >"${srcdir}/install_sd-kata-agent"
}

package_kata2-containers-image(){
  local -r _img_filename="kata-containers-${_pkgver%%~*}-arch-systemd-image.img" _initrd_filename="kata-containers-${_pkgver%%~*}-arch-agent-initrd.img"
  install -Dm 0644 "${srcdir}/${_pkgbase}-${_pkgver}/tools/osbuilder/image-builder/kata-containers.img" "${pkgdir}/usr/share/kata-containers/${_img_filename}"
  install -Dm 0644 "${srcdir}/initrd-arch-agent.img" "${pkgdir}/usr/share/kata-containers/${_initrd_filename}"
  pushd "${pkgdir}/usr/share/kata-containers"
  ln -sf "${_img_filename}" "kata-containers-arch.img"
  ln -sf "${_initrd_filename}" "kata-containers-arch-initrd.img"
  popd
}

package_kata2-linux-container(){
  install -Dm 0644 "${srcdir}/linux-${_kata_kernel_ver}/vmlinux" "${pkgdir}/usr/share/kata-containers/vmlinux-${_kata_kernel_ver}.container"
  pushd "${pkgdir}/usr/share/kata-containers"
  ln -sf "vmlinux-${_kata_kernel_ver}.container" vmlinux.container
  if [ "${_KARCH}" = "powerpc" ]; then
    ln -sf "vmlinux-${_kata_kernel_ver}.container" "vmlinuz-${_kata_kernel_ver}.container"
    ln -sf "vmlinuz-${_kata_kernel_ver}.container" vmlinuz.container
  else
    # param out bzImage for other archs?
    install -Dm 0644 "${srcdir}/linux-${_kata_kernel_ver}/arch/${_KARCH}/boot/bzImage" "${pkgdir}/usr/share/kata-containers/vmlinuz-${_kata_kernel_ver}.container"
    ln -sf "vmlinuz-${_kata_kernel_ver}.container" vmlinuz.container
  fi
  popd
}

package_kata2-runtime(){
  depends=('qemu-headless' "kata2-linux-container" "kata2-containers-image")
  optdepends=(
    'firecracker<0.22.0'
    'cloud-hypervisor<0.11.0'
  )
  install=kata2-runtime.install
  cd "${srcdir}/${_pkgbase}-${_pkgver}/src/runtime"
  GOPATH="${srcdir}" make install DESTDIR="${pkgdir}" BINDIR="/usr/bin" PKGLIBEXECDIR="/usr/lib/kata-containers" LIBEXECDIR="/usr/lib" LIBC=gnu
}
