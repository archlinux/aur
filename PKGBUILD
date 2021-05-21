# Maintainer: Jason Moore <j at sonmoore dot me>
# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Cobalt Space <cobaltspace at protonmail dot com>

pkgname=blobsaver-bin
_pkgname=blobsaver
pkgver=2.5.5
pkgrel=1
pkgdesc="A cross-platform GUI app for saving SHSH blobs using tsschecker"
arch=('x86_64')
url='https://github.com/airsquared/blobsaver'
license=('GPL3')
depends=('java-runtime=8'
         'java8-openjfx'
         'archlinux-java-run'
         'libfragmentzip'
         'bash'
         'zlib'
         )
provides=('blobsaver')
optdepends=('libimobiledevice: Get plugged in device information'
    'libirecovery: Utility to talk to iBoot/iBSS via USB')
makedepends=('gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/blobsaver-linux.tar.gz")
sha256sums=('8937da15c27d24c6df30afaadd39201cde406f3c3647cb4cb310d864d299fe76')

package() {
  gendesk -f -n --pkgname "${_pkgname}" --pkgdesc "${pkgdesc}" \
    --exec="${_pkgname}" --categories=Utility --icon "${_pkgname}"
  echo "#!/usr/bin/env bash
  archlinux-java-run -a 8 -b 8 -- -jar /opt/blobsaver/blobsaver.jar
  " > "${_pkgname}.sh"
  install -Dm755 "$srcdir/blobsaver/tsschecker" -t "${pkgdir}/opt/${_pkgname}"
  install -Dm755 "$srcdir/blobsaver/blobsaver.jar" -t "${pkgdir}/opt/${_pkgname}"
  install -Dm775 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
