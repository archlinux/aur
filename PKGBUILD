# Maintainer: ByteHamster <info at bytehamster dot com>
# Contributor: Jake <aur@ja-ke.tech>
# Contributor: Aurelien Cibrario <aurelien.cibrario at gmail dot com>
# Contributor: David Manouchehri <manouchehri at riseup dot net>
# Contributor: Peter-Paul van Gemerden <info at ppvg dot nl>
# Contributor: Karsten Hinz <k.hinz at tu-bs dot de>

pkgname=pycam-git
pkgver=r2178.4687f2f6
pkgrel=1
pkgdesc='Toolpath generator for 3-axis CNC machining, written in Python.'
arch=('i686' 'x86_64')
url='https://github.com/SebKuzminsky/pycam'
license=('GPL3')
makedepends=('git')
depends=('python-opengl' 'python-svg.path' 'python-yaml' 'python-opengl')

conflicts=('pycam')
source=('git+https://github.com/SebKuzminsky/pycam.git'
        'launcher.sh')
sha512sums=('SKIP'
    '6a16811823683a9c50b076714259d7bbfebd8be7dbf156da803b681dcc252b9984100690d55db82a30ddad81db4f10eeb5dd7f8abd00dee0fb1dfee7e81d1c18')

pkgver() {
  cd "${srcdir}/pycam"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Application
  mkdir -p "${pkgdir}/usr/share/"
  cp -R "${srcdir}/pycam" "${pkgdir}/usr/share/pycam-git"

  # Start script
  install -Dm755 "${srcdir}/launcher.sh" "${pkgdir}/usr/bin/pycam"

  # freedesktop.org compatibility
  install -Dm644 "${srcdir}/pycam/share/desktop/pycam.desktop" "${pkgdir}/usr/share/applications/pycam.desktop"
  install -Dm644 "${srcdir}/pycam/share/mime/icons/32x32/application-sla.png" "${pkgdir}/usr/share/pixmaps/pycam.png"
  install -Dm644 "${srcdir}/pycam/share/mime/application-sla.svg" "${pkgdir}/usr/share/pixmaps/pycam.svg"
  install -Dm644 "${srcdir}/pycam/share/mime/pycam.xml" "${pkgdir}/usr/share/mime/application/pycam.xml"
}
