# Maintainer: eirikr <151315375+Oichkatzelesfrettschen@users.noreply.github.com>
# Why: No AUR/repo package exists for NVOF SDK headers.
#      The NVOF runtime (libnvidia-opticalflow.so.1) already ships with nvidia-utils.
#      NVIDIA/NVIDIAOpticalFlowSDK on GitHub provides only the two public API headers
#      (nvOpticalFlowCommon.h, nvOpticalFlowCuda.h); there are no releases or tags.
#      Pinned to commit edb50da (2020-07-03, the last upstream change; stable since).
#      This package provides headers only; no separate runtime install needed.

pkgname=nvidia-opticalflow-headers
pkgver=3.0.r0.gedb50da
pkgrel=1
pkgdesc='NVIDIA Optical Flow SDK 3.0 development headers (runtime via nvidia-utils libnvidia-opticalflow.so.1)'
arch=(any)
url='https://github.com/NVIDIA/NVIDIAOpticalFlowSDK'
license=('LicenseRef-NvidiaOpticalFlow')
depends=('nvidia-utils')

_commit=edb50da3cf849840d680249aa6dbef248ebce2ca
source=("NVIDIAOpticalFlowSDK-${_commit}.tar.gz::https://github.com/NVIDIA/NVIDIAOpticalFlowSDK/archive/${_commit}.tar.gz")
sha256sums=('215ba11fc010cf5c7aba0617db9e04bed957b771915184f3d7c20780b5780f2e')

package() {
    local _srcdir="${srcdir}/NVIDIAOpticalFlowSDK-${_commit}"

    install -d "${pkgdir}/usr/include/nvidia/opticalflow"
    install -m644 "${_srcdir}/nvOpticalFlowCommon.h" "${pkgdir}/usr/include/nvidia/opticalflow/"
    install -m644 "${_srcdir}/nvOpticalFlowCuda.h" "${pkgdir}/usr/include/nvidia/opticalflow/"

    # Convenience symlinks at /usr/include for direct inclusion
    ln -sr "${pkgdir}/usr/include/nvidia/opticalflow/nvOpticalFlowCommon.h" \
        "${pkgdir}/usr/include/nvOpticalFlowCommon.h"
    ln -sr "${pkgdir}/usr/include/nvidia/opticalflow/nvOpticalFlowCuda.h" \
        "${pkgdir}/usr/include/nvOpticalFlowCuda.h"

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 "${_srcdir}/README.md" "${pkgdir}/usr/share/licenses/${pkgname}/README.md"
}
