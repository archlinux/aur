# Maintainer: Sergii Fesenko <sergii underscore f dot at outlook dot com>

pkgname=nitrile-bin
pkgver=0.4.33
pkgrel=1
pkgdesc="A package manager and build tool for Clean programming language"
arch=(x86_64)
url="https://clean-and-itasks.gitlab.io/nitrile"
license=('AGPL-3.0-only')
depends=('glibc' 'gcc-libs')
options=(!strip)
source=("nitrile.tgz::$( curl -s https://clean-lang.org/api/packages/nitrile | jq -r --arg v "$pkgver" '.versions[$v].targets."linux-x64".url' )")
sha256sums=('8de7f0428c34979ad51b4a50b5d8b90a4bac998909ee4dcb3593a5315976f570')

package() {
  cd "nitrile-${pkgver}-linux-x64"

  install -Dm755 bin/nitrile ${pkgdir}/opt/nitrile/bin/nitrile
  install -Dm644 bin/libz3.nitrile.so ${pkgdir}/opt/nitrile/bin/libz3.nitrile.so

  mkdir -p $pkgdir/usr/bin/
  ln -s /opt/nitrile/bin/nitrile $pkgdir/usr/bin/nitrile
}