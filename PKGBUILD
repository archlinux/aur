# Maintainer:
# Contributor: Thilo-Alexander Ginkel <tg@tgbyte.de>
# Contributor: Francisco Demartino <demartino.francisco@gmail.com>
# Contributor: Chris Heien <chris.h.heien@gmail.com>

_pkgname="pdfbox"
pkgname="$_pkgname"
pkgver=3.0.3
pkgrel=1
pkgdesc="Java tool for working with PDF documents"
url="https://pdfbox.apache.org"
license=('Apache-2.0')
arch=('any')

depends=('java-runtime')

provides=("pdfbox-preflight=$pkgver")
conflicts=("pdfbox-preflight")

_jar_pdfbox="pdfbox-app-$pkgver.jar"
_jar_debugger="debugger-app-$pkgver.jar"
_jar_preflight="preflight-app-$pkgver.jar"
noextract=(
  "$_jar_pdfbox"
  "$_jar_debugger"
  "$_jar_preflight"
)

_url_dl="https://dlcdn.apache.org/pdfbox"
source=(
  "$_url_dl/$pkgver/$_jar_pdfbox"
  "$_url_dl/$pkgver/$_jar_debugger"
  "$_url_dl/$pkgver/$_jar_preflight"
)

sha256sums=(
  'a0269317c8b72551df695eef4f6cd459895850f122c62b7f10b3f9951cba2ecb'
  'c3c8435afc8bec7a9af2e3f2a400787ea0a5755a4d9cd4f833809c4579e0ab72'
  'c4ddbeeeb66fc55b11d46422259b8cf8eb1af6370d804123a2c5f89c1e6ccece'
)

package() {
  install -Dm644 "$_jar_pdfbox" "$pkgdir/usr/share/pdfbox/pdfbox.jar"
  install -Dm644 "$_jar_debugger" "$pkgdir/usr/share/pdfbox/pdfbox-debugger.jar"
  install -Dm644 "$_jar_preflight" "$pkgdir/usr/share/pdfbox/pdfbox-preflight.jar"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/pdfbox" << END
#!/usr/bin/env sh
exec java -jar /usr/share/pdfbox/pdfbox.jar "\$@"
END

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/pdfbox-debugger" << END
#!/usr/bin/env sh
exec java -jar /usr/share/pdfbox/pdfbox-debugger.jar "\$@"
END

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/pdfbox-preflight" << END
#!/usr/bin/env sh
exec java -jar /usr/share/pdfbox/pdfbox-preflight.jar "\$@"
END
}
