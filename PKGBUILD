# Maintainer: Mathew Kamkar <me at matkam dot net>

# Builds found here: https://mau.dev/mautrix/signal/-/pipelines?ref=main
# More info: https://docs.mau.fi/bridges/go/setup.html?bridge=signal
# pkgver format: r<build pipeline number>.<short commit hash>

pkgname=mautrix-signal-bin
provides=('mautrix-signal')
pkgver="r12724.717e58cb"
pkgrel=1
pkgdesc="A Matrix-Signal puppeting bridge (Golang version)"
arch=('x86_64' 'aarch64')
license=('AGPL')
makedepends=('unzip')
url="https://github.com/mautrix/signal"
_ci_job_url="https://mau.dev/mautrix/signal/-/jobs"
source_x86_64=("$pkgname-x86_64-$pkgver.zip"::"${_ci_job_url}/41535/artifacts/download")
source_aarch64=("$pkgname-aarch64-$pkgver.zip"::"${_ci_job_url}/41536/artifacts/download")
source=(
          "sysusers-${pkgname/-bin}.conf"
          "${pkgname/-bin}.tmpfiles"
          "${pkgname/-bin}.service"
        )
backup=("etc/${pkgname/-bin}/config.yaml")
sha256sums=('3384dd44aa72937047f03f4a524efdf92162029ab85e830f5c7d4747b40359d8'
            'f086d8c1c187e22faced78fb885607c4fb11e99960958e54b884983158d8ec0e'
            'a6c23d8bb6ca5bd36853a954ee30fa75302ce2a9c3e03897169869743dad2cc6')
sha256sums_x86_64=('38336b309e278e24f7ad40eeb901e4597553a26aaef06e49bc6ec448ed8e0040')
sha256sums_aarch64=('a19a827921e56064144a4f9be7432f4a0f0e61bf915bc11a4c69b6d1a15dbf32')

prepare() {
  unzip "$srcdir/$pkgname-$CARCH-$pkgver.zip"
}

package() {
  install -Dm755 "$srcdir/${pkgname/-bin}" "$pkgdir/usr/bin/${pkgname/-bin}"

  install -Dm644 "$srcdir/sysusers-${pkgname/-bin}.conf" "$pkgdir/usr/lib/sysusers.d/${pkgname/-bin}.conf"
  install -Dm644 "$srcdir/${pkgname/-bin}.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/${pkgname/-bin}.conf"
  install -Dm644 "$srcdir/${pkgname/-bin}.service" "$pkgdir/usr/lib/systemd/system/${pkgname/-bin}.service"

  install -Dm640 "$srcdir/example-config.yaml" "$pkgdir/etc/${pkgname/-bin}/config.yaml"
}

