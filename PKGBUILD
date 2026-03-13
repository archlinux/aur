# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

pkgname=python-executorch
pkgver=1.1.0
pkgrel=1
pkgdesc="On-device AI across mobile, embedded and edge for PyTorch"
arch=(x86_64 aarch64)
license=(BSD-3-Clause)
url="https://github.com/pytorch/executorch"
depends=(
  python
  python-zstd
  python-certifi
  python-pyaml
  python-pip
  python-pytorch
  libstdc++
  libgcc
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
  python-cmake
  git
)
source=(
  "git+https://github.com/pytorch/executorch.git#tag=v${pkgver}"
  "executorch-FACTO::git+https://github.com/pytorch-labs/FACTO.git"
  "executorch-FP16::git+https://github.com/Maratyszcza/FP16.git"
  "executorch-FXdiv::git+https://github.com/Maratyszcza/FXdiv.git"
  "executorch-Vulkan-Headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git"
  "executorch-VulkanMemoryAllocator::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git"
  "executorch-XNNPACK::git+https://github.com/google/XNNPACK.git"
  "executorch-abseil-cpp::git+https://github.com/abseil/abseil-cpp.git"
  "executorch-ao::git+https://github.com/pytorch/ao.git"
  "executorch-buck2-prelude::git+https://github.com/facebook/buck2-prelude.git"
  "executorch-buck2-shims-meta::git+https://github.com/facebook/buck2-shims-meta.git"
  "executorch-cpuinfo::git+https://github.com/pytorch/cpuinfo.git"
  "executorch-cutlass::git+https://github.com/NVIDIA/cutlass.git"
  "executorch-eigen::git+https://gitlab.com/libeigen/eigen.git"
  "executorch-ethos-u-core-driver::git+https://git.gitlab.arm.com/artificial-intelligence/ethos-u/ethos-u-core-driver.git"
  "executorch-flatbuffers::git+https://github.com/google/flatbuffers.git"
  "executorch-flatcc::git+https://github.com/dvidelabs/flatcc.git"
  "executorch-gflags::git+https://github.com/gflags/gflags.git"
  "executorch-googletest::git+https://github.com/google/googletest.git"
  "executorch-ios-cmake::git+https://github.com/leetal/ios-cmake.git"
  "executorch-json::git+https://github.com/nlohmann/json.git"
  "executorch-pcre2::git+https://github.com/PCRE2Project/pcre2.git"
  "executorch-pocketfft::git+https://github.com/mreineck/pocketfft.git"
  "executorch-pthreadpool::git+https://github.com/google/pthreadpool.git"
  "executorch-pybind11::git+https://github.com/pybind/pybind11.git"
  "executorch-re2::git+https://github.com/google/re2.git"
  "executorch-sentencepiece::git+https://github.com/google/sentencepiece.git"
  "executorch-sljit::git+https://github.com/zherczeg/sljit.git"
  "executorch-tokenizers::git+https://github.com/meta-pytorch/tokenizers.git"
  "executorch-volk::git+https://github.com/zeux/volk.git"
  Don-t-require-CMake-below-4.0.patch
  Don-t-add-gflags-submodule.patch
  Absolutely-do-not-allow-Werror.patch
)
sha512sums=('256d036a050db9dd63f6dd6c3eed90571330847c14c01e6d4b4c818e55edc317bcc14e48d8902f1540b1462552002a2ce7c2685dc936b01ec229ef55bef63aea'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '01205a460585fcddba0fadbc062e1a4e97bd63778b0e0877c5e7e94b2ff5faddaa1aa66231a619a8a8d1c171ef5c0acd62fbe3a47ec1f40f51b271db72edab22'
            'd2b78a40f17d0ad1e457c594b122d0d1926c4aa0de6e8fba8ddcc191722805a49983e5df6fd1f54f152601b14d6c564f0c22ac6def844be88140a9889c554ea9'
            '4ce61907404eef429d68b8bd88cb029ac201187c09ba9fc4a39266fd59461fa8c9bacd7be4b3c64b003c097b8f7b706328eecc2b030e6d1c4c93d5bae66a2a09')

