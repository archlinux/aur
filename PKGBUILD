# Maintainer: agony <27015 at riseup dot net>

pkgname=versitygw-bin
pkgver=1.11.0
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
sha256sums=('97d35b99ce46c23c56723dbc46526de17b3b23e33b00e8044e9e3f420a3927c4')
sha256sums_x86_64=('1f075c9dc92fef232f5b3c7465711ddc5e1b062b2b6df4a3bd246a4be5b35b52')
sha256sums_aarch64=('8bd88019511c288de3ce2e5f0efb86f4092a98f7067371a1a8fa461ec0cc161b')

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
