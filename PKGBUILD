#Maintainer: Schrottfresse <schrottfresse at gmx dot de>

pkgname=tlclient
pkgver=4.5.0
pkgrel=1
pkgdesc="A remote desktop application"
arch=('i686' 'x86_64' 'armv7h')
url="https://www.cendio.com/thinlinc/download"
license=('custom:cendio')
depends=('python2' 'pygtk' 'openssh' 'libx11' 'alsa-lib' 'zlib')
optdepends=('cups: required for remote printing'
            'python2-ldap: auth against ldap')

source=('tlclient.desktop' 'tlclient.png')
sha256sums=(
  '3db307225f95453eeac89f4fcd4618efd01a977cc66998ba11fc22f97c194004'
  'bb7cdf717ba1ee425be21d6bce245a17f2ba798b7202d9189fc964a408e3208a'
  )

source_x86_64=("https://www.cendio.com/downloads/clients/tl-$pkgver-4930-client-linux-dynamic-x86_64.tar.gz")
sha256sums_x86_64=('2485a72e4f4264ad9b0f5b51de1a1a84a55ca9cb321836376861a09c8ad8b3d4')

source_i686=("https://www.cendio.com/downloads/clients/tl-$pkgver-4930-client-linux-dynamic-i686.tar.gz")
sha256sums_i686=('6ae74fa61fd7d69d200bdd9c4fa986dd889ad6bb2266e0a8d14873062852d42f')

source_armv7h=("https://www.cendio.com/downloads/clients/tl-$pkgver-4930-client-linux-dynamic-armhf.tar.gz")
sha256sums_armv7h=('1365b0b1ff92bdb7a2cfb4fd9238cf805d2ff696bb759d0c2f3993e107416921')

package() {
  cd $srcdir/tl-$pkgver-4930-client-linux-dynamic-*
  install -Dm644 "lib/tlclient/EULA.txt" "$pkgdir/usr/share/licenses/$pkgname/EULA.txt"
  install -m644 "lib/tlclient/open_source_licenses.txt" "$pkgdir/usr/share/licenses/$pkgname/open_source_licenses.txt"

  cp -R lib "$pkgdir/usr/"

  install -Dm644 "etc/tlclient.conf" "$pkgdir/etc/tlclient.conf"
  install -Dm755 "bin/tlclient" "$pkgdir/usr/bin/tlclient"
  install -Dm755 "bin/tlclient-openconf" "$pkgdir/usr/bin/tlclient-openconf"
  
  install -Dm644 "../tlclient.desktop" "$pkgdir/usr/share/applications/tlclient.desktop"
  install -Dm644 "../tlclient.png" "$pkgdir/usr/share/$pkgname/tlclient.png"
}
