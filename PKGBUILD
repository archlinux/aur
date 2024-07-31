# Maintainer: Daniel Bermond <dbermond@archlinux.org>

# only Intel GPUs are supported:
# https://github.com/openvinotoolkit/openvino/issues/452#issuecomment-722941119

pkgname=openvino-git
pkgver=2024.3.0.r173.g3e058b90a89
pkgrel=1
pkgdesc='A toolkit for developing artificial inteligence and deep learning applications (git version)'
arch=('x86_64')
url='https://docs.openvinotoolkit.org/'
license=('Apache-2.0')
depends=('pugixml' 'onetbb')
optdepends=('intel-compute-runtime: for Intel GPU plugin'
            'ocl-icd: for Intel GPU plugin'
            'level-zero-loader: for Intel NPU plugin'
            'snappy: for tensorflow frontend'
            'python: for Python API'
            'python-numpy: for Python API'
            'python-packaging: for Python API'
            'python-pillow: for Python API')
makedepends=('git' 'git-lfs' 'cmake' 'opencl-clhpp' 'opencl-headers' 'ocl-icd' 'opencv'
             'snappy' 'python' 'python-setuptools' 'fdupes' 'patchelf' 'shellcheck')
provides=('openvino' 'intel-openvino-git')
conflicts=('openvino' 'intel-openvino-git')
replaces=('intel-openvino-git')
options=('!emptydirs')
source=('git+https://github.com/openvinotoolkit/openvino.git'
        'oneDNN-openvinotoolkit'::'git+https://github.com/openvinotoolkit/oneDNN.git'
        'git+https://github.com/herumi/xbyak.git'
        'git+https://github.com/madler/zlib.git'
        'git+https://github.com/zeux/pugixml.git'
        'git+https://github.com/gflags/gflags.git'
        'googletest-openvinotoolkit'::'git+https://github.com/openvinotoolkit/googletest.git'
        'git+https://github.com/KhronosGroup/OpenCL-ICD-Loader.git'
        'git+https://github.com/KhronosGroup/OpenCL-Headers.git'
        'git+https://github.com/KhronosGroup/OpenCL-CLHPP.git'
        'git+https://github.com/onnx/onnx.git'
        'git+https://github.com/protocolbuffers/protobuf.git'
        'git+https://github.com/pybind/pybind11.git'
        'git+https://github.com/intel/ittapi.git'
        'git+https://github.com/nithinn/ncc.git'
        'git+https://github.com/oneapi-src/oneDNN.git'
        'git+https://github.com/openvinotoolkit/open_model_zoo.git'
        'git+https://github.com/nlohmann/json.git'
        'git+https://github.com/google/flatbuffers.git'
        'git+https://github.com/google/snappy.git'
        'git+https://github.com/ARM-software/ComputeLibrary.git'
        'git+https://github.com/openvinotoolkit/mlas.git'
        'git+https://github.com/oneapi-src/level-zero.git'
        'git+https://github.com/intel/level-zero-npu-extensions.git'
        'git+https://github.com/openvinotoolkit/telemetry.git'
        'git+https://github.com/libxsmm/libxsmm.git'
        'git+https://github.com/openvinotoolkit/shl.git'
        'openvino.conf'
        'setupvars.sh'
        '010-openvino-disable-werror.patch'
        '020-openvino-use-protobuf-shared-libs.patch'
        '030-openvino-level-zero-disable-werror.patch')
sha256sums=('SKIP'
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
            '335a55533ab26bd1f63683921baf33b8e8e3f2732a94554916d202ee500f90af'
            'e5024ad3382f285fe63dc58faca379f11a669bbe9f5d90682c59ad588aab434c'
            '0bbf46bef304dea08b318d1ffd564735b19e1afb6c0f41c98d216824cc630132'
            '9c10b6d9cc6ba4722fae449f401875c538d5aa544d89edf3260fe766f946dbb8'
            '51dc09683a319f9a939369d47d6752b41fea61737e6886a5814fc75f3dc1cef1')

export GIT_LFS_SKIP_SMUDGE='1'

