# Maintainer: agony <27015 at riseup dot net>

pkgname=versitygw-bin
pkgver=1.10.0
pkgrel=1
pkgdesc='S3 object storage server for a filesystem (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/versity/versitygw'
license=('Apache-2.0')
depends=('bash')
provides=("versitygw=${pkgver}")
conflicts=('versitygw')
backup=('etc/versitygw.d/example.conf'
        'etc/versitygw.d/example-iam.conf')
_release="${url}/releases/download/v${pkgver}"
source=("versitygw-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
source_x86_64=("versitygw-${pkgver}-x86_64.tar.gz::${_release}/versitygw_v${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("versitygw-${pkgver}-aarch64.tar.gz::${_release}/versitygw_v${pkgver}_Linux_arm64.tar.gz")
sha256sums=('2412650615032f002f67fdc83e03e33f36298f8cfeeff9755c3f61c0df0b4fb8')
sha256sums_x86_64=('8f9869752939d4dc9cfe1bddb935a02cc6610e95319a3a9fc2947d2a6ebd2c91')
sha256sums_aarch64=('6307b377caee30c1f0fc8950e62ba684e0440a92f8e6a3a06bee1b83a857f03a')

package() {
  install -Dm755 "versitygw_v${pkgver}_Linux_"*/versitygw -t "${pkgdir}/usr/bin"
  cd "versitygw-${pkgver}"
  install -Dm644 extra/versitygw@.service -t "${pkgdir}/usr/lib/systemd/system"
  install -dm700 "${pkgdir}/etc/versitygw.d"
  install -m644 extra/example.conf extra/example-iam.conf -t "${pkgdir}/etc/versitygw.d"
  install -Dm644 extra/versitygw.sh "${pkgdir}/usr/share/bash-completion/completions/versitygw"
  install -Dm644 extra/versitygw.zsh "${pkgdir}/usr/share/zsh/site-functions/_versitygw"
  install -Dm644 extra/versitygw.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d"
  install -Dm644 NOTICE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
