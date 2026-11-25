# Maintainer: Twilight0 <twilight0@vivaldi.net>

pkgname=vulkan-nouveau-aliveos
epoch=1
pkgver=26.3.1
pkgrel=3
pkgdesc="Open-source Vulkan driver for NVIDIA GPUs (AliveOS NVK / Fermi research fork)"
url="https://github.com/Twilight0/vulkan-nouveau-aliveos"
arch=('x86_64')
license=('MIT AND BSD-3-Clause AND SGI-B-2.0')
depends=(
  'expat'
  'glibc'
  'libdisplay-info'
  'libdrm'
  'libelf'
  'libgcc'
  'libstdc++'
  'libx11'
  'libxcb'
  'libxshmfence'
  'spirv-tools'
  'systemd-libs'
  'vulkan-icd-loader'
  'vulkan-mesa-implicit-layers'
  'wayland'
  'xcb-util-keysyms'
  'zlib'
  'zstd'
)
makedepends=(
  'bison'
  'cbindgen'
  'clang'
  'cmake'
  'elfutils'
  'flex'
  'glslang'
  'libxrandr'
  'llvm'
  'meson'
  'python-mako'
  'python-packaging'
  'python-yaml'
  'rust'
  'rust-bindgen'
  'spirv-llvm-translator'
  'wayland-protocols'
  'xorgproto'
)
optdepends=('vulkan-mesa-layers: additional vulkan layers')
provides=(
  "vulkan-nouveau=1:${pkgver}-${pkgrel}"
  'vulkan-driver'
)
conflicts=('vulkan-nouveau')
options=(
  !lto
  !debug
)
source=(
  "https://archive.mesa3d.org/mesa-${pkgver}.tar.xz"
  "0001-nouveau-nvk-nak-initial-Fermi-NVC3-SM20-bring-up.patch"
  "0002-nouveau-nvk-nak-Fermi-bound-textures-and-NV9039-M2MF.patch"
  "0003-nouveau-nvk-nak-Fermi-compute-dynamic-tex-txs-and-SU.patch"
)

# Rust crates required by Mesa NVK / NAK subprojects (Mesa 26.3.1)
declare -A _crates=(
  bitflags         2.9.1
  cfg-if           1.0.0
  equivalent       1.0.1
  errno            0.3.12
  hashbrown        0.14.1
  indexmap         2.2.6
  libc             0.2.185
  log              0.4.27
  mach2            0.7.0
  once_cell        1.8.0
  paste            1.0.14
  pest             2.8.0
  pest_derive      2.8.0
  pest_generator   2.8.0
  pest_meta        2.8.0
  proc-macro2      1.0.86
  quote            1.0.35
  remain           0.2.12
  roxmltree        0.20.0
  rustc-hash       2.1.1
  rustix           1.1.4
  syn              2.0.87
  thiserror        2.0.11
  thiserror-impl   2.0.11
  ucd-trie         0.1.6
  unicode-ident    1.0.12
  windows-link     0.2.0
  windows-sys      0.61.1
  xml              1.2.1
  zerocopy         0.8.13
  zerocopy-derive  0.8.13
)

for _crate in "${!_crates[@]}"; do
  _ver="${_crates[$_crate]}"
  source+=(
    "${_crate}-${_ver}.tar.gz::https://static.crates.io/crates/${_crate}/${_ver}/download"
  )
done

