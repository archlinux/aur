# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://github.com/Felitendo/PKGBUILDS

pkgname=plasma-face-unlock
pkgver=1.0.0
pkgrel=1
pkgdesc="Face ID for KDE Plasma: the lock screen, sudo and admin prompts by face, with a photo check"
arch=('x86_64' 'aarch64')
url="https://github.com/LoonixTools/plasma-face-unlock"
license=('GPL-3.0-or-later' 'MIT' 'Apache-2.0')
depends=('bash' 'coreutils' 'gawk' 'grep' 'sed' 'gettext' 'systemd' 'systemd-libs' 'pam' 'polkit'
         'opencv' 'qt6-base' 'qt6-declarative' 'layer-shell-qt' 'ki18n' 'kscreenlocker')
makedepends=('cmake' 'scdoc')
install="${pkgname}.install"
# The two face networks come from the OpenCV model zoo, pinned by checksum.
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "face_detection_yunet_2023mar.onnx::https://github.com/opencv/opencv_zoo/raw/main/models/face_detection_yunet/face_detection_yunet_2023mar.onnx"
        "face_recognition_sface_2021dec.onnx::https://github.com/opencv/opencv_zoo/raw/main/models/face_recognition_sface/face_recognition_sface_2021dec.onnx")
noextract=('face_detection_yunet_2023mar.onnx' 'face_recognition_sface_2021dec.onnx')
sha256sums=('445306ab6a454a172e3eab0f6342b1c355cd0b8d5994c45f1c38eeeaf77dd6df' '8f2383e4dd3cfbb4553ea8718107fc0423210dc964f9f4280604804ed2552fa4' '0ba9fbfa01b5270c96627c4ef784da859931e02f04419c829e83484087c34e79')

build() {
  make -C "${pkgname}-${pkgver}" VERSION="$pkgver"
}

check() {
  make -C "${pkgname}-${pkgver}" VERSION="$pkgver" test
}

package() {
  make -C "${pkgname}-${pkgver}" VERSION="$pkgver" MODELS_SRC="$srcdir" DESTDIR="$pkgdir" install
}
