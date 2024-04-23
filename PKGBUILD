# Maintainer: Michael Trip <michael at linuxbase dot nl>
# Contributor: Schrottfresse <schrottfresse at gmx dot de>

pkgname=tlclient
pkgver=4.16.0
_buildnr=3389
pkgrel=1
pkgdesc="A remote desktop application"
arch=('x86_64' 'armv7h')
url="https://www.cendio.com/thinlinc/download"
license=('custom:cendio')
depends=('python' 'python-gobject' 'openssh' 'libx11' 'alsa-lib' 'zlib')
optdepends=('cups: required for remote printing'
            'python-ldap: auth against ldap')

source=('tlclient.desktop' 'tlclient.png')
sha256sums=('caa7417fa2f6a530bef2c6ca05f4c8a219ec85add7884fbb7368c0bf18be2988'
            'e0cd5d5b6d752672cc207ad098fe2882268d92c3958adf38d571481e1910c5ef')
sha256sums_x86_64=('ea3a92186cbaf71cc4ab692b3baeadd94b3836242e58705a38fe3683f4f18691')
sha256sums_armv7h=('ec5f602e7d7732dce6b3ba2a48f2908c4a5660652d8fe0f0029556c08a26f624')

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
