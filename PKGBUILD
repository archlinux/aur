# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=ycash-bin
_pkgname=ycash
pkgver=4.4.4
pkgrel=1
pkgdesc='A digital currency chain fork of Zcash'
url='https://github.com/ycashfoundation/ycash'
arch=('x86_64')
license=('MIT')
source=("$url/releases/download/v$pkgver/ycashd_v${pkgver}_linux.tar.gz"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/ycashfoundation/ycash/master/COPYING"
        "ycashd.service")
sha512sums=('b1d21070fd5b44f1f6d1632550a476176bfd844ff99a7ec0caf90b3a290d1888406c1697735633d94b5b1a5074b537ae7c7af0d91382707fdd00b3b018e7da9f'
            '936adf7dbe4b718ba67285e7233dd58978f8d06cba3c1057b91f856b3a56ffecaa95d25b9db08a3c38d07d8290e5beeccf100cc80e3f0b7dcedce1946fdcf4f8'
            '9cd52589571a5b1009edf6779c0f023d1d3dd2a338b9ca6d5db35024aaf3b419393befc2b7cfa7a79108e5639d262b0a389599db11463df2aaa09abdfb60b1e0')

package() {
  install -Dm644 LICENSE-$pkgver "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  install -Dm755 ycashd_v${pkgver}_linux/ycash-cli "$pkgdir/usr/bin/ycash-cli"
  install -Dm755 ycashd_v${pkgver}_linux/ycashd "$pkgdir/usr/bin/ycashd"
  install -Dm755 ycashd_v${pkgver}_linux/ycash-tx "$pkgdir/usr/bin/ycash-tx"

  # install systemd service
  install -Dm644 -t "${pkgdir}"/usr/lib/systemd/user ycashd.service
}
