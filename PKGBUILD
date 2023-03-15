# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Michael Lass <bevan@bi-co.net>
pkgname=macintosh.js-bin
pkgver=1.2.0
pkgrel=1
pkgdesc="A virtual Apple Macintosh with System 8, running in Electron"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/felixrieseberg/macintosh.js"
license=('custom')
depends=('gtk3' 'nss')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" 'macintosh-js-bin')
replaces=('macintosh-js-bin')
source=("https://github.com/felixrieseberg/${pkgname%-bin}/raw/v$pkgver/CREDITS.md")
source_x86_64=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_amd64.deb")
source_aarch64=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_arm64.deb")
source_armv7h=("$url/releases/download/v$pkgver/${pkgname%-bin}_${pkgver}_armhf.deb")
sha256sums=('6a221f623fa4f773ea6ba81c8a1731ff0d680cc7e8f20c68488c31b0f13e3dec')
sha256sums_x86_64=('8d1bdfef04c884c3c25a782db329472a7be5a1262fd7b06c1c453d9a6b74c516')
sha256sums_aarch64=('973c48c71e361b90d87af89192d46c5985405989dbe7b9b578b5ca183f5e472a')
sha256sums_armv7h=('bf408406c663ae7866ea5851f3ac7ca1fad1e2adfc857e9d76809f44d6dfc2e3')

package() {
  tar -xvf data.tar.xz -C "$pkgdir"

  install -Dm644 "$srcdir/CREDITS.md" -t \
    "$pkgdir/usr/share/licenses/${pkgname%-bin}"

  # Move files to proper directories
  install -d "$pkgdir/opt/${pkgname%-bin}"
  mv "$pkgdir/usr/lib/${pkgname%-bin}" "$pkgdir/opt"
  mv "$pkgdir/usr/share/doc/${pkgname%-bin}/copyright" \
    "$pkgdir/usr/share/licenses/${pkgname%-bin}"

  # Remove unneeded directories
  rm -rf "$pkgdir"/usr/{lib,share/{doc,lintian}}
  rm -rf "$pkgdir/opt/${pkgname%-bin}/resources/app/.github"

  # Replace symlink
  rm "$pkgdir/usr/bin/${pkgname%-bin}"
  ln -s "/opt/${pkgname%-bin}/${pkgname%-bin}" \
    "$pkgdir/usr/bin/${pkgname%-bin}"
}
