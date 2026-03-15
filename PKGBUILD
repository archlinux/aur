# Maintainer:
# Contributor: Thilo-Alexander Ginkel <tg@tgbyte.de>
# Contributor: Francisco Demartino <demartino.francisco@gmail.com>
# Contributor: Chris Heien <chris.h.heien@gmail.com>

: ${_install_path:=usr/share}

_pkgname="pdfbox"
pkgname="$_pkgname"
pkgver=3.0.7
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
  'bf70b90aca964bda6f1438d7b87d6f99cfaa9912ba6fcebc0541d9d90ee5ef54'
  '697254b7a6741eb241b18ac1075622eeedcb461a002fcf7eed9ec249c9b8507a'
  '3765ae0580f280c3b7375488e4e3be98f17c4d81779bd7c4f3f59a9640dfe55e'
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
