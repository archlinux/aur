# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://rocm.docs.amd.com/en/7.10.0-preview/about/release-notes.html
pkgname=rocm-gfx110x-bin
pkgdesc="ROCm Core SDK and TheRock Build System - RDNA3"
pkgver=7.10.0pre
pkgrel=2
epoch=0
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
makedepends=('wget')
depends=('libdrm' 'ocl-icd' 'gcc-libs' 'numactl' 'suitesparse' 'blas' 'lapack')
provides=('opencl-driver' 'rocm' 'rocm-core' 'comgr' 'rocm-hip' 'hip' 'hsa-rocr' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl-icd-loader' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb' 'rocprofiler' 'rocprofiler-plugins' 'rocprofiler-register' 'roctracer' 'hsa-amd-aqlprofile' 'rocm-openmp' 'openmp-extras-runtime'
'rocm-cmake' 'rocm-smi-lib' 'amdsmi' 'amd-smi-lib' 'composable-kernel' 'hipcc' 'rocm-llvm' 'rocblas' 'rocsolver' 'half' 'hipblas' 'hipblas-common' 'hipblaslt' 'hiprand' 'rocdecode' 'rocjpeg' 'rocprim' 'hipcub' 'rocfft' 'hipfft' 'hipfort' 'hipify-clang' 'hipsolver' 'rocsparse' 'hipsparse' 'hipsparselt' 'hiptensor' 'openmp-extras-dev' 'rccl' 'rocrand' 'rocalution' 'rocm-hip-libraries' 'rocthrust' 'rocprofiler-compute' 'rocprofiler-debug'
'rocprofiler-systems' 'rocm-hip-sdk' 'rocm-opencl' 'rocm-opencl-runtime' 'rocm-opencl-sdk' 'rocwmma' 'rocprofiler-sdk' 'rocprofiler-sdk-roctx' 'rocprofiler-sdk-rocpd' 'rocm-developer-tools' 'rocshmem' 'migraphx' 'miopen' 'miopen-hip' 'mivisionx' 'rocm-ml-libraries' 'rocm-ml-sdk' 'rpp')
conflicts=('opencl-amd' 'opencl-amd-dev' 'rocm-gfx120x-bin' 'rocm-gfx1150-bin' 'rocm-gfx1151-bin' 'rocm-opencl-runtime' 'rocm' 'rocm-core' 'comgr' 'rocm-hip' 'hip' 'hsa-rocr' 'rocminfo' 'hip-runtime-amd' 'rocm-device-libs' 'rocm-language-runtime' 'rocm-hip-runtime' 'rocm-ocl-icd' 'rocm-opencl-icd-loader' 'rocm-dbgapi' 'rocm-debug-agent' 'rocm-gdb'
'rocprofiler' 'rocprofiler-plugins' 'rocprofiler-register' 'roctracer' 'hsa-amd-aqlprofile' 'rocm-openmp' 'openmp-extras-runtime' 'rocm-cmake' 'rocm-smi-lib' 'amdsmi' 'amd-smi-lib' 'composable-kernel' 'hipcc' 'rocm-llvm' 'rocblas' 'rocsolver' 'hipblas' 'hipblas-common' 'hipblaslt' 'hiprand' 'rocdecode' 'rocjpeg' 'rocprim' 'hipcub' 'rocfft' 'hipfft' 'hipfort' 
'hipify-clang' 'hipsolver' 'rocsparse' 'hipsparse' 'hipsparselt' 'hiptensor' 'rccl' 'rocrand' 'rocalution' 'rocm-hip-libraries' 'rocthrust' 'rocprofiler-compute' 'rocprofiler-debug' 'rocprofiler-systems' 'rocm-hip-sdk' 'rocm-opencl' 'rocm-opencl-runtime' 'rocm-opencl-sdk' 'rocwmma' 'rocprofiler-sdk' 'rocprofiler-sdk-roctx' 'rocprofiler-sdk-rocpd' 'rocm-developer-tools' 'rocshmem' 'migraphx' 'miopen' 'miopen-hip' 
'mivisionx' 'rocm-ml-libraries' 'rocm-ml-sdk' 'rpp')
optdepends=('clinfo')
options=('!strip')

source=(
"https://repo.amd.com/rocm/tarball/therock-dist-linux-gfx110X-dgpu-7.10.0.tar.gz"
)

sha256sums=(
"dbe0309f6ce6d5fc6b1ea79fbb12dc45317f87faf8e8d2facab61d8184ab9e0a"
)

package() {

    mkdir -p "${srcdir}/opt/rocm"
    tar xf therock-dist-linux-gfx110X-dgpu-7.10.0.tar.gz -C ${srcdir}/opt/rocm

    mv "${srcdir}/opt/" "${pkgdir}/"
    #mv "${pkgdir}/opt/rocm-7.1.1" "${pkgdir}/opt/rocm"

    #mkdir -p "${pkgdir}/opt/amdgpu/share/libdrm"
    #cd "${pkgdir}/opt/amdgpu/share/libdrm"
    #ln -s /usr/share/libdrm/amdgpu.ids amdgpu.ids

    mkdir -p "${pkgdir}/etc/OpenCL/vendors"
    echo libamdocl64.so > "${pkgdir}/etc/OpenCL/vendors/amdocl64.icd"

    mkdir -p "${pkgdir}/etc/ld.so.conf.d"
    echo /opt/rocm/lib >> "$pkgdir/etc/ld.so.conf.d/rocm-bin.conf"
    echo /opt/rocm/hip/lib >> "$pkgdir/etc/ld.so.conf.d/rocm-bin.conf"

    mkdir -p "${pkgdir}/etc/profile.d"
    echo export PATH="\${PATH}:/opt/rocm/bin:/opt/rocm/hip/bin" > "$pkgdir/etc/profile.d/rocm-bin.sh"
}
