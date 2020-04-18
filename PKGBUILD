# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Cobalt Space <cobaltspace at protonmail dot com>

pkgname=blobsaver
pkgver=2.5.0
pkgrel=1
pkgdesc="A cross-platform GUI app for saving SHSH blobs using tsschecker"
arch=('any')
url='https://github.com/airsquared/blobsaver'
license=('GPL-3.0')
depends=('java-runtime=8' 'java8-openjfx' 'archlinux-java-run' 'libfragmentzip')
optdepends=('libimobiledevice: Get plugged in device information'
			'libirecovery: Utility to talk to iBoot/iBSS via USB')
makedepends=('gendesk')
source=("${url}/releases/download/v${pkgver}/blobsaver-linux.tar.gz")
md5sums=('d5fffa4c30776df2b679387ad3bd8543')

package() {
  gendesk -f -n --pkgname "${pkgname}" --pkgdesc "${pkgdesc}" \
   --exec="${pkgname}" --categories=Utility --icon "${pkgname}"
  echo "#!/usr/bin/env bash
archlinux-java-run -a 8 -b 8 -- -jar /usr/share/java/blobsaver/blobsaver.jar
" > "${pkgname}.sh"
  install -Dm755 "$srcdir/$pkgname.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm755 "$srcdir/tsschecker" "$pkgdir/usr/share/java/$pkgname/tsschecker"
  install -Dm775 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}