# Maintainer:
# Contributor: Thilo-Alexander Ginkel <tg@tgbyte.de>
# Contributor: Francisco Demartino <demartino.francisco@gmail.com>
# Contributor: Chris Heien <chris.h.heien@gmail.com>

: ${_install_path:=usr/share}

_pkgname="pdfbox"
pkgname="$_pkgname"
pkgver=3.0.6
pkgrel=1
pkgdesc="Java tool for working with PDF documents"
url="https://pdfbox.apache.org"
license=('Apache-2.0')
arch=('any')

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
  '28948291a7d6addb91a158292f2e9348d2143720e25a9c87c91bbdd4b088475f'
  '33535b4335f7c0b99286f16da67a6a6153a2ef643d680902ff8e288623510f2b'
  '99d1a0bb97b2f6dc92ec04a2788b21b5af135c36efb58f994f7b0a28238b7c9c'
)

package() {
  depends=('java-runtime')

  install -Dm644 "$_jar_pdfbox" "$pkgdir/$_install_path/$_pkgname/pdfbox.jar"
  install -Dm644 "$_jar_debugger" "$pkgdir/$_install_path/$_pkgname/pdfbox-debugger.jar"
  install -Dm644 "$_jar_preflight" "$pkgdir/$_install_path/$_pkgname/pdfbox-preflight.jar"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/pdfbox" << END
#!/usr/bin/env sh
exec java -jar "/$_install_path/$_pkgname/pdfbox.jar" "\$@"
END

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/pdfbox-debugger" << END
#!/usr/bin/env sh
exec java -jar "/$_install_path/$_pkgname/pdfbox-debugger.jar" "\$@"
END

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/pdfbox-preflight" << END
#!/usr/bin/env sh
exec java -jar "/$_install_path/$_pkgname/pdfbox-preflight.jar" "\$@"
END
}
