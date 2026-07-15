# Maintainer: aur.chaotic.cx
# Contributor: Thilo-Alexander Ginkel <tg@tgbyte.de>
# Contributor: Francisco Demartino <demartino.francisco@gmail.com>
# Contributor: Chris Heien <chris.h.heien@gmail.com>

: ${_install_path:=usr/share}

_pkgname="pdfbox"
pkgname="$_pkgname"
pkgver=3.0.8
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
  'f6b3a80c39747ff0ef5d06708bc03882152403de58dbef4a1fbffbee568eceb1'
  '7275fd6251e5005a5cf6b257e563dc0a1ae4502b98994fe1bbe90a5b14769e7b'
  'd8f8b2fa102aa06178174710fcef4087e23535832e877d5fe52b4d296571e530'
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
