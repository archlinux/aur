# Maintainer: Paragoumba <aur@paragoumba.fr>
# Contributor: Mario Ray MahardhikZza <leledumbo_cool@yahoo.co.id>
# Contributor: James Cuzella <james.cuzella@lyraphase.com>

_package=net.downloadhelper.coapp
pkgname=vdhcoapp-bin
pkgver=2.0.9
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
source=(https://github.com/aclap-dev/vdhcoapp/releases/download/v${pkgver}/vdhcoapp-${pkgver}-linux-x86_64.deb
        vdhcoapp-install.hook
        vdhcoapp-remove.hook
        vdhcoapp-user-install.hook
        vdhcoapp-user-remove.hook)
sha256sums=('533558913d2381cc4352e60001b023ca4d596a65cbe933308dbd23d8e4b6884e'
            'a2b56e6ae3f7f8933e20762baa90e69f63f0802b2e6d213b51e0bc68843e5d27'
            '3287859986d67e15e269965676bf9c75d1e853ea0ec97695811072fb8f10a7a8'
            'a74a57aac6b2e76ded9524599d3047486f9f2d8f820c5114ad41209c8117ab35'
            'fddf971ed2d6d976cd6ce34f9f04c9c2d18c03112eccda44ccf887cda0344b7c')

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
