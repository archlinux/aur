# Maintainer: Felitendo
# This PKGBUILD is updated automatically:
# https://git.felo.gg/Felitendo/PKGBUILDS

pkgname=face-unlock
pkgver=2.1.0
pkgrel=1
pkgdesc="Face ID for Linux: the lock screen, sudo and admin prompts by face, on Plasma, GNOME, Hyprland and Niri"
arch=('x86_64' 'aarch64')
url="https://git.felo.gg/LoonixTools/face-unlock"
license=('GPL-3.0-or-later' 'MIT' 'Apache-2.0')
depends=('bash' 'coreutils' 'gawk' 'grep' 'sed' 'gettext' 'systemd' 'systemd-libs' 'pam' 'polkit'
         'opencv' 'qt6-base' 'qt6-declarative' 'layer-shell-qt' 'ki18n')
makedepends=('cmake' 'scdoc')
optdepends=('hyprpolkitagent: password windows on Hyprland and Niri')
# The old name.
replaces=('plasma-face-unlock')
conflicts=('plasma-face-unlock')
install="${pkgname}.install"
# The two face networks come from the OpenCV model zoo, pinned by checksum.
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "face_detection_yunet_2023mar.onnx::https://github.com/opencv/opencv_zoo/raw/main/models/face_detection_yunet/face_detection_yunet_2023mar.onnx"
        "face_recognition_sface_2021dec.onnx::https://github.com/opencv/opencv_zoo/raw/main/models/face_recognition_sface/face_recognition_sface_2021dec.onnx")
noextract=('face_detection_yunet_2023mar.onnx' 'face_recognition_sface_2021dec.onnx')
sha256sums=('35ab950c775c92706bd1ea7e5b8abfa99dea7635f8e971dabd80ed6a1afc1270' '8f2383e4dd3cfbb4553ea8718107fc0423210dc964f9f4280604804ed2552fa4' '0ba9fbfa01b5270c96627c4ef784da859931e02f04419c829e83484087c34e79')

build() {
  make -C "${pkgname}" VERSION="$pkgver"
}

check() {
  make -C "${pkgname}" VERSION="$pkgver" test
}

package() {
  make -C "${pkgname}" VERSION="$pkgver" MODELS_SRC="$srcdir" DESTDIR="$pkgdir" install
}
