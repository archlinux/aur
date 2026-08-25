# Maintainer: Oleksii <aleksieiev.o.y@gmail.com>
pkgname=localwp
_pkgname=local
pkgver=10.1.2
_build=7004
pkgrel=7004
pkgdesc="The #1 local WordPress development tool. (Official .rpm repack)"
arch=('x86_64')
url="https://localwp.com/"
license=('custom:proprietary')
depends=('libxcrypt-compat' 'numactl' 'ncurses5-compat-libs' 'libaio' 'gtk3' 'nss' 'libjpeg-turbo' 'libxss' 'libxslt')
provides=('local-by-flywheel-bin')
conflicts=('local-by-flywheel-bin')
options=('!strip' 'emptydirs')
source=("local-${pkgver}-linux.rpm::https://cdn.localwp.com/releases-stable/${pkgver}+${_build}/local-${pkgver}-linux.rpm")
sha1sums=('9d909b09e8a40b58bafeff1d2a897165ae195f6a')

package() {
  # Unpacking within the s r c directory happens automatically
  # Copy the structure to the package folder
  cp -ra "${srcdir}/usr" "${pkgdir}/"
  cp -ra "${srcdir}/opt" "${pkgdir}/"

  # Let's create a convenient symbolic link to run the command 'localwp'
  install -d "${pkgdir}/usr/bin"
  ln -sf /opt/Local/local "${pkgdir}/usr/bin/${pkgname}"

  # Fix for the Electron sandbox
  chmod u+s "${pkgdir}/opt/Local/chrome-sandbox"
}
