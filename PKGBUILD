# Maintainer: iktrnch
pkgname=action-webcamd
pkgver=0.1.0
pkgrel=1
pkgdesc='Native Linux webcam service for compatible GoPro cameras'
arch=('x86_64')
url='https://github.com/iktrnch/action-webcamd'
license=('MIT')
depends=('ffmpeg' 'systemd-libs')
makedepends=('cargo' 'clang' 'pkgconf')
optdepends=('v4l2loopback-dkms: provides the virtual V4L2 camera device')
options=('!debug')
source=("action-webcamd-${pkgver}.tar.gz::https://github.com/iktrnch/action-webcamd/archive/refs/tags/v0.1.0.tar.gz")
sha256sums=('ec1b4e6a07548871b75b97a6376937e1d1b9cfe069098b7599f62b791674e2bd')

build() {
  cd "${srcdir}/action-webcamd-${pkgver}"
  cargo build --release --locked
}

check() {
  cd "${srcdir}/action-webcamd-${pkgver}"
  cargo test --all-features --locked
}

package() {
  cd "${srcdir}/action-webcamd-${pkgver}"
  install -Dm755 target/release/action-webcamd "${pkgdir}/usr/bin/action-webcamd"
  install -Dm644 packaging/action-webcamd.service "${pkgdir}/usr/lib/systemd/system/action-webcamd.service"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