prepare() {
    git -C openvino lfs install --local
    git -C openvino lfs pull "${source[0]/git+/}"
    
    git -C openvino submodule init
    git -C openvino config --local submodule.src/plugins/intel_cpu/thirdparty/onednn.url "${srcdir}/oneDNN-openvinotoolkit"
    git -C openvino config --local submodule.thirdparty/xbyak.url "${srcdir}/xbyak"
    git -C openvino config --local submodule.thirdparty/zlib/zlib.url "${srcdir}/zlib"
    git -C openvino config --local submodule.thirdparty/pugixml.url "${srcdir}/pugixml"
    git -C openvino config --local submodule.thirdparty/gflags/gflags.url "${srcdir}/gflags"
    git -C openvino config --local submodule.thirdparty/gtest/gtest.url "${srcdir}/googletest-openvinotoolkit"
    git -C openvino config --local submodule.thirdparty/ocl/icd_loader.url "${srcdir}/OpenCL-ICD-Loader"
    git -C openvino config --local submodule.thirdparty/ocl/cl_headers.url "${srcdir}/OpenCL-Headers"
    git -C openvino config --local submodule.thirdparty/ocl/clhpp_headers.url "${srcdir}/OpenCL-CLHPP"
    git -C openvino config --local submodule.thirdparty/onnx.url "${srcdir}/onnx"
    git -C openvino config --local submodule.thirdparty/protobuf.url "${srcdir}/protobuf"
    git -C openvino config --local submodule.src/bindings/python/thirdparty/pybind11.url "${srcdir}/pybind11"
    git -C openvino config --local submodule.thirdparty/ittapi/ittapi.url "${srcdir}/ittapi"
    git -C openvino config --local submodule.ncc.url "${srcdir}/ncc"
    git -C openvino config --local submodule.thirdparty/onednn_gpu.url "${srcdir}/oneDNN"
    git -C openvino config --local submodule.tools/pot/thirdparty/open_model_zoo.url "${srcdir}/open_model_zoo"
    git -C openvino config --local submodule.thirdparty/json/nlohmann_json.url "${srcdir}/json"
    git -C openvino config --local submodule.thirdparty/flatbuffers/flatbuffers.url "${srcdir}/flatbuffers"
    git -C openvino config --local submodule.thirdparty/snappy.url "${srcdir}/snappy"
    git -C openvino config --local submodule.ARMComputeLibrary.url "${srcdir}/ComputeLibrary"
    git -C openvino config --local submodule.src/plugins/intel_cpu/thirdparty/mlas.url "${srcdir}/mlas"
    git -C openvino config --local submodule.src/plugins/intel_npu/thirdparty/level-zero.url "${srcdir}/level-zero"
    git -C openvino config --local submodule.src/plugins/intel_npu/thirdparty/level-zero-ext.url "${srcdir}/level-zero-npu-extensions"
    git -C openvino config --local submodule.thirdparty/telemetry.url "${srcdir}/telemetry"
    git -C openvino config --local submodule.src/plugins/intel_cpu/thirdparty/libxsmm.url "${srcdir}/libxsmm"
    git -C openvino config --local submodule.src/plugins/intel_cpu/thirdparty/shl.url "${srcdir}/shl"
    git -C openvino -c protocol.file.allow='always' submodule update
    
    patch -d openvino -Np1 -i "${srcdir}/010-openvino-disable-werror.patch"
    patch -d openvino -Np1 -i "${srcdir}/020-openvino-use-protobuf-shared-libs.patch"
    patch -d openvino/src/plugins/intel_npu/thirdparty/level-zero -Np1 -i "${srcdir}/030-openvino-level-zero-disable-werror.patch"
}

pkgver() {
    local _version
    _version="$(git -C openvino tag --list | grep '^[[:digit:]]' | sed '/dev/d' | sort -r | head -n1)"
    printf '%s.r%s.g%s' "$_version" \
                        "$(git -C openvino rev-list --count "${_version}..HEAD")" \
                        "$(git -C openvino rev-parse --short HEAD)"
}

build() {
    # fix warning: "_FORTIFY_SOURCE" redefined
    # note: upstream forces _FORTIFY_SOURCE=2
    export CFLAGS="${CFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    export CXXFLAGS="${CXXFLAGS/-Wp,-D_FORTIFY_SOURCE=?/}"
    
    # note: does not accept 'None' build type
    cmake -B build -S openvino \
        -G 'Unix Makefiles' \
        -DBUILD_TESTING:BOOL='OFF' \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='/opt/intel/openvino' \
        -DENABLE_SSE42:BOOL='OFF' \
        -DENABLE_AVX2:BOOL='OFF' \
        -DENABLE_AVX512F:BOOL='OFF' \
        -DENABLE_PYTHON:BOOL='ON' \
        -DENABLE_CLANG_FORMAT:BOOL='OFF' \
        -DENABLE_NCC_STYLE:BOOL='OFF' \
        -DENABLE_SYSTEM_PUGIXML:BOOL='ON' \
        -DENABLE_SYSTEM_TBB:BOOL='ON' \
        -DENABLE_SYSTEM_OPENCL:BOOL='ON' \
        -DENABLE_SYSTEM_PROTOBUF:BOOL='OFF' \
        -DENABLE_SYSTEM_FLATBUFFERS:BOOL='OFF' \
        -DENABLE_SYSTEM_SNAPPY:BOOL='ON' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 openvino.conf -t "${pkgdir}/etc/ld.so.conf.d"
}
