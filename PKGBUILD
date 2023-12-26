# Maintainer: Mathew Kamkar <roosts_knotty0u at icloud dot com>
pkgname=mautrix-signal-bin
provides=('mautrix-signal')
pkgver="r12562.7186350d"
pkgrel=1
pkgdesc="A Matrix-Signal puppeting bridge (Golang version)"
arch=('x86_64' 'aarch64')
license=('AGPL')
makedepends=('unzip')
url="https://github.com/mautrix/signal"
_ci_job_url="https://mau.dev/mautrix/signal/-/jobs"
source_x86_64=("$pkgname-x86_64-$pkgver.zip"::"${_ci_job_url}/40715/artifacts/download")
source_aarch64=("$pkgname-aarch64-$pkgver.zip"::"${_ci_job_url}/40716/artifacts/download")
source=(
          "sysusers-${pkgname/-bin}.conf"
          "${pkgname/-bin}.tmpfiles"
          "${pkgname/-bin}.service"
        )
backup=("etc/${pkgname/-bin}/config.yaml")
sha256sums=(
              '3384dd44aa72937047f03f4a524efdf92162029ab85e830f5c7d4747b40359d8'
              'f086d8c1c187e22faced78fb885607c4fb11e99960958e54b884983158d8ec0e'
              'a6c23d8bb6ca5bd36853a954ee30fa75302ce2a9c3e03897169869743dad2cc6'
            )
sha256sums_x86_64=('0f2fc49de1971c51e4b55c37dd3f3c01503fd55a44e20b6bdb10bf4f6567174d')
sha256sums_aarch64=('fefd4763e17bb0951e81e95982aa7923e50fcf100f8091ea1735b501c7bce07a')

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

