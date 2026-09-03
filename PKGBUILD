# Maintainer: Orion-zhen <https://github.com/Orion-zhen>
# Contributer: darkbasic <niccolo.belli@linuxsystems.it>

pkgname=llama.cpp-hip-gfx1151
_pkgname=llama.cpp
pkgver=b10776
pkgrel=1
_upstream_commit=c61b98b875eaa5e654a3f5c73b34c310d2c6ab4c
_non_mmap_peak_commit=5ec4eab69edbfaa4b01bcf1ee1123bb885b8d892
_ui_no_npx_commit=9842953155481505d03a941422df81f9d5f5fb04
_mtp_commit=1d8de7c1b0c7d2febf8f983174d8e6a711e2b1af
_mtp_mixer_export_commit=57bb668674d9fb0d382885e5b04911c6437f8e83
_gdn_norm_base=9723942adc518b43c4b95dc4dce6906903eb5e09
_gdn_norm_commit=757abc99b3afb357bc40da9d1fa97c2d2ac10028
_server_recurrent_rollback_commit=13e4cfe53ff3dc2e786a9264ee552da53e0a41c4
_ggml_nbytes_overflow_commit=0a2e89adb99d86cf11d694327b942e9408a1b769
_rpc_invalid_graph_node_commit=181b1999205fd0e7c3e0db2874856649a0612d3f
_hip_apu_host_buffer_commit=fdc1260e99191717b0aa0a48117d4b758a24a513
_hipcub_base_commit=d7bd3bfcad3e29c7e49fd26f38c79ee3e9a3fd6b
_hipcub_commit=861abb2b2e333744d565e07985de8f6f6feaff65
_ple_row_prefetch_commit=c911e6bb5eb956a759e740fb14db8ca639b7d3e7
pkgdesc="Port of Facebook's LLaMA model in C/C++ (Optimized for gfx1151, ROCm)"
arch=(x86_64)
url='https://github.com/ggml-org/llama.cpp'
license=('MIT')
depends=(
  curl
  gcc-libs
  glibc
  python
  openmp
  hip-runtime-amd
  hipblas
  rocblas
)
makedepends=(
  cmake
  git
  hipcub
  nodejs
  npm
  rocm-hip-sdk
)
optdepends=(
  'python-numpy: needed for convert_hf_to_gguf.py'
  'python-safetensors: needed for convert_hf_to_gguf.py'
  'python-sentencepiece: needed for convert_hf_to_gguf.py'
  'python-pytorch: needed for convert_hf_to_gguf.py'
  'python-transformers: needed for convert_hf_to_gguf.py'
  'python-gguf: needed for convert_hf_to_gguf.py'
)
provides=(${_pkgname} ${_pkgname}-hip llama-cpp libggml ggml ggml-rocm)
conflicts=(${_pkgname} ${_pkgname}-hip ${_pkgname}-vulkan llama-cpp libggml ggml ggml-rocm ggml-vulkan stable-diffusion.cpp)
options=(lto !debug)
backup=("etc/conf.d/llama.cpp")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/ggml-org/llama.cpp/archive/refs/tags/${pkgver}.tar.gz"
  "non-mmap-peak-ram-${_non_mmap_peak_commit}.patch::https://github.com/ggml-org/llama.cpp/commit/${_non_mmap_peak_commit}.diff"
  "ui-no-npx-${_ui_no_npx_commit}.patch::https://github.com/ggml-org/llama.cpp/commit/${_ui_no_npx_commit}.diff"
  "qwen4exp-mtp-${_mtp_commit}.patch::https://github.com/ggml-org/llama.cpp/compare/e70802a01f03f0ed31a26338a5664796f3824371...${_mtp_commit}.diff"
  "qwen4exp-mtp-mixer-export-${_mtp_mixer_export_commit}.patch::https://github.com/rmonsurate/llama.cpp/commit/${_mtp_mixer_export_commit}.diff"
  "qwen4exp-mtp-b10776.patch"
  "qwen4exp-mtp-mixed-f16-b10776.patch"
  "gdn-norm-${_gdn_norm_commit}.patch::https://github.com/ggml-org/llama.cpp/compare/${_gdn_norm_base}...${_gdn_norm_commit}.diff"
  "server-recurrent-rollback-${_server_recurrent_rollback_commit}.patch::https://github.com/ggml-org/llama.cpp/commit/${_server_recurrent_rollback_commit}.diff"
  "ggml-nbytes-overflow-${_ggml_nbytes_overflow_commit}.patch::https://github.com/ggml-org/llama.cpp/commit/${_ggml_nbytes_overflow_commit}.diff"
  "rpc-invalid-graph-node-${_rpc_invalid_graph_node_commit}.patch::https://github.com/ggml-org/llama.cpp/commit/${_rpc_invalid_graph_node_commit}.diff"
  "rpc-graph-shape-validation-b10776.patch"
  "hip-apu-host-buffer-${_hip_apu_host_buffer_commit}.patch::https://github.com/Victor-Loos/llama.cpp/commit/${_hip_apu_host_buffer_commit}.diff"
  "hip-rdna35-moe-fusion-guard-b10776.patch"
  "hipcub-rocm-${_hipcub_commit}.patch::https://github.com/ggml-org/llama.cpp/compare/${_hipcub_base_commit}...${_hipcub_commit}.diff"
  "qwen4exp-ple-row-prefetch-${_ple_row_prefetch_commit}.patch::https://github.com/Aristo94/EngramHalo.cpp/commit/${_ple_row_prefetch_commit}.diff"
  "qwen4exp-ple-row-prefetch-b10776.patch"
  # 提升性能的妙妙工具
  # "llama-gfx1151.patch::https://gist.githubusercontent.com/pedapudi/0da060d2a3b49a51155dbf00db61fea0/raw/aaaee0a96656ec0fc49bdfa76acd2b4edbfcbfb9/gistfile1.txt"
  "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.service"
  "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.conf"
  "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.sysusers"
  "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.tmpfiles"
)
sha256sums=('3c6f904dcee462408bd2410cb90550e939b600104625c8dbf9cc6dfb2ed68e8c'
            '746fef7c121ab356f9a3395f50e778b07fd9d13336af1a2c6f43ea6bb6c54e36'
            'c78df80802f5178c3a5e91241982dd48bae09939b2c9024618632243d1751692'
            'f4015a0321186b74ddf8424b0e873c3ef0efbfb2133cfe89b8fab6e38c963b73'
            '115313efdaf605188ffcd42119ad39a853ad46c0bfd3f416d44387e2cee1925a'
            '000713f107efe04b3e1630513bbc7d67212ed25f74ef3c41aa759e0fec42186d'
            '2f80ae6d70e46544f27a913dbbdf4202d15477963f0e54f0df9dfc5ab48c27b0'
            '891919ccb35244c6fb3d6e8ba85a2e6227b014d6d304e6c6d52196332f353b32'
            '27ea2d7e7de159683249e32bc6511c392cc786f0d9d7f448ad4992af616fd2ab'
            '7370238b2cadf7a902b1ab2f6d96abd6a20e55ca142c4cbed7ed77ebaf8ac883'
            '4597fabcce3b4f7c8f3718576d4b906a8fe71c6451d9031e693396c7760528d7'
            '9581d78b01f07dd1600c1e8344ae0a4a5df47be163bb40f0edb21383bd5f9c22'
            'a55893cf8dd7a6992d66cf323c13d6dbf96b11065af7a11dc9f205041c37f80e'
            '040c03c448711182b315ad2c6264c933f3b7a575ee451a41e50962b404711326'
            'da6ca65795a0ff8373ff59fd2adc12ab63417cb658feeda1da1fdd74c7d8401d'
            '6b39be7f0b173963396ce94e19201eec1ccca7801398be66f9bee6f0ced01df5'
            '9269ee58ba98ad21ce4b6f1a7fce474aacc2529b145b9706ab666fbb13dbb330'
            'b481dcaa07d8b912b32066da4ee48341cb521852eb16d76a6cf7a8216402e101'
            'bd43b307d55a74bc64b88d95e1f37d0b12ddd2935563fc893835a91e2b8c10b5'
            '8349878d7e61819fe3da6e8a25c46c7dd66592c9a5736a7f66eb475c7a51068c'
            '027600188395ed3d721ed6f32c6fa954138fb25212154ceeadc2ff16076b1194')

