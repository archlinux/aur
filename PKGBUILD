# Maintainer: Mario Ray MahardhikZza <leledumbo_cool@yahoo.co.id>

pkgname=vdhcoapp-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Companion application for Video DownloadHelper browser add-on, precompiled binary version"
arch=('i686' 'x86_64')
url="https://github.com/mi-g/vdhcoapp"
license=('GPL2')
depends=('ffmpeg' 'orc')
makedepends=()
options=('!strip') # IMPORTANT! DO NOT REMOVE THIS, OTHERWISE THE BINARY WILL BE BROKEN!
source=(https://github.com/mi-g/vdhcoapp/releases/download/v${pkgver}/net.downloadhelper.coapp-${pkgver}-1_amd64.deb
        vdhcoapp-install.hook
        vdhcoapp-remove.hook)
sha256sums=('c365cf8ed2f8880a6ddc1501d0f262899961f5a18cfeefeb5665e61619a9f078'
            'a2b56e6ae3f7f8933e20762baa90e69f63f0802b2e6d213b51e0bc68843e5d27'
            '3287859986d67e15e269965676bf9c75d1e853ea0ec97695811072fb8f10a7a8')

prepare() {
  rm control.tar.gz
  rm debian-binary
  mkdir -p ${srcdir}/${pkgname}
  tar xf data.tar.gz -C ${pkgname}
}

package() {
  cp -Rfp ${srcdir}/${pkgname}/* ${pkgdir}/
  mkdir -p ${pkgdir}/usr/bin
  ln -s /opt/net.downloadhelper.coapp/bin/net.downloadhelper.coapp-linux-64 ${pkgdir}/usr/bin/vdhcoapp
}
