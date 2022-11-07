# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Jason Moore <j at sonmoore dot me>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Cobalt Space <cobaltspace at protonmail dot com>

pkgname=blobsaver-bin
_pkgname=blobsaver
pkgver=3.3.0
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
source=("$url/releases/download/v$pkgver/blobsaver-$pkgver.tar.gz")
sha256sums=('17b17758429fcc6187ae1260cb70eb0e82329e865a7b103fb68ca05ac6e4d7f2')

package() {
  gendesk -f -n --pkgname "$_pkgname" --pkgdesc "$pkgdesc" \
    --exec="$_pkgname" --categories=Utility --icon "$_pkgname"

  #install -Dm755 "$srcdir/lib" "${pkgdir}/opt/$_pkgname"
  mkdir -p "$pkgdir/opt/$_pkgname"
  cp -r "$srcdir/bin" "${pkgdir}/opt/$_pkgname"
  cp -r "$srcdir/lib" "${pkgdir}/opt/$_pkgname"
  

  # install binary symlink
  mkdir -p "$pkgdir/usr/bin/"
  ln -sf "/opt/$_pkgname/bin/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  
  install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$srcdir/lib/blobsaver.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