prepare() {
  ln -sf "${_pkgname}-${pkgver}" llama.cpp

  # Reduce the temporary staging peak when the recommended non-mmap target
  # load is used. This is the approved upstream #27483, merged after b10776.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/non-mmap-peak-ram-${_non_mmap_peak_commit}.patch"

  # Resolve the PWA generator only from npm ci's lockfile installation. Avoid
  # npx's network fallback if the expected dependency/bin is ever missing.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/ui-no-npx-${_ui_no_npx_commit}.patch"

  # Qwen3.8-Flash-Next MTP. b10776 already contains merged PR #27941,
  # whose loader hardening overlaps the old qwen4exp.cpp hunk. Apply the
  # unaffected upstream files, then the no-fuzz local rebase that combines
  # the PR's runtime graph with detached-head commit a82a58a.
  GIT_CEILING_DIRECTORIES="${srcdir}" git -C "${_pkgname}" apply --no-index \
    --exclude='src/models/qwen4exp.cpp' \
    "${srcdir}/qwen4exp-mtp-${_mtp_commit}.patch"
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch -i "${srcdir}/qwen4exp-mtp-mixer-export-${_mtp_mixer_export_commit}.patch"
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/qwen4exp-mtp-b10776.patch"

  # Keep valid F16 integrated-head gamma tensors from entering unsupported
  # F32 x F16 binary-op dispatch in the CPU or shared HIP/CUDA backend.
  GIT_CEILING_DIRECTORIES="${srcdir}" git -C "${_pkgname}" apply --no-index \
    "${srcdir}/qwen4exp-mtp-mixed-f16-b10776.patch"

  # Match the reference GDN q/k normalization: x*rsqrt(sum(x^2)+eps).
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/gdn-norm-${_gdn_norm_commit}.patch"

  # Reprocess instead of aborting or retaining stale recurrent state when a
  # hybrid target or draft cannot roll back far enough.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/server-recurrent-rollback-${_server_recurrent_rollback_commit}.patch"

  # Avoid a pre-division size wrap for malformed block-quantized tensors.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/ggml-nbytes-overflow-${_ggml_nbytes_overflow_commit}.patch"

  # Reject malformed top-level RPC graph nodes instead of dereferencing null.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/rpc-invalid-graph-node-${_rpc_invalid_graph_node_commit}.patch"

  # Extend PR #26933 after the preceding null-node guard without fuzzy patching.
  # Mirror the complete SET_ROWS/GET_ROWS constructor invariants before RPC
  # execution; the PR's original two checks had ASan-confirmed bypasses.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/rpc-graph-shape-validation-b10776.patch"

  # Keep scheduler writes from racing direct ROCm_Host compute on Strix Halo.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch -i "${srcdir}/hip-apu-host-buffer-${_hip_apu_host_buffer_commit}.patch"

  # #27621's multi-token quantized MoE fusion is reported to silently corrupt
  # gfx1151 logits. Restore its single-token restriction only on RDNA3.5.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/hip-rdna35-moe-fusion-guard-b10776.patch"

  # Prefer hipCUB with rocPRIM >= 4.4; older ROCm keeps b10776's upstream
  # native HIP radix fallback.
  # The extracted source is untracked inside an AUR Git clone. Stop Git at
  # $srcdir so its subdirectory prefix cannot silently skip every patch path.
  GIT_CEILING_DIRECTORIES="${srcdir}" git -C "${_pkgname}" apply --no-index \
    --exclude='.github/workflows/build-cuda-ubuntu.yml' \
    --exclude='.github/workflows/hip-quality-check.yml' \
    --exclude='tests/test-backend-ops.cpp' \
    "${srcdir}/hipcub-rocm-${_hipcub_commit}.patch"

  # Queue the sparse PLE rows before each graph and support its 160-wide IQ4_NL
  # rows in the HIP GET_ROWS kernel. The small second patch hooks that row
  # prefetch into b10776's upstream lazy-tensor bookkeeping.
  GIT_CEILING_DIRECTORIES="${srcdir}" git -C "${_pkgname}" apply --no-index \
    --exclude='src/llama-model-loader.cpp' \
    --exclude='src/llama-model-loader.h' \
    "${srcdir}/qwen4exp-ple-row-prefetch-${_ple_row_prefetch_commit}.patch"
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/qwen4exp-ple-row-prefetch-b10776.patch"

  # Tailwind v4's oxide scanner walks up looking for the nearest .git to anchor
  # .gitignore lookup. In AUR helpers (yay/paru) the parent .git is the AUR
  # clone, whose .gitignore is `*` + an allowlist for PKGBUILD/.SRCINFO. That
  # rule ignores tools/ui/src/lib/**/*.svelte, so Tailwind scans zero files and
  # the built bundle.css ships without any utility classes. An empty .git in
  # the extracted source tree stops the upward walk before that point.
  mkdir -p "${_pkgname}/.git"

  # patch -d "${srcdir}/llama.cpp" -Np1 -i "${srcdir}/llama-gfx1151.patch"
}

