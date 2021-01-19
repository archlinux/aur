# $Id$
# Maintainer: zer0def <zer0def@github>
# Contributor: Kaushal M <kshlmster cat gmail dog com>
# Contributor: Stefan Zwanenburg <stefan cat zwanenburg dog info>

pkgbase=kata-containers-bin
pkgname=(
  kata-runtime-bin
  kata-proxy-bin
  kata-shim-bin
  kata-containers-image-bin
  kata-linux-container-bin
)
epoch=1
pkgver="1.12.1"
_pkgver=${pkgver/\~/-}
pkgrel=1
pkgdesc="Lightweight virtual machines for containers (binary version)"
arch=(x86_64)
url="https://katacontainers.io"
license=('Apache')

_bin_pkg_root="/opt/kata"  # `/usr` for f30 packages, `/opt/kata` for static packages

if [ "${_bin_pkg_root}" = "/opt/kata" ]; then
  #pkgname+=(kata-containers-static)
  source=("https://github.com/kata-containers/runtime/releases/download/${_pkgver}/kata-static-${_pkgver}-${CARCH}.tar.xz")
  sha512sums=(4c81be66e2b310ef767f0c90b548f85f89f5521be9fd53c50a95e81750dfbff666595ef48ba9cece2cccc33c7fafb74db0589b4a10069abf2f8d172bda8516ae)
  b2sums=(902dd17f7bd4d955155c7d0f377905e15d1e2e02b358acb511dbccd83f950e91989f3dbb36cb30866a950ed57127d50e8fa2da21ffefd7f95a9f98e3fc7e4da4)
else
  _kata_kernel_ver="5.4.32.76"
  _default_suffix="-8.1"  # f30 package build revision
  #_image_suffix="-6.1"
  #_ksm_suffix="-6.1"
  _kernel_suffix="-9.1"
  #_proxy_suffix="-6.1"
  #_runtime_suffix="-6.1"
  #_shim_suffix="-6.1"

  #pkgname+=(kata-ksm-throttler-bin)
  source=(
    "https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-containers-image-${pkgver}${_image_suffix:-${_default_suffix}}.${CARCH}.rpm"
    "https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-ksm-throttler-${pkgver}${_ksm_suffix:-${_default_suffix}}.${CARCH}.rpm"
    "https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-linux-container-${_kata_kernel_ver}${_kernel_suffix:-${_default_suffix}}.${CARCH}.rpm"
    "https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-proxy-bin-${pkgver}${_proxy_suffix:-${_default_suffix}}.${CARCH}.rpm"
    "https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-runtime-${pkgver}${_runtime_suffix:-${_default_suffix}}.${CARCH}.rpm"
    "https://download.opensuse.org/repositories/home:/katacontainers:/releases:/${CARCH}:/stable-${pkgver%.*}/Fedora_30/${CARCH}/kata-shim-bin-${pkgver}${_shim_suffix:-${_default_suffix}}.${CARCH}.rpm"
  )
  sha512sums=(
    7f0df542e9f24158d9ff81360591d3e30886437a2f21f3f8071e85b387f76dc7ac4bb4e46604b1aff368aa1d15a61eb354c35b071840b4ea2911020cc80be8ed
    aee2c4423c0253d7f7983a693e325024d0365b799f761c2ae7fec72567df988a0df1f171ea3ea142899edb225e5cda5b43ca95fadd85f1c33a04ff0dc48a856c
    259247e7854aee7cf5d91abca365c516570afc700af04656a900306c1cfe497d7a4cb0e29f89944b083261f704d9a9daee521809ab6071639055768df7f7f61e
    1d14be901f418d0f5b0ace3e3604e45cdf6034d6f9b0e3c19a7d5aff9fabeb4b0ef57f8e5422a68ecc05785594d66ec9258e5490ab35a31f2ba825199e7b273e
    3c296414ae303673b23bf98110aa19d3ba00c6b7c9d867e82e199249a9074cd3028c512250b74e5a222c7eb642dc7b546ddae4dc3f0221464d75a374e8f73efd
    91d173106877db7d960a57463c369f92618c308d880215b4c0fdcc23218aaac19aa4cbe9b4c9c4e4984ff23bfb4e0686cc40401fe6f26d147a38c780f1d723b9
  )
  b2sums=(
    bbfb6cebaedccc36904c46292365efe77d667c7b1fa4dc21a8358a760f4e3504a092e2ccbf3cdacad96ad14346aca6ef044ddbe9eb82c2bc69b2dc630bcb9359
    4c16e67ea3be8db28ca2441d21123034f1a9ac4f9ae605b72f87c56a5c888a49e909a0810f0ba677e4c04ff014d3100ecee1a3210ac52bbdffa7d892159e2c78
    fa23a3b8a7e31c343c790ed4200db5ae15c1db4c6f0f03f9014dff1f7d79060cb0db95c5afa07148487f2a37e88b7f45a23a4c76cdfde6439fc61f7f36968e26
    53bbdabfb6b08bbbe4ec4217c760ded2f2848cce42cee869b4cfad865e8ed0c16b769ba64a092a0353e69ca0e972d724412eae502bad2d54bf71e595d6c11a69
    fcd4a2e03c15c34bcf75cc3b7c600a52ac9acd1662cffa8b5c8619e4911f191a47664060d591aaaa24701cad7786a50f6ff5cf4f5f446dc2df2e290df1d1b65d
    2406a674b822c98b36045c3c4270afd75d83b5b4c25e812e78885ad6433afc1776e0fb8c8a135ad3b0417af4f24b03f6edb86356e9808d97e3f53d3220fd8ce9
  )
