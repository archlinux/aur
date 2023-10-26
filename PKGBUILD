# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Jason Moore <j at sonmoore dot me>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Cobalt Space <cobaltspace at protonmail dot com>

pkgname=blobsaver-bin
_pkgname=blobsaver
pkgver=3.6.0
pkgrel=1
pkgdesc="A cross-platform GUI app for saving SHSH blobs using tsschecker"
arch=('x86_64')
url='https://github.com/airsquared/blobsaver'
license=('GPL3')
depends=('bash'
         'zlib'
         )
provides=('blobsaver')
optdepends=('libimobiledevice: Get plugged in device information'
    'libirecovery: Utility to talk to iBoot/iBSS via USB')
makedepends=('gendesk')
source=("$url/releases/download/v$pkgver/blobsaver-$pkgver.tgz")
sha256sums=('465b3abf105af5ac081d8e25af219e2684dce6ab3ff212cbe3acb164453040b6')

package() {
  gendesk -f -n --pkgname "$_pkgname" --pkgdesc "$pkgdesc" \
    --exec="$_pkgname" --categories=Utility --icon "$_pkgname"

  #install -Dm755 "$srcdir/lib" "${pkgdir}/opt/$_pkgname"
  mkdir -p "$pkgdir/opt/$_pkgname"
  cp -r "$srcdir/$_pkgname/bin" "${pkgdir}/opt/$_pkgname"
  cp -r "$srcdir/$_pkgname/lib" "${pkgdir}/opt/$_pkgname"
  

  # install binary symlink
  mkdir -p "$pkgdir/usr/bin/"
  ln -sf "/opt/$_pkgname/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  
  install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$srcdir/$_pkgname/lib/blobsaver.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
