# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Cobalt Space <cobaltspace at protonmail dot com>

pkgname=blobsaver-bin
_pkgname=blobsaver
pkgver=2.5.0
pkgrel=2
provides=('blobsaver')
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
  gendesk -f -n --pkgname "${_pkgname}" --pkgdesc "${pkgdesc}" \
   --exec="${_pkgname}" --categories=Utility --icon "${_pkgname}"
  echo "#!/usr/bin/env bash
archlinux-java-run -a 8 -b 8 -- -jar /usr/share/java/blobsaver/blobsaver.jar
" > "${_pkgname}.sh"
  install -Dm755 "$srcdir/$_pkgname.jar" "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar"
  install -Dm755 "$srcdir/tsschecker" "$pkgdir/usr/share/java/$_pkgname/tsschecker"
  install -Dm775 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}