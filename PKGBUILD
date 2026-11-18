# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
pkgname=rocm-bin
pkgdesc="ROCm Core SDK - Multi Arch"
pkgver=10.2.0
pkgrel=1
epoch=0
arch=('x86_64')
url='https://www.amd.com'
license=('custom:AMD')
depends=('ocl-icd' 'gcc-libs')
provides=('opencl-driver' 'amdrocm-amdsmi' 'amdrocm-llvm' 'amdrocm-runtime' 'amdrocm-fft' 'amdrocm-blas' 'amdrocm-sparse' 'amdrocm-solver' 'amdrocm-dnn' 'amdrocm-rand' 'amdrocm-ccl' 'amdrocm-profiler' 'amdrocm-profiler-base' 'amdrocm-base' 'amdrocm-ck'
'amdrocm-debugger' 'amdrocm-hipify' 'amdrocm-opencl' 'amdrocm-decode' 'amdrocm-jpeg' 'amdrocm-rccl' 'amdrocm-rocshmem' 'amdrocm-rdc' 'amdrocm-sysdeps' 'rocm' 'rocm-core' 'comgr' 'rocm-hip' 'hip' 'hsa-rocr' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl-icd-loader' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb' 'rocprofiler' 'rocprofiler-plugins' 'rocprofiler-register'
'roctracer' 'hsa-amd-aqlprofile' 'rocm-openmp' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-smi-lib' 'amdsmi' 'amd-smi-lib' 'composable-kernel' 'hipcc' 'rocm-llvm' 'rocblas' 'rocsolver' 'half' 'hipblas' 'hipblas-common' 'hipblaslt' 'hiprand' 'rocdecode' 'rocjpeg' 'rocprim' 'hipcub'
'rocfft' 'hipfft' 'hipify-clang' 'hipsolver' 'rocsparse' 'hipsparse' 'hipsparselt' 'hiptensor' 'openmp-extras-dev' 'rccl' 'rocalution' 'rocrand' 'rocm-hip-libraries' 'rocthrust' 'rocprofiler-compute' 'rocprofiler-debug' 'rocprofiler-systems' 'rocm-hip-sdk' 'rocm-opencl'
'rocm-opencl-runtime' 'rocm-opencl-sdk' 'rocwmma' 'rocprofiler-sdk' 'rocprofiler-sdk-roctx' 'rocprofiler-sdk-rocpd' 'rocm-developer-tools' 'rocshmem' 'miopen' 'miopen-hip' 'rocm-ml-libraries' 'rocm-ml-sdk')
conflicts=('opencl-amd' 'opencl-amd-dev' 'rocm-gfx101x-bin' 'rocm-gfx103x-bin' 'rocm-gfx110x-bin' 'rocm-gfx120x-bin' 'rocm-gfx1150-bin' 'rocm-gfx1151-bin' 'rocm-gfx1152-bin' 'rocm-gfx1153-bin' 'rocm-opencl-runtime' 'rocm' 'rocm-core' 'comgr' 'rocm-hip' 'hip' 'hsa-rocr' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl-icd-loader' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb'
'rocprofiler' 'rocprofiler-plugins' 'rocprofiler-register' 'roctracer' 'hsa-amd-aqlprofile' 'rocm-openmp' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-smi-lib' 'amdsmi' 'amd-smi-lib' 'composable-kernel' 'hipcc' 'rocm-llvm' 'rocblas' 'rocsolver' 'hipblas' 'hipblas-common' 'hipblaslt' 'hiprand' 'rocdecode' 'rocjpeg' 'rocprim' 'hipcub' 'rocfft' 'hipfft' 'hipify-clang' 'hipsolver' 'rocsparse' 'hipsparse' 'hipsparselt' 'hiptensor' 'rccl' 'rocalution' 'rocrand' 'rocm-hip-libraries' 'rocthrust' 'rocprofiler-compute' 'rocprofiler-debug' 'rocprofiler-systems' 'rocm-hip-sdk' 'rocm-opencl' 'rocm-opencl-runtime' 'rocm-opencl-sdk' 'rocwmma' 'rocprofiler-sdk' 'rocprofiler-sdk-roctx' 'rocprofiler-sdk-rocpd' 'rocm-developer-tools' 'rocshmem' 'miopen' 'miopen-hip' 
'rocm-ml-libraries' 'rocm-ml-sdk')
optdepends=('clinfo')
options=('!strip')
noextract=("therock-dist-linux-multiarch-10.2.0.tar.gz")

source=(
"https://stable.repo.amd.com/rocm/core/tarball/therock-dist-linux-multiarch-10.2.0.tar.gz"
)

sha256sums=(
"6ac0b54de1a410b9727c37607c4c2cb6b4795c3db0a9b01393bccc8d8d01e87b"
)

prepare() {
    mkdir -p "${srcdir}/opt/rocm"
    bsdtar xf therock-dist-linux-multiarch-10.2.0.tar.gz -C ${srcdir}/opt/rocm
}

package() {
    mv "${srcdir}/opt/" "${pkgdir}/"

    mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
    cd "${pkgdir}/opt/amdgpu/share/libdrm"
    ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids

    mkdir -p "${pkgdir}/etc/OpenCL/vendors"
    echo /opt/rocm/lib/opencl/libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"

    mkdir -p "${pkgdir}/etc/ld.so.conf.d"
    echo /opt/rocm/lib >> "$pkgdir/etc/ld.so.conf.d/rocm-bin.conf"

    mkdir -p "${pkgdir}/opt/rocm"
    cd "${pkgdir}/opt/rocm"

    mkdir -p "${pkgdir}/etc/profile.d"
    echo export PATH="\${PATH}:/opt/rocm/bin:/opt/rocm/lib/llvm/bin" > "$pkgdir/etc/profile.d/rocm-bin.sh"
}
