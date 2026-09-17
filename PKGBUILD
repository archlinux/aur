# Maintainer: Orion-zhen <https://github.com/Orion-zhen>
# Contributer: darkbasic <niccolo.belli@linuxsystems.it>

pkgname=llama.cpp-hip-gfx1151
_pkgname=llama.cpp
pkgver=b11012
pkgrel=1
_upstream_commit=35822afe58475e0506cd51e6573903e46d4c67c9
_mtp_commit=1d8de7c1b0c7d2febf8f983174d8e6a711e2b1af
_mtp_mixer_export_commit=57bb668674d9fb0d382885e5b04911c6437f8e83
_mtp_gate_up_skip_commit=23ea9861b1f91b162d8b643f95ab4065d6d72942
_mtp_reset_commit=7abbba20a8ac5bf32477bfd7cd6fa6061067e590
_server_recurrent_rollback_commit=13e4cfe53ff3dc2e786a9264ee552da53e0a41c4
_ggml_nbytes_overflow_commit=0a2e89adb99d86cf11d694327b942e9408a1b769
_hipcub_base_commit=d7bd3bfcad3e29c7e49fd26f38c79ee3e9a3fd6b
_hipcub_commit=861abb2b2e333744d565e07985de8f6f6feaff65
_ple_row_prefetch_commit=c911e6bb5eb956a759e740fb14db8ca639b7d3e7
_rdna35_mmq_commit=c6381ea95667b5b7a98a709ec6c1e47135928f5f

_gguf_pad_base=56381e407c0ccfb3a6f71e668a27a901001d22ce
_gguf_pad_commit=6e2139f57931ab7a9ca18cd5d502556a54e6248e
_hip_padding_stream_commit=678a3f9f8e137e68a69777b7e6aca4ad02be0754
_nemotron_mtp_latent_commit=d99608f83cf2e0288d2f190532e4fbedd098e841
_mrope_auto_pos_commit=de4f4bb77774f760f20d08339fd7e1e458f465b6

