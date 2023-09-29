# Maintainer: Paragoumba <paragoumba@protonmail.com>
# Contributor: Mario Ray MahardhikZza <leledumbo_cool@yahoo.co.id>

_package=net.downloadhelper.coapp
pkgname=vdhcoapp-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="Companion application for Video DownloadHelper browser add-on, precompiled binary version"
provides=("vdhcoapp=${pkgver}")
conflicts=('vdhcoapp')
arch=('x86_64')
url="https://github.com/mi-g/vdhcoapp"
license=('GPL2')
depends=('ffmpeg' 'orc')
makedepends=()
options=('!strip') # IMPORTANT! DO NOT REMOVE THIS, OTHERWISE THE BINARY WILL BE BROKEN!
source=(https://github.com/aclap-dev/vdhcoapp/releases/download/v${pkgver}/vdhcoapp-${pkgver}-linux-x86_64.deb
        vdhcoapp-install.hook
        vdhcoapp-remove.hook)
sha256sums=('cf4e1b02b90fd9b6bf6b4072688c956d21ac292f3a36feed2e395f6e5eb81723'
            'a2b56e6ae3f7f8933e20762baa90e69f63f0802b2e6d213b51e0bc68843e5d27'
            '3287859986d67e15e269965676bf9c75d1e853ea0ec97695811072fb8f10a7a8')

prepare() {
  rm control.tar.xz
  rm debian-binary
  mkdir -p "${srcdir}/${pkgname}"
  tar xf data.tar.xz -C "${pkgname}"
}

package() {
  cp -Rfp "${srcdir}/${pkgname}/"* "${pkgdir}/"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/libalpm/hooks"
  mkdir -p "${pkgdir}/opt/${_package}/converter/build/linux/64/"
  ln -s /usr/bin/ffmpeg "${pkgdir}/opt/${_package}/converter/build/linux/64/ffmpeg"
  ln -s /usr/bin/ffprobe "${pkgdir}/opt/${_package}/converter/build/linux/64/ffprobe"
  ln -s /usr/bin/ffplay "${pkgdir}/opt/${_package}/converter/build/linux/64/ffplay"
  ln -s "/opt/vdhcoapp/vdhcoapp" "${pkgdir}/usr/bin/vdhcoapp"

  # Install Hooks
  cp -fpL "${srcdir}/"*.hook "${pkgdir}/usr/share/libalpm/hooks/"
}
