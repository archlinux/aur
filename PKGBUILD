# Maintainer: Paragoumba <aur@paragoumba.fr>
# Contributor: Mario Ray MahardhikZza <leledumbo_cool@yahoo.co.id>
# Contributor: James Cuzella <james.cuzella@lyraphase.com>

_package=net.downloadhelper.coapp
pkgname=vdhcoapp-bin
pkgver=2.0.13
pkgrel=1
pkgdesc="Companion application for Video DownloadHelper browser add-on, precompiled binary version"
provides=("vdhcoapp=${pkgver}")
conflicts=('vdhcoapp')
arch=('x86_64')
url="https://github.com/aclap-dev/vdhcoapp"
license=('GPL2')
depends=('ffmpeg' 'orc')
makedepends=()
options=('!strip') # IMPORTANT! DO NOT REMOVE THIS, OTHERWISE THE BINARY WILL BE BROKEN!
source=(https://github.com/aclap-dev/vdhcoapp/releases/download/v${pkgver}/vdhcoapp-linux-x86_64.deb
        vdhcoapp-install.hook
        vdhcoapp-remove.hook
        vdhcoapp-user-install.hook
        vdhcoapp-user-remove.hook)
sha256sums=('80bf299d0ed7f1ac57ed79deee7b5b685a264d4fdd0a2524eeb7bc22509828ef'
            'a2b56e6ae3f7f8933e20762baa90e69f63f0802b2e6d213b51e0bc68843e5d27'
            '3287859986d67e15e269965676bf9c75d1e853ea0ec97695811072fb8f10a7a8'
            'a08c02d934709cdea4392fce155bec0b33147e386ed154bed959c5b78788ea83'
            'f7406ae5ba7fb6602426ef97540f86e057a7fd6d01a917e5af3638f1d64b2ce9')

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
