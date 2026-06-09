# Maintainer: Oleksii <aleksieiev.o.y@gmail.com>
pkgname=localwp
_pkgname=local
pkgver=10.1.1
_build=6939
pkgrel=6939
pkgdesc="The #1 local WordPress development tool. (Official .rpm repack)"
arch=('x86_64')
url="https://localwp.com/"
license=('custom:proprietary')
depends=('libxcrypt-compat' 'numactl' 'ncurses5-compat-libs' 'libaio' 'gtk3' 'nss' 'libjpeg-turbo' 'libxss' 'libxslt')
provides=('local-by-flywheel-bin')
conflicts=('local-by-flywheel-bin')
options=('!strip' 'emptydirs')
source=("local-${pkgver}-linux.rpm::https://cdn.localwp.com/releases-stable/${pkgver}+${_build}/local-${pkgver}-linux.rpm")
sha1sums=('1d9ad5cbd7afeaeec71ecdcf7edbbb63a166553d')

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
