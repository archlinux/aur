# Maintainer: robertfoster

pkgname=nullclaw-bin
pkgver=2026.5.29 # renovate: datasource=github-releases depName=nullclaw/nullclaw
pkgrel=1
pkgdesc="Fastest, smallest, and fully autonomous AI assistant infrastructure written in Zig"
arch=('x86_64' 'aarch64' 'riscv64' 'armv7h')
url="https://github.com/nullclaw/nullclaw"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=(
  "${pkgname%-bin}.service"
  "${pkgname%-bin}.sysusers"
  "${pkgname%-bin}.tmpfiles"
)

source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/nullclaw-linux-x86_64.bin")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/nullclaw-linux-aarch64.bin")
source_riscv64=("${pkgname%-bin}-${pkgver}-riscv64::${url}/releases/download/v${pkgver}/nullclaw-linux-riscv64.bin")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h::${url}/releases/download/v${pkgver}/nullclaw-linux-arm32-gnu.bin")

sha256sums=('99538046b857c623cc635f4dd835b36817d03189145fba3116d06a7cd02ec829'
  '12bc31216ae63ed4179972cb29dcaf358afec0f0397f21350e414dd25bffb1f8'
  '32023e12a4d2f15d4cda27e1198f85ae2b306060f7577d9d9fc8d7af6796e0d9')

sha256sums_x86_64=('966c524d3816531371e8657ffc84c40f47d94db89f6c70e816adce983e6d1f0a')
sha256sums_aarch64=('87d4a19c39dd199f6d5f45b3c80e566d4349d0a291e6cc4ac8f573e2fecfa152')
sha256sums_riscv64=('fd68752347580036e8fa54992e969ccd06843263fbec960d3ba4a4cef1f02b9f')
sha256sums_armv7h=('ab802e2697b9f96a17a50bff39623efa71c79a877cc07547b527cfc0de525b37')
package() {
  # Install binary
  install -Dm755 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}" \
    "${pkgdir}/usr/bin/${pkgname%-bin}"

  # Install systemd unit
  install -Dm644 "${srcdir}/${pkgname%-bin}.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname%-bin}.service"

  # Install sysusers.d fragment
  install -Dm644 "${srcdir}/${pkgname%-bin}.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname%-bin}.conf"

  # Install tmpfiles.d fragment
  install -Dm644 "${srcdir}/${pkgname%-bin}.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/${pkgname%-bin}.conf"
}