prepare() {
  cd "${srcdir}/executorch"

  git submodule init

  git config submodule."backends/arm/third-party/ethos-u-core-driver".url "${srcdir}/executorch-ethos-u-core-driver"
  git config submodule."backends/vulkan/third-party/Vulkan-Headers".url "${srcdir}/executorch-Vulkan-Headers"
  git config submodule."backends/vulkan/third-party/VulkanMemoryAllocator".url "${srcdir}/executorch-VulkanMemoryAllocator"
  git config submodule."backends/vulkan/third-party/volk".url "${srcdir}/executorch-volk"
  git config submodule."backends/xnnpack/third-party/FP16".url "${srcdir}/executorch-FP16"
  git config submodule."backends/xnnpack/third-party/FXdiv".url "${srcdir}/executorch-FXdiv"
  git config submodule."backends/xnnpack/third-party/XNNPACK".url "${srcdir}/executorch-XNNPACK"
  git config submodule."backends/xnnpack/third-party/cpuinfo".url "${srcdir}/executorch-cpuinfo"
  git config submodule."backends/xnnpack/third-party/pthreadpool".url "${srcdir}/executorch-pthreadpool"
  git config submodule."extension/llm/tokenizers".url "${srcdir}/executorch-tokenizers"
  git config submodule."kernels/optimized/third-party/eigen".url "${srcdir}/executorch-eigen"
  git config submodule."third-party/flatbuffers".url "${srcdir}/executorch-flatbuffers"
  git config submodule."third-party/flatcc".url "${srcdir}/executorch-flatcc"
  git config submodule."third-party/gflags".url "${srcdir}/executorch-gflags"
  git config submodule."third-party/googletest".url "${srcdir}/executorch-googletest"
  git config submodule."third-party/ios-cmake".url "${srcdir}/executorch-ios-cmake"
  git config submodule."third-party/prelude".url "${srcdir}/executorch-buck2-prelude"
  git config submodule."third-party/pybind11".url "${srcdir}/executorch-pybind11"
  git config submodule."third-party/ao".url "${srcdir}/executorch-ao"
  git config submodule."backends/cadence/utils/FACTO".url "${srcdir}/executorch-FACTO"
  git config submodule."third-party/pocketfft".url "${srcdir}/executorch-pocketfft"
  git config submodule."shim".url "${srcdir}/executorch-buck2-shims-meta"
  git config submodule."third-party/json".url "${srcdir}/executorch-json"
  git config submodule."third-party/json".url "${srcdir}/executorch-json"
  git config submodule."third_party/cutlass".url "${srcdir}/executorch-cutlass"
  git config submodule."third-party/sentencepiece".url "${srcdir}/executorch-sentencepiece"
  git config submodule."third-party/re2".url "${srcdir}/executorch-re2"
  git config submodule."third-party/abseil-cpp".url "${srcdir}/executorch-abseil-cpp"
  git config submodule."third-party/pcre2".url "${srcdir}/executorch-pcre2"
  git config submodule."deps/sljit".url "${srcdir}/executorch-sljit"

  git -c protocol.file.allow=always submodule update --init --recursive

  patch -Np1 -i ../Don-t-require-CMake-below-4.0.patch
  patch -Np1 -i ../Don-t-add-gflags-submodule.patch
  patch -Np1 -i ../Absolutely-do-not-allow-Werror.patch

  # Grab cstdint include from main branch in sentencepiece
  cd "${srcdir}/executorch/extension/llm/tokenizers/third-party/sentencepiece"
  git cherry-pick -n c4221363d1f004f85f9cc4096e601d6b1fbfaa84

  # Dereference symlink hack (done for editable installs), the build module does not follow them.
  cd "${srcdir}/executorch"
  cp -rL src/executorch src/executorch_nolink
  rm -rf src/executorch
  mv src/executorch_nolink src/executorch
}

build() {
  cd executorch

  export CMAKE_ARGS="-DEXECUTORCH_BUILD_COREML=OFF"

  python -m build --wheel --no-isolation
}

package() {
  cd executorch
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # Remove flatc provided by the flatbuffers package and empty bin directory
  rm -fR "$pkgdir/usr/bin"
}
