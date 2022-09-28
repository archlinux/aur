# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=ycash-bin
_pkgname=ycash
pkgver=4.4.2
pkgrel=1
pkgdesc='A digital currency chain fork of Zcash'
url='https://github.com/ycashfoundation/ycash'
arch=('x86_64')
license=('MIT')
source=("$url/releases/download/v$pkgver/ycashd_v${pkgver}_linux.tar.gz"
        "https://raw.githubusercontent.com/ycashfoundation/ycash/master/COPYING"
        "ycashd.service")
sha512sums=('1308c891efe4a5b33cee2c58237486eb3453aa6f6e9fda1ff79c3ec9f324e29e9488b4f7ab5c133d4c56849e188ca9b10a9782cec36994bcc60e15c3bb56c3aa'
            '936adf7dbe4b718ba67285e7233dd58978f8d06cba3c1057b91f856b3a56ffecaa95d25b9db08a3c38d07d8290e5beeccf100cc80e3f0b7dcedce1946fdcf4f8'
            '9cd52589571a5b1009edf6779c0f023d1d3dd2a338b9ca6d5db35024aaf3b419393befc2b7cfa7a79108e5639d262b0a389599db11463df2aaa09abdfb60b1e0')

package() {
  install -Dm644 "${srcdir}/COPYING" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  # install required binaries & scripts
  install -Dm755 "${srcdir}/ycashd_v${pkgver}_linux/ycash-cli" "${pkgdir}/opt/$_pkgname/ycash-cli"
  install -Dm755 "${srcdir}/ycashd_v${pkgver}_linux/ycashd" "${pkgdir}/opt/$_pkgname/ycashd"
  install -Dm755 "${srcdir}/ycashd_v${pkgver}_linux/ycash-tx" "${pkgdir}/opt/$_pkgname/ycash-tx"

  # create symlinks
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/ycash-cli "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/ycashd "${pkgdir}/usr/bin"
  ln -s /opt/${_pkgname}/ycash-tx "${pkgdir}/usr/bin"

  # install systemd service
  install -Dm644 -t "${pkgdir}"/usr/lib/systemd/user "${srcdir}"/ycashd.service
}
