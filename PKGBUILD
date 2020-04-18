# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jonathan Kotta <jpkotta@gmail.com>
# Contributor: paul2lv <paul2lv@gmail.com>
# Contributor: dtw <dibblethewrecker@gmail.com>

pkgname=foldingathome
pkgver=7.6.8
pkgrel=7
pkgdesc='A distributed computing project for simulating protein dynamics'
arch=(x86_64)
url=https://foldingathome.org/
license=(custom)
depends=(
  gcc-libs
  glibc
  zlib
)
optdepends=(
  'cuda: for folding with an NVIDIA GPU'
  'ocl-icd: for folding with any GPU'
  'opencl-amd: for folding with an AMD GPU (>= GCN)'
  'opencl-mesa: for folding with an AMD GPU (< GCN)'
  'opencl-nvidia: for folding with an NVIDIA GPU'
)
backup=(etc/foldingathome/config.xml)
install=foldingathome.install
source=(
  https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v${pkgver%.*}/fahclient_${pkgver}-64bit-release.tar.bz2
  foldingathome.service
  GPUs.txt
)
sha256sums=('588253c0042dcb0a6b97c9e16ccb8189b316df051094be4202881120255e5d31'
            'c6d5fd1072e6f12818c9d9363e416e2bb65331e59add3dd8a99651282e9abb3c'
            '5944a6df06b42c5edd4e5f0922f16e3f04cb755bd248d0e610c9262f3814aff9')

package() {
  install -Dm 755 fahclient_${pkgver}-64bit-release/FAHClient -t "${pkgdir}"/usr/bin/
  install -Dm 755 fahclient_${pkgver}-64bit-release/FAHCoreWrapper -t "${pkgdir}"/usr/bin/
  install -Dm 644 fahclient_${pkgver}-64bit-release/CHANGELOG.md -t "${pkgdir}"/usr/share/doc/foldingathome/
  install -Dm 644 fahclient_${pkgver}-64bit-release/README.md -t "${pkgdir}"/usr/share/doc/foldingathome/
  install -Dm 644 fahclient_${pkgver}-64bit-release/copyright -t "${pkgdir}"/usr/share/licenses/foldingathome/
  install -Dm 644 fahclient_${pkgver}-64bit-release/sample-config.xml "${pkgdir}"/etc/foldingathome/config.xml
  install -Dm 644 foldingathome.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm 644 GPUs.txt -t "${pkgdir}"/etc/foldingathome/
}

# vim: ts=2 sw=2 et:
