# Maintainer: Håvard Pettersson <mail@haavard.me>

pkgname=simplicitystudio
pkgver=4
pkgrel=6
pkgdesc='Design tools, documentation, software and support resources for EFM32™, EFM8™, 8051, Wireless MCUs and Wireless SoCs.'
arch=(x86_64)
url=https://www.silabs.com/products/development-tools/software/simplicity-studio
license=(unknown)
backup=("opt/$pkgname/studio.ini")
depends=(webkitgtk2 gtk2 libxtst qt4 lib32-glibc)
optdepends=('lib32-qt4: for old tools like battery estimator')
options=('!strip')
install=simplicitystudio.install
source=(https://www.silabs.com/documents/login/software/SimplicityStudio-v4.tgz
        simplicitystudio.sh
        simplicitystudio.desktop)
sha256sums=('f053c5ce8796bbb0707fc8ac37adddae2ca9eb2913b382972d26d56f838b8dad'
            'bc844e45b04bd73f684206de38b67be186634b63a850cacd1e6ed374ae9c0579'
            '498146460e23f86f7f0fb5512bc5b2c4f77820d72dc592da8ff5015a5c7cf614')

prepare() {
  cd "$srcdir/SimplicityStudio_v4"
}

package() {
  install -dm755 "$pkgdir/opt/"
  cp -a "$srcdir/SimplicityStudio_v4" "$pkgdir/opt/simplicitystudio"

  install -dm755 "$pkgdir/etc/udev/rules.d/"
  find "$srcdir/SimplicityStudio_v4/StudioLinux" -name '*.rules' \
    -exec install -m644 {} "$pkgdir/etc/udev/rules.d/" \;

  install -Dm755 simplicitystudio.sh "$pkgdir/usr/bin/simplicitystudio"
  install -Dm644 "simplicitystudio.desktop" \
    "$pkgdir/usr/share/applications/simplicitystudio.desktop"

  # installation directory has to be writable
  find "$pkgdir/opt/simplicitystudio" -type d -exec chmod a+w {} +
  find "$pkgdir/opt/simplicitystudio" -type f -exec chmod a+w {} +
}

# vim:set ts=2 sw=2 et:
