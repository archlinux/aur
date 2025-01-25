# Maintainer:
# Contributor: Thilo-Alexander Ginkel <tg@tgbyte.de>
# Contributor: Francisco Demartino <demartino.francisco@gmail.com>
# Contributor: Chris Heien <chris.h.heien@gmail.com>

_pkgname="pdfbox"
pkgname="$_pkgname"
pkgver=3.0.4
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
  'fba2f689270a75ce730c080ee9070ea6b0a4d16b544bf436f06ccceab5522143'
  '34aa777ee4181c60b85be23278b886368ac1135e45c1b8410d74ff5f4356f106'
  '55910028c56b6c3a9ff30913773fd27d52c9daf4f5eb6dc592a2654878138ab3'
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
