# Maintainer: agony <27015 at riseup dot net>
# Contributor: Gaoyang Zhang <gy@blurgy.xyz>

pkgname=wakapi-bin
pkgver=2.18.2
pkgrel=1
pkgdesc='A minimalist, self-hosted WakaTime-compatible backend for coding statistics'
arch=('x86_64' 'aarch64')
url='https://github.com/muety/wakapi'
license=('MIT')
provides=('wakapi')
conflicts=('wakapi')
install=wakapi-bin.install
backup=('etc/wakapi/config.yml')
source=("wakapi-${pkgver}-LICENSE::https://raw.githubusercontent.com/muety/wakapi/${pkgver}/LICENSE"
        'wakapi.service'
        'wakapi.sysusers'
        'wakapi.tmpfiles')
source_x86_64=("wakapi-${pkgver}-amd64.zip::${url}/releases/download/${pkgver}/wakapi_linux_amd64.zip")
source_aarch64=("wakapi-${pkgver}-arm64.zip::${url}/releases/download/${pkgver}/wakapi_linux_arm64.zip")
sha256sums=('852bcc033a46c62f99fb5ffd43b3241ba2c0c440c6034aa2114505f2c4f03c4a'
            '296f68749d74cade4a3ec57fc58f88685a5f0343b5f945b463f5d8cab43b6f57'
            '043203cae2a37ef0f1133b16a1b6c27c93669bde84824992304c0b355636dcbe'
            '8709709b8a3f1d7be8e2a33f663377369c128f0c8125cfec817f581b16110551')
sha256sums_x86_64=('a64e98f0a99ae4dd625ed3bff5b98e3b21130d2adc04184bfbbe35f21049273b')
sha256sums_aarch64=('8957ebaccfe998cf610073e688578666c54688587fa8e4063ce362ad091ab9c5')

package() {
  install -Dm755 wakapi -t "${pkgdir}/usr/bin"
  install -Dm640 config.yml -t "${pkgdir}/etc/wakapi"
  install -Dm644 wakapi.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 wakapi.sysusers "${pkgdir}/usr/lib/sysusers.d/wakapi.conf"
  install -Dm644 wakapi.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/wakapi.conf"
  install -Dm644 "wakapi-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