sha256sums=('4e4e438eac7b840a9383988cbb7c08dad8041da544b9319fc26d319fa7348961'
            'b9e5b0bdc73935e3fc61b544e3ede92eff7c9f522fb85764caad643300cc0a23'
            '0eaebc44a5603fdc186f6452c763f774a59fdeeb1869b1af95bff1f284d27808'
            '71ff270d149adf8f3bae0274dab1b724ac66e3518f5e04d72dc815e02a8ee379'
            'b8aa498d22c9bbaf482329839bc5620c46be275a19a812e9a22a2b07529a642a'
            '67914ab451f3bfd2e69e5e9d2ef3858484e7074d63f204fd166ec391b54de21d'
            'ed646292ffc8188ef8ea4d1e0e0150fb15a5c2e12ad9b8fc191ae7a8a7f3c4b9'
            '7f9f832470494906d1fca5329f8ab5791cc60beb230c74815dff541cbd2b5ca0'
            '52ff2c0fe9bc6cb6b14a0592c2ff4fa9ceb83eea9db979b0487cd054946a2b8f'
            '168fb715dda47215e360912c096649d23d58bf392ac62f73919e831745e40f26'
            '7dfda62a12f55daeae5015f81b0baea145391cb4520f86c248fc615d72640d12'
            '13dc2df351e3202783a1fe0d44375f7295ffb4049267b0f3018346dc122a1d94'
            '7988d73a4303ca289df03316bc490e934accf371af6bc745393cf3c2c5c4f25d'
            '45e46c0661abb7180e7b9c281db115305d49ca1709ab8242adf09666d2173c65'
            '357703d41365b4b27c590e3ed91eabb1b663f07c4c084095e60cbed4362dff0d'
            'baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd'
            '1ad5e011230cad274d0532460c5ab69828ea47ae75681b42a841663efffaf794'
            '5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77'
            'd725d9cfd79e87dccc9341a2ef39d1b6f6353d68c4b33c177febbe1a402c97c5'
            '26afc1baea8a989337eeb52b6e72a039780ce45c3edfcc9c5b9d112feeb173c2'
            '3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b'
            '1b8e56985ec62d17e9c1001dc89c88ecd7dc08e47eba5ec7c29c7b5eeecde967'
            '6f109e41dd4a3c848907eb83d5a42ea98b3769495597450cf6d153507b166f0f'
            '291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef'
            '6c20b6793b5c2fa6553b250154b78d6d0db37e72700ae35fad9387a46f487c97'
            'b0d28e293f2b8c9d2b2d1c0193bd3c1cbdc0d2cf396888dc01162f7cf9d6c3f3'
            'de3145af08024dea9fa9914f381a17b8fc6034dfb00f3a84013f7ff43f29ed4c'
            'cea14ef9355e3beab063703aa9dab15afd25f0667c341310c1e5274bb1d0da18'
            'b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190'
            '198db74531d58c70a361c42201efde7e2591e976d518caf7662a47dc5720e7b6'
            'd452f284b73e6d76dd36758a0c8684b1d5be31f92b89d07fd5822175732206fc'
            '5443807d6dff69373d433ab9ef5378ad8df50ca6298caf15de6e52e24aaf54d5'
            'db7d01726be8ab66ab32f9df467ae8b1148906685bbe75c82d1e65d7f5b3f841'
            '692fcb63b64b1758029e0a96ee63e049ce8c5948587f2f7208df04625e5f6b56'
            '25aa4ce346d03a6dcd68dd8b4010bcb74e54e62c90c573f394c46eae99aba32d')

prepare() {
  cd "mesa-${pkgver}"

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done

  echo "${pkgver}-aliveos.${pkgrel}" > VERSION
}

build() {
  local meson_options=(
    --optimization 2
    -D android-libbacktrace=disabled
    -D b_ndebug=true
    -D egl=disabled
    -D expat=enabled
    -D gallium-drivers=
    -D gallium-mediafoundation=disabled
    -D gallium-rusticl=false
    -D gallium-va=disabled
    -D gbm=disabled
    -D gles1=disabled
    -D gles2=disabled
    -D glvnd=disabled
    -D glx=disabled
    -D html-docs=disabled
    -D intel-rt=disabled
    -D libunwind=disabled
    -D llvm=enabled
    -D microsoft-clc=disabled
    -D platforms=x11,wayland
    -D shared-llvm=enabled
    -D spirv-tools=enabled
    -D teflon=false
    -D valgrind=disabled
    -D vulkan-drivers=nouveau
    -D vulkan-layers=
    -D vulkan-manifest-per-architecture=false
    -D xmlconfig=enabled
    -D zlib=enabled
    -D zstd=enabled
  )

  export MESON_PACKAGE_CACHE_DIR="$srcdir"

  arch-meson "mesa-${pkgver}" build --auto-features=auto "${meson_options[@]}"
  meson compile -C build
}

package() {
  local staging="$srcdir/stage"
  rm -rf "$staging"
  meson install -C build --destdir "$staging" --no-rebuild

  install -Dm755 "$staging/usr/lib/libvulkan_nouveau.so" -t "$pkgdir/usr/lib"
  install -Dm644 "$staging/usr/share/vulkan/icd.d/nouveau_icd.json" -t "$pkgdir/usr/share/vulkan/icd.d"
  install -Dm644 "mesa-${pkgver}/docs/license.rst" -t "$pkgdir/usr/share/licenses/${pkgname}"
}
