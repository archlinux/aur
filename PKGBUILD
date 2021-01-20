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
         'zlib')
provides=('blobsaver')
optdepends=('libimobiledevice: Get plugged in device information'
    'libirecovery: Utility to talk to iBoot/iBSS via USB')
makedepends=('gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/blobsaver-linux.tar.gz")
sha256sums=('c9da14626c5bcc6b20c03fea9793622c18428ac5a2078744a8c5359420a716e0')

package() {
  gendesk -f -n --pkgname "${_pkgname}" --pkgdesc "${pkgdesc}" \
    --exec="${_pkgname}" --categories=Utility --icon "${_pkgname}"
  echo "#!/usr/bin/env bash
  archlinux-java-run -a 8 -b 8 -- -jar /opt/blobsaver/blobsaver.jar
  " > "${_pkgname}.sh"
  install -Dm755 "$srcdir/tsschecker" -t "${pkgdir}/opt/${_pkgname}"
  install -Dm755 "$srcdir/blobsaver.jar" -t "${pkgdir}/opt/${_pkgname}"
  install -Dm775 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
