# Maintainer:
# Contributor: Thilo-Alexander Ginkel <tg@tgbyte.de>
# Contributor: Francisco Demartino <demartino.francisco@gmail.com>
# Contributor: Chris Heien <chris.h.heien@gmail.com>

_pkgname="pdfbox"
pkgname="$_pkgname"
pkgver=3.0.5
pkgrel=1
pkgdesc="Java tool for working with PDF documents"
url="https://pdfbox.apache.org"
license=('Apache-2.0')
arch=('any')

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
  'd076467fd02214ebc7b5b9d5b3b9ac0891ef768168114ed8a4811b5d16606285'
  '1aad65082ee07c85876c9cddfaf2153822435755f4960dd5f2b7d4da3837c27e'
  '944a58f01b34f12ed42d57260887d7485c30c2feb632b5ec00f845dff6407223'
)

package() {
  depends=('java-runtime')

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
