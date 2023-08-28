# Maintainer: Michael Trip <michael at linuxbase dot nl>
# Contributor: Schrottfresse <schrottfresse at gmx dot de>

pkgname=tlclient
pkgver=4.15.0
_buildnr=3258
pkgrel=2
pkgdesc="A remote desktop application"
arch=('x86_64' 'armv7h')
url="https://www.cendio.com/thinlinc/download"
license=('custom:cendio')
depends=('python' 'python-gobject' 'openssh' 'libx11' 'alsa-lib' 'zlib')
optdepends=('cups: required for remote printing'
            'python-ldap: auth against ldap')

source=('tlclient.desktop' 'tlclient.png')
sha256sums=('caa7417fa2f6a530bef2c6ca05f4c8a219ec85add7884fbb7368c0bf18be2988'
            'bb7cdf717ba1ee425be21d6bce245a17f2ba798b7202d9189fc964a408e3208a')
sha256sums_x86_64=('9b1ffc0a1481296d2cd92bdf9a8b94a905b161e8af1301a23c67a4c55fe15bba')
sha256sums_armv7h=('201527870fac6a6d9e8374e9c6a311df2ccdf29927fddf146a7c23abdfe227d6')

source_x86_64=("https://www.cendio.com/downloads/clients/tl-$pkgver-$_buildnr-client-linux-dynamic-x86_64.tar.gz")
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
