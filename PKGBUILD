# Maintainer: Hauke Stieler <mail@hauke-stieler.de>

# Contributor: Sven Karsten Greiner <sven@sammyshp.de>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: caemir <benjamin@colard.info>
# Contributor: Eichi <mail@der-eichi.de>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>

pkgname=josm-latest
pkgver=18706
pkgrel=1
pkgdesc="Nightly builds of JOSM, the editor for OpenStreetMap written in Java"
arch=('any')
url="https://josm.openstreetmap.de/"
license=('GPL')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'java-runtime>=11' 'libxtst' 'ttf-font')
makedepends=('subversion')
backup=('etc/conf.d/josm')
conflicts=('josm' 'josm-stable' 'josm-svn')
source=(https://josm.openstreetmap.de/download/josm-snapshot-$pkgver.jar
        josm.conf.d
        josm.sh
        josm::svn+https://josm.openstreetmap.de/svn/trunk#revision=$pkgver)
noextract=(josm-snapshot-$pkgver.jar)
sha256sums=('SKIP'
            '16bbb378a4e4d02c8ea321f3a3a65ad74007bc439720f44c597432a66d0d1646'
            'a30c4824de1570af66e9df2bcbab777b9efea80914a07de498fcfac58789731e'
            'SKIP')

package() {
  cd "${srcdir}"

  #.desktop and icon file
  install -Dm644 josm/native/linux/tested/usr/share/applications/org.openstreetmap.josm.desktop \
        "${pkgdir}"/usr/share/applications/org.openstreetmap.josm.desktop
  install -Dm644 josm/native/linux/tested/usr/share/man/man1/josm.1 \
        "${pkgdir}"/usr/share/man/man1/josm.1
  install -Dm644 josm/native/linux/tested/usr/share/metainfo/org.openstreetmap.josm.appdata.xml \
        "${pkgdir}"/usr/share/metainfo/org.openstreetmap.josm.appdata.xml
  install -Dm644 josm/native/linux/tested/usr/share/icons/hicolor/scalable/apps/org.openstreetmap.josm.svg \
        "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/org.openstreetmap.josm.svg

  for _icon in 8 16 22 24 32 36 40 42 48 64 72 80 96 128 192 256 512; do
      install -Dm644 josm/native/linux/tested/usr/share/icons/hicolor/${_icon}x${_icon}/apps/org.openstreetmap.josm.png \
        "${pkgdir}"/usr/share/icons/hicolor/${_icon}x${_icon}/apps/org.openstreetmap.josm.png
  done

  #executable file
  #install -d "${pkgdir}"/usr/bin
  install -Dm644 josm-snapshot-$pkgver.jar "${pkgdir}"/usr/share/java/josm/josm.jar
  install -Dm755 "josm.sh" "${pkgdir}"/usr/bin/josm

  # configuration
  install -Dm644 "josm.conf.d" "${pkgdir}"/etc/conf.d/josm
}
