# Maintainer: Orion-zhen <https://github.com/Orion-zhen>
# Contributer: darkbasic <niccolo.belli@linuxsystems.it>

pkgname=llama.cpp-hip-gfx1151
_pkgname=llama.cpp
pkgver=b10712
pkgrel=1
_upstream_commit=daef7b6874397a5a7c3d7e38b55e2ee0adf7da38
_mtp_commit=1d8de7c1b0c7d2febf8f983174d8e6a711e2b1af
_mtp_mixer_export_commit=57bb668674d9fb0d382885e5b04911c6437f8e83
_mtp_detached_head_commit=a82a58a57fc307e5cec0dc68db64d143339be4f2
_qwen4exp_followup_commit=ea9f94fc76259fa4addbd4993efc44ab5f09648e
_qwen4exp_followup_base=132832dc3a18674f2ffec37097efd4e78d3fb12e
_qwen4exp_followup_head=868e2f52ff9a381b7594bace016b6f0f7527f2ba
_gdn_norm_base=9723942adc518b43c4b95dc4dce6906903eb5e09
_gdn_norm_commit=757abc99b3afb357bc40da9d1fa97c2d2ac10028
_server_recurrent_rollback_commit=13e4cfe53ff3dc2e786a9264ee552da53e0a41c4
_rpc_invalid_graph_node_commit=181b1999205fd0e7c3e0db2874856649a0612d3f
_hip_apu_host_buffer_commit=fdc1260e99191717b0aa0a48117d4b758a24a513
_hip_radix_top_k_commit=7f489034b48051a02c38c2eab5988443b02db300
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
  "qwen4exp-mtp-${_mtp_commit}.patch::https://github.com/ggml-org/llama.cpp/compare/e70802a01f03f0ed31a26338a5664796f3824371...${_mtp_commit}.diff"
  "qwen4exp-mtp-mixer-export-${_mtp_mixer_export_commit}.patch::https://github.com/rmonsurate/llama.cpp/commit/${_mtp_mixer_export_commit}.diff"
  "qwen4exp-mtp-detached-head-${_mtp_detached_head_commit}.patch::https://github.com/crusaderky/llama.cpp/commit/${_mtp_detached_head_commit}.diff"
  "qwen4exp-followup-${_qwen4exp_followup_commit}.patch::https://github.com/drluoto/llama.cpp/commit/${_qwen4exp_followup_commit}.diff"
  "qwen4exp-followup-post-${_qwen4exp_followup_head}.patch::https://github.com/ggml-org/llama.cpp/compare/${_qwen4exp_followup_base}...${_qwen4exp_followup_head}.diff"
  "gdn-norm-${_gdn_norm_commit}.patch::https://github.com/ggml-org/llama.cpp/compare/${_gdn_norm_base}...${_gdn_norm_commit}.diff"
  "server-recurrent-rollback-${_server_recurrent_rollback_commit}.patch::https://github.com/ggml-org/llama.cpp/commit/${_server_recurrent_rollback_commit}.diff"
  "rpc-invalid-graph-node-${_rpc_invalid_graph_node_commit}.patch::https://github.com/ggml-org/llama.cpp/commit/${_rpc_invalid_graph_node_commit}.diff"
  "hip-apu-host-buffer-${_hip_apu_host_buffer_commit}.patch::https://github.com/Victor-Loos/llama.cpp/commit/${_hip_apu_host_buffer_commit}.diff"
  "hip-radix-top-k-${_hip_radix_top_k_commit}.patch::https://github.com/ggml-org/llama.cpp/compare/749f688fcaa4c472ec034b08cb8a907c45cfaa02...${_hip_radix_top_k_commit}.diff"
  "hipcub-rocm-${_hipcub_commit}.patch::https://github.com/ggml-org/llama.cpp/compare/${_hipcub_base_commit}...${_hipcub_commit}.diff"
  "qwen4exp-ple-row-prefetch-${_ple_row_prefetch_commit}.patch::https://github.com/Aristo94/EngramHalo.cpp/commit/${_ple_row_prefetch_commit}.diff"
  "qwen4exp-ple-row-prefetch-b10712.patch"
  # 提升性能的妙妙工具
  # "llama-gfx1151.patch::https://gist.githubusercontent.com/pedapudi/0da060d2a3b49a51155dbf00db61fea0/raw/aaaee0a96656ec0fc49bdfa76acd2b4edbfcbfb9/gistfile1.txt"
  "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.service"
  "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.conf"
  "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.sysusers"
  "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.tmpfiles"
)
sha256sums=('0b98b884f064e8aceaf97e61efe514eff63e5fa9f14785b25eabb9b7b84876a7'
            'f4015a0321186b74ddf8424b0e873c3ef0efbfb2133cfe89b8fab6e38c963b73'
            '115313efdaf605188ffcd42119ad39a853ad46c0bfd3f416d44387e2cee1925a'
            '321497eccf0d02f44555e0349877fafde75354b1c72416996421044671d80b28'
            '1e7aeddea19d750b370e3b43559e88508c21c0156a5cfaa5c45fa006ddb27511'
            '72c5b02ac4494d4e54a846483d9e85dfe134d81e55f05b78569f492716b35130'
            '891919ccb35244c6fb3d6e8ba85a2e6227b014d6d304e6c6d52196332f353b32'
            '27ea2d7e7de159683249e32bc6511c392cc786f0d9d7f448ad4992af616fd2ab'
            '4597fabcce3b4f7c8f3718576d4b906a8fe71c6451d9031e693396c7760528d7'
            'a55893cf8dd7a6992d66cf323c13d6dbf96b11065af7a11dc9f205041c37f80e'
            '65cb266ee3890043fcdc691b8f8da8ce8edfb970cc4aadde5860632cc59666aa'
            'da6ca65795a0ff8373ff59fd2adc12ab63417cb658feeda1da1fdd74c7d8401d'
            '6b39be7f0b173963396ce94e19201eec1ccca7801398be66f9bee6f0ced01df5'
            '823a282251c2754558c95ec1137bf2ab5672d3b47898ce6b8f8348daf8bb5c9f'
            'b481dcaa07d8b912b32066da4ee48341cb521852eb16d76a6cf7a8216402e101'
            'bd43b307d55a74bc64b88d95e1f37d0b12ddd2935563fc893835a91e2b8c10b5'
            '8349878d7e61819fe3da6e8a25c46c7dd66592c9a5736a7f66eb475c7a51068c'
            '027600188395ed3d721ed6f32c6fa954138fb25212154ceeadc2ff16076b1194')

prepare() {
  ln -sf "${_pkgname}-${pkgver}" llama.cpp

  # Qwen3.8-Flash-Next MTP, including standalone draft-head conversion/loading.
  patch -d "${_pkgname}" -Np1 --no-backup-if-mismatch -i "${srcdir}/qwen4exp-mtp-${_mtp_commit}.patch"
  patch -d "${_pkgname}" -Np1 --no-backup-if-mismatch -i "${srcdir}/qwen4exp-mtp-mixer-export-${_mtp_mixer_export_commit}.patch"
  patch -d "${_pkgname}" -Np1 --no-backup-if-mismatch -i "${srcdir}/qwen4exp-mtp-detached-head-${_mtp_detached_head_commit}.patch"

  # Qwen3.8 correctness fixes for multi-sequence QSA, vision, metadata, and 256K contexts.
  patch -d "${_pkgname}" -Np1 --no-backup-if-mismatch -i "${srcdir}/qwen4exp-followup-${_qwen4exp_followup_commit}.patch"
  patch -d "${_pkgname}" -Np1 --no-backup-if-mismatch -i "${srcdir}/qwen4exp-followup-post-${_qwen4exp_followup_head}.patch"

  # Match the reference GDN q/k normalization: x*rsqrt(sum(x^2)+eps).
  patch -d "${_pkgname}" -Np1 --no-backup-if-mismatch \
    -i "${srcdir}/gdn-norm-${_gdn_norm_commit}.patch"

  # Reprocess instead of aborting or retaining stale recurrent state when a
  # hybrid target or draft cannot roll back far enough.
  patch -d "${_pkgname}" -Np1 --no-backup-if-mismatch \
    -i "${srcdir}/server-recurrent-rollback-${_server_recurrent_rollback_commit}.patch"

  # Reject malformed top-level RPC graph nodes instead of dereferencing null.
  patch -d "${_pkgname}" -Np1 --no-backup-if-mismatch \
    -i "${srcdir}/rpc-invalid-graph-node-${_rpc_invalid_graph_node_commit}.patch"

  # Keep scheduler writes from racing direct ROCm_Host compute on Strix Halo.
  patch -d "${_pkgname}" -Np1 --no-backup-if-mismatch -i "${srcdir}/hip-apu-host-buffer-${_hip_apu_host_buffer_commit}.patch"

  # Keep wide QSA TOP_K on the GPU without breaking HIP graph capture on ROCm 7.2.
  patch -d "${_pkgname}" -Np1 --no-backup-if-mismatch -i "${srcdir}/hip-radix-top-k-${_hip_radix_top_k_commit}.patch"

  # Prefer hipCUB with rocPRIM >= 4.4; older ROCm keeps the native radix fallback.
  # The extracted source is untracked inside an AUR Git clone. Stop Git at
  # $srcdir so its subdirectory prefix cannot silently skip every patch path.
  GIT_CEILING_DIRECTORIES="${srcdir}" git -C "${_pkgname}" apply --no-index \
    --exclude='.github/workflows/build-cuda-ubuntu.yml' \
    --exclude='.github/workflows/hip-quality-check.yml' \
    --exclude='tests/test-backend-ops.cpp' \
    "${srcdir}/hipcub-rocm-${_hipcub_commit}.patch"

  # Queue the sparse PLE rows before each graph and support its 160-wide IQ4_NL
  # rows in the HIP GET_ROWS kernel. The small second patch hooks that row
  # prefetch into b10712's upstream lazy-tensor bookkeeping.
  GIT_CEILING_DIRECTORIES="${srcdir}" git -C "${_pkgname}" apply --no-index \
    --exclude='src/llama-model-loader.cpp' \
    --exclude='src/llama-model-loader.h' \
    "${srcdir}/qwen4exp-ple-row-prefetch-${_ple_row_prefetch_commit}.patch"
  patch -d "${_pkgname}" -Np1 --no-backup-if-mismatch \
    -i "${srcdir}/qwen4exp-ple-row-prefetch-b10712.patch"

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
    -DGGML_HIP_MMQ_MFMA=ON
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
