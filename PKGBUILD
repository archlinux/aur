# Maintainer: boringcode <thatguy at bradleyrosenfeld dot com>

_pkgname=gyroflow
pkgname=${_pkgname}-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="Video stabilization using gyroscope data"
arch=("x86_64")
license=("GPL3")
url="https://gyroflow.xyz/"
depends=("libc++" "qt6-base" "qt6-quick3d" "qt6-declarative" "qt6-3d" "pulseaudio" "libxkbcommon" "opencv" "ocl-icd" "ffmpeg")
optdepends=("opencl-driver: OpenCL driver for GPU accelerated stabilization"
            "libva-mesa-driver: VAAPI video acceleration for NVIDIA and AMD GPU"
            "intel-media-driver: VAAPI video acceleration for Intel GPU")
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-appimage" "${_pkgname}-git")
source=("Gyroflow-linux64.tar.gz::https://github.com/gyroflow/gyroflow/releases/download/v${pkgver}/Gyroflow-linux64.tar.gz"
		"icon.svg::https://raw.githubusercontent.com/gyroflow/gyroflow/v${pkgver}/resources/icon.svg"
        "${_pkgname}.desktop")

sha256sums=('5ce4c0c762d561be3d110aa07c25ace63f2304c3cd487fcd8f2aadb001c1ebe8'
            '847ac94756cb80317c2cb716790c4fded707236eaecbf6c9611d27124c442578'
            '9e97420c0d48fa0959312d6566410f801d82423b4a3332fe9eddb33c04469779')

package() {
  # move the entire distribution to /usr/share
  mkdir -p "${pkgdir}"/usr/share/
  mv ${srcdir}/"Gyroflow" "${pkgdir}"/usr/share/${_pkgname}

  # desktop file
  install -Dm 644 ${srcdir}/"icon.svg" "${pkgdir}/usr/share/pixmaps/${_pkgname}.svg"
  install -Dm 644 "${srcdir}"/${_pkgname}.desktop \
    "${pkgdir}"/usr/share/applications/${_pkgname}.desktop

  # symlink binary
  mkdir -p "${pkgdir}"/usr/bin
  ln -sf /usr/share/${_pkgname}/gyroflow \
    "${pkgdir}"/usr/bin/gyroflow
}
