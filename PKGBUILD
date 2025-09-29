# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Harsh Barsaiyan <hbarsaiyan at gmail dot com>
pkgname=youtube-music-bin
pkgver=3.11.0
pkgrel=3
pkgdesc="YouTube Music Desktop App bundled with custom plugins (and built-in ad blocker / downloader)"
arch=('x86_64' 'aarch64' 'armv7h')
#url="https://ytmd-devs.github.io/ytmd/" ## images are currently broken
url="https://github.com/ytmd-devs/ytmd"
license=('MIT')
depends=(
  'gtk3'
  'libsecret'
  'nss'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
install="${pkgname%-bin}.install"
source=( "license-$pkgver::https://github.com/ytmd-devs/ytmd/raw/v$pkgver/license"
        "${pkgname%-bin}.sh")
source_x86_64=("https://github.com/ytmd-devs/ytmd/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/ytmd-devs/ytmd/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_arm64.deb")
source_armv7h=("https://github.com/ytmd-devs/ytmd/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_armv7l.deb")
sha256sums=('e7e14b3b771ecadb23f6ee0b6f99d1553e385e35cdb44fc8e36ee7c878dacd08'
            '3769e2d994ad011e8481f3ed448557cd9e5b5f1a805d84b4944639c807440d8c')
sha256sums_x86_64=('db20c40bdcc558aaa85d6d5c20a3ec1e32795fcd6ffaa7e4f99757004736face')
sha256sums_aarch64=('49ac8f0782fd0bf1209a18762bfba9efe8128e92869598042abcd5e15d76a825')
sha256sums_armv7h=('29afb031623c7154826d22cab30428cf69f77ab8d8588988d4eb0fc09b6c7cdf')

package(){
  bsdtar xfv data.tar.xz -C "$pkgdir"

  desktop-file-edit --set-key=Exec --set-value="${pkgname%-bin} %U" \
    "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"

  install -Dm755 "${pkgname%-bin}.sh" "$pkgdir/usr/bin/${pkgname%-bin}"

  install -Dm644 "license-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/license"
}
