#Maintainer: Schrottfresse <schrottfresse at gmx dot de>

pkgname=tlclient
pkgver=4.7.0
_buildnr=5280
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

source_x86_64=("https://www.cendio.com/downloads/clients/tl-$pkgver-$_buildnr-client-linux-dynamic-x86_64.tar.gz")
sha256sums_x86_64=('d53283140de2266cea067a622c1481bbc0e5c39be8579ff950945957fb0f8060')

source_i686=("https://www.cendio.com/downloads/clients/tl-$pkgver-$_buildnr-client-linux-dynamic-i686.tar.gz")
sha256sums_i686=('14c2d9df6039656ea808ff79c1b3bd567140406c7fc7432b38a1b6d232533334')

source_armv7h=("https://www.cendio.com/downloads/clients/tl-$pkgver-$_buildnr-client-linux-dynamic-armhf.tar.gz")
sha256sums_armv7h=('bb86c4d561d3c6eca2f3b9e43ef8db945d20e8538f673b15aea7bfd739222b50')

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