fi

package_kata-runtime-bin() {
  depends=(qemu-headless kata-proxy kata-shim kata-containers-image kata-linux-container)
  optdepends=(
    kata-ksm-throttler
    'cloud-hypervisor<0.11.0'
    'firecracker<0.22.0'
  )
  conflicts=('kata-runtime')
  provides=('kata-runtime')
  install=kata-runtime.install

  install -D -m 0755 -t "${pkgdir}/usr/bin" \
    "${srcdir}${_bin_pkg_root}/bin/containerd-shim-kata-v2" \
    "${srcdir}${_bin_pkg_root}/bin/kata-runtime" \
    "${srcdir}${_bin_pkg_root}/bin/kata-collect-data.sh"
  install -D -m 0755 \
    "${srcdir}${_bin_pkg_root}/libexec/kata-containers/kata-netmon" \
    "${pkgdir}/usr/lib/kata-containers/kata-netmon"
  install -D -m 0644 \
    "${srcdir}${_bin_pkg_root}/share/bash-completion/completions/kata-runtime" \
    "${pkgdir}/usr/share/bash-completion/completions/kata-runtime"
  install -D -m 0644 -t "${pkgdir}/usr/share/defaults/kata-containers" \
    ${srcdir}${_bin_pkg_root}/share/defaults/kata-containers/*.toml

  sed -i \
    -e "s;${_bin_pkg_root};/usr;" \
    -e 's/libexec/lib/' \
    -e 's/kata-qemu/qemu/' \
    -e 's/qemu-lite/qemu/' \
    -e 's/qemu-vanilla/qemu/' \
    ${pkgdir}/usr/share/defaults/kata-containers/*.toml \
    "${pkgdir}/usr/bin/kata-collect-data.sh"
}

package_kata-proxy-bin() {
  conflicts=('kata-proxy')
  provides=('kata-proxy')
  install -D -m 0755 \
    "${srcdir}${_bin_pkg_root}/libexec/kata-containers/kata-proxy" \
    "${pkgdir}/usr/lib/kata-containers/kata-proxy"
}

package_kata-shim-bin() {
  conflicts=('kata-shim')
  provides=('kata-shim')
  install -D -m 0755 \
    "${srcdir}${_bin_pkg_root}/libexec/kata-containers/kata-shim" \
    "${pkgdir}/usr/lib/kata-containers/kata-shim"
}

package_kata-containers-image-bin(){
  conflicts=('kata-containers-image')
  provides=('kata-containers-image')
  install -Dm644 -t "${pkgdir}/usr/share/kata-containers/" \
    ${srcdir}${_bin_pkg_root}/share/kata-containers/kata-containers-image_clearlinux_${_pkgver}_agent_*.img \
    ${srcdir}${_bin_pkg_root}/share/kata-containers/kata-containers-initrd_alpine_${_pkgver}_agent_*.initrd
  cd "${pkgdir}/usr/share/kata-containers/"
  ln -s kata-containers-image_clearlinux_${_pkgver}_agent_*.img kata-containers.img
  ln -s kata-containers-initrd_alpine_${_pkgver}_agent_*.initrd kata-containers-initrd.img
}

package_kata-linux-container-bin(){
  conflicts=('kata-linux-container')
  provides=('kata-linux-container')
  install -Dm644 -t "${pkgdir}/usr/share/kata-containers/" \
    ${srcdir}${_bin_pkg_root}/share/kata-containers/vmlinux-* \
    ${srcdir}${_bin_pkg_root}/share/kata-containers/vmlinuz-*
  [ "${_bin_pkg_root}" = "/opt/kata" ] && install -Dm644 -t "${pkgdir}/usr/share/kata-containers/" \
    ${srcdir}${_bin_pkg_root}/share/kata-containers/config-*
  cd "${pkgdir}/usr/share/kata-containers/"
  ln -sf vmlinux-virtio-fs-* vmlinux-virtiofs.container
  ln -sf vmlinuz-virtio-fs-* vmlinuz-virtiofs.container
  # bash-specific behavior?
  ln -s vmlinux-[0-9].[0-9]* vmlinux.container
  ln -s vmlinuz-[0-9].[0-9]* vmlinuz.container
}

package_kata-ksm-throttler-bin() {
  conflicts=('kata-ksm-throttler')
  provides=('kata-ksm-throttler')
  install -D -m 0644 -t "${pkgdir}/usr/lib/systemd/system" \
    "${srcdir}/usr/lib/systemd/system/kata-ksm-throttler.service" \
    "${srcdir}/usr/lib/systemd/system/kata-vc-throttler.service"
  sed -i 's/libexec/lib/' \
    "${pkgdir}/usr/lib/systemd/system/kata-ksm-throttler.service" \
    "${pkgdir}/usr/lib/systemd/system/kata-vc-throttler.service"
  install -D -m 0755 \
    "${srcdir}/usr/libexec/kata-ksm-throttler/kata-ksm-throttler" \
    "${pkgdir}/usr/lib/kata-ksm-throttler/kata-ksm-throttler"
  install -D -m 0755 \
    "${srcdir}/usr/libexec/kata-ksm-throttler/trigger/virtcontainers/vc" \
    "${pkgdir}/usr/lib/kata-ksm-throttler/trigger/virtcontainers/vc"
  install -d -m 0755 \
    "${pkgdir}/var/lib/vc/firecracker" \
    "${pkgdir}/var/lib/vc/sbs" \
    "${pkgdir}/var/lib/vc/uuid"
}

package_kata-containers-static(){
  cp -dr --no-preserve='ownership' "${srcdir}/opt" "${pkgdir}/opt"
}