# GitHub can regenerate diff headers without changing the pinned commits.
# Include each checksum in its source alias so yay/paru/SRCDEST caches fetch
# changed bytes instead of reusing an older file and failing verification.
_mtp_sha256=2589fda61cee19deba67d44ed8e4988cf12d3ba2efa2a4b6fe886d5bacc79602
_mtp_mixer_export_sha256=e0e465911f38e86dc4719c6a4d927d59176813ee29a6bd321bc95cfc0a13c707
_mtp_gate_up_skip_sha256=9dba403be4528686fbb6e303ef40b71d762466faa248cc7f11cbd13ed55e7370
_mtp_reset_sha256=f6751cb25e7b389e64811e7a1a8f69117f9af85a5c2cb791e3107aae285fb6e8
_server_recurrent_rollback_sha256=5600f12e0aa4128884d2d83d22f4d06a1a71ed40b8fb092783f6bab2cf617647
_ggml_nbytes_overflow_sha256=594912e3c8d471e8203c1c849bb0cb0ddad9639d85cf091f3c0ced4e89d59caf
_hipcub_sha256=cb7c9ce5a13cd6f72ebd056dbdba8b9fd908e627fef031e24059e79aec2bfb24
_ple_row_prefetch_sha256=0f8c6be00fcc7d59c0c67ed205f3b71bba9a9e9ee7b3350fac4d234e92ede069
_rdna35_mmq_sha256=9226be6cbdf00d7963321b395374dcc58a7386c7cba75db7a42aed3e60725834
_gguf_pad_sha256=2b7db3852d8c5f4d8a54b82fb3edd7eafc8b24fd8b8235baf82fbe8df246efc8
_hip_padding_stream_sha256=658e5eea1a342f78b024d57678d85dd6756b34798111581dac2d518f644453e0
_nemotron_mtp_latent_sha256=87969161074cfa3cc9cfcaf3a398142686e03ceca34789749d02f2bd4a90661e
_mrope_auto_pos_sha256=c96c58a32d9785a96522e29f0b455d650c6f2ca8c5f2dbc43f4db2e5616f68fd
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
  "qwen4exp-mtp-${_mtp_commit}-${_mtp_sha256}.patch::https://github.com/ggml-org/llama.cpp/compare/e70802a01f03f0ed31a26338a5664796f3824371...${_mtp_commit}.diff"
  "qwen4exp-mtp-mixer-export-${_mtp_mixer_export_commit}-${_mtp_mixer_export_sha256}.patch::https://github.com/rmonsurate/llama.cpp/commit/${_mtp_mixer_export_commit}.diff"
  "qwen4exp-mtp-b11012-r1.patch"
  "qwen4exp-mtp-mixed-f16-b11012.patch"
  # Provenance: https://github.com/ggml-org/llama.cpp/commit/23ea9861b1f91b162d8b643f95ab4065d6d72942
  "mtp-gate-up-skip-${_mtp_gate_up_skip_commit}-${_mtp_gate_up_skip_sha256}-local.patch"
  "nemotron-mtp-latent-${_nemotron_mtp_latent_commit}-${_nemotron_mtp_latent_sha256}.patch::https://github.com/ggml-org/llama.cpp/commit/${_nemotron_mtp_latent_commit}.diff"
  "mtp-reset-sequence-${_mtp_reset_commit}-${_mtp_reset_sha256}.patch::https://github.com/ggml-org/llama.cpp/commit/${_mtp_reset_commit}.diff"
  "server-recurrent-rollback-${_server_recurrent_rollback_commit}-${_server_recurrent_rollback_sha256}.patch::https://github.com/ggml-org/llama.cpp/commit/${_server_recurrent_rollback_commit}.diff"
  "ggml-nbytes-overflow-${_ggml_nbytes_overflow_commit}-${_ggml_nbytes_overflow_sha256}.patch::https://github.com/ggml-org/llama.cpp/commit/${_ggml_nbytes_overflow_commit}.diff"
  "gguf-padding-overflow-${_gguf_pad_commit}-${_gguf_pad_sha256}.patch::https://github.com/ggml-org/llama.cpp/compare/${_gguf_pad_base}...${_gguf_pad_commit}.diff"
  "gguf-padding-test-b11012.patch"
  "rpc-invalid-graph-node-b11012.patch"
  "rpc-graph-shape-validation-b11012.patch"
  "hipcub-rocm-${_hipcub_commit}-${_hipcub_sha256}.patch::https://github.com/ggml-org/llama.cpp/compare/${_hipcub_base_commit}...${_hipcub_commit}.diff"
  "rdna35-mmq-${_rdna35_mmq_commit}-${_rdna35_mmq_sha256}.patch::https://github.com/ggml-org/llama.cpp/commit/${_rdna35_mmq_commit}.diff"
  "hip-padding-stream-${_hip_padding_stream_commit}-${_hip_padding_stream_sha256}.patch::https://github.com/ggml-org/llama.cpp/commit/${_hip_padding_stream_commit}.diff"
  # Exact upstream snapshot; do not depend on GitHub's generated diff bytes.
  # Provenance: https://github.com/ggml-org/llama.cpp/commit/de4f4bb77774f760f20d08339fd7e1e458f465b6
  "mrope-auto-pos-${_mrope_auto_pos_commit}-${_mrope_auto_pos_sha256}-local.patch"
  "qwen4exp-ple-row-prefetch-${_ple_row_prefetch_commit}-${_ple_row_prefetch_sha256}.patch::https://github.com/Aristo94/EngramHalo.cpp/commit/${_ple_row_prefetch_commit}.diff"
  "qwen4exp-ple-row-prefetch-b11012.patch"
  "json-schema-numeric-bounds-b11012.patch"
  "minicpmv-position-buckets-b11012.patch"
  # 提升性能的妙妙工具
  # "llama-gfx1151.patch::https://gist.githubusercontent.com/pedapudi/0da060d2a3b49a51155dbf00db61fea0/raw/aaaee0a96656ec0fc49bdfa76acd2b4edbfcbfb9/gistfile1.txt"
  "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.service"
  "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.conf"
  "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.sysusers"
  "https://raw.githubusercontent.com/Orion-zhen/aur-packages/refs/heads/main/assets/llama.cpp/llama.cpp.tmpfiles"
)
sha256sums=('15362b51add6199696712558a17ebb3f1a0f2748c4e18b43c41800d6f903c363'
            "${_mtp_sha256}"
            "${_mtp_mixer_export_sha256}"
            'e00850339eeae56709214b94b821da8f552551ed79128b31aac1a980a234cdc6'
            '443a8f61ee2c47583b3ae84f8e939c4db30795a5f0f1dd6f616a9c80545b9e7f'
            "${_mtp_gate_up_skip_sha256}"
            "${_nemotron_mtp_latent_sha256}"
            "${_mtp_reset_sha256}"
            "${_server_recurrent_rollback_sha256}"
            "${_ggml_nbytes_overflow_sha256}"
            "${_gguf_pad_sha256}"
            '53b3878a21df16e89b2e3d517bc21db6db9d8d7f60a59766bdc4ccfa9c0e27ee'
            '89eabc990093948d665bc8fffde6869289332a5293b6e5daa47ab5e70a121192'
            '3ec977386690fb7f17271ae424b518a2d56abba98ba77f0e2d5ff5e781996b53'
            "${_hipcub_sha256}"
            "${_rdna35_mmq_sha256}"
            "${_hip_padding_stream_sha256}"
            "${_mrope_auto_pos_sha256}"
            "${_ple_row_prefetch_sha256}"
            'c9a901b691ada5f66e0ad8b90bbc8268438aad4f2036daf65aa45ca7341cd983'
            '8eaa0a0528e7d3a397c7cb646f8e5022958a102d9c380971e6bebcaef5c5e813'
            '1739392b6f5d43db80af3aaa96eaca7a72dbe87baf5993939ec02850a019e081'
            'b481dcaa07d8b912b32066da4ee48341cb521852eb16d76a6cf7a8216402e101'
            'bd43b307d55a74bc64b88d95e1f37d0b12ddd2935563fc893835a91e2b8c10b5'
            '8349878d7e61819fe3da6e8a25c46c7dd66592c9a5736a7f66eb475c7a51068c'
            '027600188395ed3d721ed6f32c6fa954138fb25212154ceeadc2ff16076b1194')