build() {
  pushd "${_pkgname}/tools/ui"
  npm ci
  npm run build
  popd

  # 配置环境
  if [[ -z "${ROCM_PATH}" ]]; then
    source /etc/profile
  fi
  export HIP_PATH="$(hipconfig -R)"
  export HIPCXX="$(hipconfig -l)/amdclang"
  export HIP_PLATFORM=amd
  # 清除核显上的函数调用开销
  # export HIP_CLANG_FLAGS="--offload-arch=gfx1151 -mllvm -amdgpu-early-inline-all=true -mllvm -amdgpu-function-calls=false"

  local _cmake_options=(
    -B build
    -S "${_pkgname}"
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DBUILD_SHARED_LIBS=ON
    -DCMAKE_SKIP_RPATH=ON # Avoid an empty/CWD RUNPATH from CMake plus amdclang
    -DLLAMA_BUILD_TESTS=OFF
    -DLLAMA_USE_SYSTEM_GGML=OFF
    -DLLAMA_BUILD_WEBUI=ON
    -DGGML_ALL_WARNINGS=OFF
    -DGGML_ALL_WARNINGS_3RD_PARTY=OFF
    -DGGML_BUILD_EXAMPLES=OFF
    -DGGML_BUILD_TESTS=OFF
    -DGGML_LTO=ON
    -DGGML_RPC=ON
    # ROCm part
    # 偏向 512 宽度, 因为 zen5 原生支持 AVX-512
    # 激进的内联程度, 因为 zen5 的宽流水线需要减少函数边界
    # 更多的循环展开, 因为 zen5 的大型重排序缓冲区能够维持这些额外指令的在途执行
    -DCMAKE_HIP_FLAGS="-mprefer-vector-width=512 -mllvm -inline-threshold=600 -mllvm -unroll-threshold=150"
    -DAMDGPU_TARGETS="gfx1151"
    -DGGML_HIP=ON
    -DGGML_HIP_GRAPHS=ON
    -DGGML_HIP_NO_VMM=ON # Conservative default; retest VMM with each ROCm nightly
    -DGGML_CUDA_FORCE_MMQ=ON # 强制使用自定义乘法内核而非 fp16 cuBLAS. 可以加一点速并省一点显存
    # -DGGML_HIP_ROCWMMA_FATTN=ON # rocWMMA 开了也没啥用
    -DHIP_PLATFORM=amd # 手动指定 AMD 平台, 防止因 rocm-nightly 禁用自动检测而报错
    # HIP-only variant
    -DGGML_VULKAN=OFF

    -DGGML_CUDA_FA_ALL_QUANTS=ON
    -DLLAMA_BUILD_NUMBER="${pkgver#b}" # 修正版本号
    -DLLAMA_BUILD_COMMIT="${_upstream_commit:0:7}"
    -Wno-dev
  )

  # 检查是否在 CI 环境中构建
  if [ -n "$CI" ] && [ "$CI" != 0 ]; then
    msg2 "CI = $CI detected, building universal package"
    # 启用通用构建
    _cmake_options+=(
      -DGGML_BACKEND_DL=ON
      -DGGML_CPU_ALL_VARIANTS=ON
      -DGGML_NATIVE=OFF
      # -DGGML_HIP_EXPORT_METRICS=ON # 允许内核 perf metrics

      # -DGGML_ZENDNN=ON
    )
  else
    # 本地构建, 针对当前设备优化
    _cmake_options+=(
      -DGGML_NATIVE=ON
    )
  fi

  # 允许用户自定义构建选项
  if [[ -n "$LLAMA_BUILD_EXTRA_ARGS" ]]; then
    msg2 "Applied custom CMake build args: $LLAMA_BUILD_EXTRA_ARGS"
    _cmake_options+=($LLAMA_BUILD_EXTRA_ARGS)
  fi

  # Do not let CMake's build-info probes mistake the parent AUR checkout for
  # the extracted upstream source repository.
  GIT_CEILING_DIRECTORIES="${srcdir}" cmake "${_cmake_options[@]}"
  cmake --build build -- -j $(nproc)
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "llama.cpp.conf" "${pkgdir}/etc/conf.d/llama.cpp"
  install -Dm644 "llama.cpp.service" "${pkgdir}/usr/lib/systemd/system/llama.cpp.service"
  install -Dm644 "llama.cpp.sysusers" "${pkgdir}/usr/lib/sysusers.d/llama.cpp.conf"
  install -Dm644 "llama.cpp.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/llama.cpp.conf"

  msg2 "llama.cpp.service is now available"
  msg2 "llama-server arguments are in /etc/conf.d/llama.cpp"
}
