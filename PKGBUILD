# Maintainer: detiam <dehe_tian@outlook.com>

pkgname=nvidia-config-nop2perf
pkgver=1
pkgrel=1
pkgdesc="NVIDIA configuration for disabling force P2 power state with CUDA applications"
arch=('any')
url="https://github.com/NVIDIA/open-gpu-kernel-modules/issues/333"
license=('GPL-3.0-or-later')
depends=('nvidia-utils')
source=()
sha256sums=()

package() {
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/environment.d/50-nvidia-cuda-disable-perf-boost.conf" <<END
CUDA_DISABLE_PERF_BOOST=1
END

    install -Dm644 /dev/stdin "${pkgdir}/etc/nvidia/nvidia-application-profiles-rc.d/cuda-no-stable-perf-limit" <<END
{
    "rules": [
        {
            "pattern": {
                "feature": "true",
                "matches": ""
            },
            "profile": "CudaNoStablePerfLimit"
        }
    ],
    "profiles": [
        {
            "name": "CudaNoStablePerfLimit",
            "settings": [
                {
                    "key": "0x166c5e",
                    "value": 0
                }
            ]
        }
    ]
}
END
}
