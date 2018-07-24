# Maintainer: gilbus <aur at tinkershell dot eu>
# Contributor: Schrottfresse <schrottfresse at gmx dot de>

pkgname=tlclient
pkgver=4.9.0
_buildnr=5775
pkgrel=1
pkgdesc="A remote desktop application"
arch=('i686' 'x86_64' 'armv7h')
url="https://www.cendio.com/thinlinc/download"
license=('custom:cendio')
depends=('python2' 'pygtk' 'openssh' 'libx11' 'alsa-lib' 'zlib')
optdepends=('cups: required for remote printing'
            'python2-ldap: auth against ldap')

source=('tlclient.desktop' 'tlclient.png')
sha256sums=('3db307225f95453eeac89f4fcd4618efd01a977cc66998ba11fc22f97c194004'
            'bb7cdf717ba1ee425be21d6bce245a17f2ba798b7202d9189fc964a408e3208a')
sha256sums_i686=('671d8e0fd7511f8d1101722d81c944dbdda0ac3600ade3032cb3b26312d35e5f')
sha256sums_x86_64=('3e2fae4a4e2901a8061f2b0be94e594241e431bee59b3e77545341e6141c9917')
sha256sums_armv7h=('7bb401a8e6c1225ffa6370a8f457f30e6ec3ffafa8dea9dbec6296b8dd67073d')

source_x86_64=("https://www.cendio.com/downloads/clients/tl-$pkgver-$_buildnr-client-linux-dynamic-x86_64.tar.gz")

source_i686=("https://www.cendio.com/downloads/clients/tl-$pkgver-$_buildnr-client-linux-dynamic-i686.tar.gz")

source_armv7h=("https://www.cendio.com/downloads/clients/tl-$pkgver-$_buildnr-client-linux-dynamic-armhf.tar.gz")

package() {
  local dir_suffix=$CARCH
  if [[ $CARCH == 'armv7h' ]]; then
    dir_suffix=armhf
  fi
  cd $srcdir/tl-$pkgver-$_buildnr-client-linux-dynamic-$dir_suffix

  install -Dm644 "lib/tlclient/EULA.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA.txt"
  install -m644 "lib/tlclient/open_source_licenses.txt" "$pkgdir/usr/share/licenses/$pkgname/open_source_licenses.txt"

  cp -R lib "$pkgdir/usr/"

  install -Dm644 "etc/tlclient.conf" "$pkgdir/etc/tlclient.conf"
  install -Dm755 "bin/tlclient" "$pkgdir/usr/bin/tlclient"
  install -Dm755 "bin/tlclient-openconf" "$pkgdir/usr/bin/tlclient-openconf"

  install -Dm644 "../tlclient.desktop" "$pkgdir/usr/share/applications/tlclient.desktop"
  install -Dm644 "../tlclient.png" "$pkgdir/usr/share/$pkgname/tlclient.png"
}