prepare() {
  ln -sf "${_pkgname}-${pkgver}" llama.cpp

  # b11012 inherits #28549: separate graph arenas by output/no-output mode.

  # Qwen3.8-Flash-Next MTP. b11012 includes merged #27941 and #28896.
  # Apply non-overlapping files, then rebase the MTP graph and detached-head
  # commit a82a58a while retaining the upstream loader and norm-fusion changes.
  GIT_CEILING_DIRECTORIES="${srcdir}" git -C "${_pkgname}" apply --no-index \
    --exclude='src/llama-arch.h' \
    --exclude='src/models/qwen4exp.cpp' \
    "${srcdir}/qwen4exp-mtp-${_mtp_commit}-${_mtp_sha256}.patch"
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch -i "${srcdir}/qwen4exp-mtp-mixer-export-${_mtp_mixer_export_commit}-${_mtp_mixer_export_sha256}.patch"
  GIT_CEILING_DIRECTORIES="${srcdir}" git -C "${_pkgname}" apply --no-index \
    "${srcdir}/qwen4exp-mtp-b11012-r1.patch"

  # Keep valid F16 integrated-head gamma tensors from entering unsupported
  # F32 x F16 binary-op dispatch in the CPU or shared HIP/CUDA backend.
  GIT_CEILING_DIRECTORIES="${srcdir}" git -C "${_pkgname}" apply --no-index \
    "${srcdir}/qwen4exp-mtp-mixed-f16-b11012.patch"

  # PR #29014: do not load fused expert gate/up weights in skipped MTP layers.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/mtp-gate-up-skip-${_mtp_gate_up_skip_commit}-${_mtp_gate_up_skip_sha256}-local.patch"

  # PR #28764: load and use the optional Nemotron MTPv2 latent FFN pair.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/nemotron-mtp-latent-${_nemotron_mtp_latent_commit}-${_nemotron_mtp_latent_sha256}.patch"
  # b11012 includes merged #28779's missing-NextN-metadata guard.

  # A fresh sequence must not inherit a prior request's pending MTP carrier.
  # This is the narrow reset from PR #28333; it does not relax --np 1.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/mtp-reset-sequence-${_mtp_reset_commit}-${_mtp_reset_sha256}.patch"

  # b11012 includes merged #28749's early rollback-capability probe.

  # Upstream #28330 now omits Qwen4-Exp's unused indexer V cache.

  # Reprocess instead of aborting or retaining stale recurrent state when a
  # hybrid target or draft cannot roll back far enough.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/server-recurrent-rollback-${_server_recurrent_rollback_commit}-${_server_recurrent_rollback_sha256}.patch"

  # Avoid a pre-division size wrap for malformed block-quantized tensors.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/ggml-nbytes-overflow-${_ggml_nbytes_overflow_commit}-${_ggml_nbytes_overflow_sha256}.patch"

  # PR #28810 (recovered #24759): checked GGUF padding and native regression.
  # The follow-up removes a redundant assertion; metadata validation remains.
  GIT_CEILING_DIRECTORIES="${srcdir}" git -C "${_pkgname}" apply --no-index \
    --exclude='tests/test-gguf.cpp' \
    "${srcdir}/gguf-padding-overflow-${_gguf_pad_commit}-${_gguf_pad_sha256}.patch"
  # Preserve the newer zero-dimension test in the exact-context test rebase.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/gguf-padding-test-b11012.patch"

  # Upstream #28739 already skips empty expert-ID tensors before offload.

  # Reject malformed top-level RPC graph nodes instead of dereferencing null.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/rpc-invalid-graph-node-b11012.patch"

  # Extend PR #26933 after the preceding null-node guard without fuzzy patching.
  # Mirror the complete SET_ROWS/GET_ROWS constructor invariants before RPC
  # execution; the PR's original two checks had ASan-confirmed bypasses.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/rpc-graph-shape-validation-b11012.patch"

  # Upstream #28604 now disables direct host-buffer compute on HIP itself;
  # the former #25863 capability workaround is no longer needed.

  # Prefer hipCUB with rocPRIM >= 4.4; older ROCm keeps b11012's upstream
  # native HIP radix fallback.
  # The extracted source is untracked inside an AUR Git clone. Stop Git at
  # $srcdir so its subdirectory prefix cannot silently skip every patch path.
  GIT_CEILING_DIRECTORIES="${srcdir}" git -C "${_pkgname}" apply --no-index \
    --exclude='.github/workflows/build-cuda-ubuntu.yml' \
    --exclude='.github/workflows/hip-quality-check.yml' \
    --exclude='tests/test-backend-ops.cpp' \
    "${srcdir}/hipcub-rocm-${_hipcub_commit}-${_hipcub_sha256}.patch"

  # Reviewed gfx1151 MMQ tile tuning (#28195); IQ4_XS entries are unchanged.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/rdna35-mmq-${_rdna35_mmq_commit}-${_rdna35_mmq_sha256}.patch"

  # PR #28782: avoid legacy-stream padding memset during parallel HIP capture.
  # Keep the synchronous return contract; omit the unrelated CI follow-up.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/hip-padding-stream-${_hip_padding_stream_commit}-${_hip_padding_stream_sha256}.patch"

  # Restore upstream FA selection: the reporter withdrew the #28102 attribution.
  # b11012 also includes #28882's cache-line fix and #28892's PCH removal.

  # PR #28910: allocate all auto-generated M-RoPE position sections.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/mrope-auto-pos-${_mrope_auto_pos_commit}-${_mrope_auto_pos_sha256}-local.patch"

  # Queue the sparse PLE rows before each graph and support its 160-wide IQ4_NL
  # rows in the HIP GET_ROWS kernel. The small second patch hooks that row
  # prefetch into b11012's upstream lazy-tensor bookkeeping.
  GIT_CEILING_DIRECTORIES="${srcdir}" git -C "${_pkgname}" apply --no-index \
    --exclude='src/llama-model-loader.cpp' \
    --exclude='src/llama-model-loader.h' \
    "${srcdir}/qwen4exp-ple-row-prefetch-${_ple_row_prefetch_commit}-${_ple_row_prefetch_sha256}.patch"
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/qwen4exp-ple-row-prefetch-b11012.patch"

  # b11012 inherits #28869: preserve the newline when forcing reasoning to end.

  # b11012 includes #28646 tools-probe caching, #28747 framing and #28787 HTTP.

  # Guard numeric narrowing/overflow inherited with #28736's schema parser.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/json-schema-numeric-bounds-b11012.patch"

  # Issue #27166: ordinary thin MiniCPM-V images can exceed 1024 patches.
  patch -d "${_pkgname}" -Np1 --fuzz=0 --no-backup-if-mismatch \
    -i "${srcdir}/minicpmv-position-buckets-b11012.patch"

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

    -DGGML_CUDA_FA_QUANTS=all
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
