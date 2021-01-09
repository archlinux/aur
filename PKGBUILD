# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jonathan Kotta <jpkotta@gmail.com>
# Contributor: paul2lv <paul2lv@gmail.com>
# Contributor: dtw <dibblethewrecker@gmail.com>

pkgname=foldingathome
pkgver=7.6.21
pkgrel=1
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
  'clinfo: for folding with an NVIDIA GPU'
  'cuda: for folding with an NVIDIA GPU'
  'ocl-icd: for folding with any GPU'
  'opencl-driver: for folding with any GPU'
)
backup=(etc/foldingathome/config.xml)
install=foldingathome.install
source=(
  https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v${pkgver%.*}/fahclient_${pkgver}-64bit-release.tar.bz2
  foldingathome.service
  foldingathome-nvidia.service
  foldingathome-user.service
)
sha256sums=('37652bd897b4d9fe3e0dbe067df203aa6b29f243c4b8f5e73c18953acd77e6b2'
            'a5cb7d55bbccbfd95f40e4b489d6de99c2e9336c2ff9ee5ce5ec70893551a84f'
            '2b50df72017d4312b6af19733aefbcac7f459599f2fb32b66e6abc0887b48d60'
            '41997239dc363570e2ca5bec0eca8c7d88aada6ace0bb5793bf3ec6d101f40bb')

package() {
  install -Dm 755 fahclient_${pkgver}-64bit-release/FAHClient -t "${pkgdir}"/usr/bin/
  install -Dm 755 fahclient_${pkgver}-64bit-release/FAHCoreWrapper -t "${pkgdir}"/usr/bin/
  install -Dm 644 fahclient_${pkgver}-64bit-release/CHANGELOG.md -t "${pkgdir}"/usr/share/doc/foldingathome/
  install -Dm 644 fahclient_${pkgver}-64bit-release/README.md -t "${pkgdir}"/usr/share/doc/foldingathome/
  install -Dm 644 fahclient_${pkgver}-64bit-release/copyright -t "${pkgdir}"/usr/share/licenses/foldingathome/
  install -Dm 644 fahclient_${pkgver}-64bit-release/sample-config.xml "${pkgdir}"/etc/foldingathome/config.xml
  install -Dm 644 foldingathome.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm 644 foldingathome-nvidia.service -t "${pkgdir}"/usr/lib/systemd/system/
  install -Dm 644 foldingathome-user.service "${pkgdir}"/usr/lib/systemd/user/foldingathome.service
}

# vim: ts=2 sw=2 et:
