# Maintainer: Andras Biro <bbandi86@gmail.com>
# Contributor: Håvard Pettersson <mail@haavard.me> for studio4

pkgname=simplicitystudio5-bin
pkgver=5
pkgrel=1
pkgdesc='Design tools, documentation, software and support resources for EFM32™, EFM8™, 8051, Wireless MCUs and Wireless SoCs.'
arch=(x86_64)
url=https://www.silabs.com/products/development-tools/software/simplicity-studio
license=(unknown)
backup=("opt/$installdir/studio.ini")
depends=(qt5-base libxtst webkit2gtk)
optdepends=('wine: for IAR support'
            'lib32-qt4: for old tools like battery estimator'
            'qt4: for Segger tools like systemview')
options=('!strip')
install=simplicitystudio5.install
source=(https://www.silabs.com/documents/login/software/SimplicityStudio-5.tgz
        simplicitystudio5.desktop)
sha256sums=('SKIP'
            'd0c7b8d6f8b9bcb8d900dfdb047d5a833aae2d131bc4c675e67aec7e3ac3f0e7')
            
installdir=simplicitystudio5

prepare() {
  cd "$srcdir/SimplicityStudio_v5"
}

package() {
  install -dm755 "$pkgdir/opt/"
  cp -a "$srcdir/SimplicityStudio_v5" "$pkgdir/opt/$installdir"

  install -dm755 "$pkgdir/etc/udev/rules.d/"
  find "$srcdir/SimplicityStudio_v5/StudioLinux" -name '*.rules' \
    -exec install -m644 {} "$pkgdir/etc/udev/rules.d/" \;

  mkdir -p $pkgdir/usr/bin
  ln -sf /opt/$installdir/studio $pkgdir/usr/bin/$installdir
  install -Dm644 "simplicitystudio5.desktop" \
    "$pkgdir/usr/share/applications/simplicitystudio5.desktop"

  # installation directory has to be writable
  find "$pkgdir/opt/$installdir" -type d -exec chmod a+w {} +
  find "$pkgdir/opt/$installdir" -type f -exec chmod a+w {} +
}

# vim:set ts=2 sw=2 et:
