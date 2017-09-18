# Maintainer: Hans-Nikolai Viessmann <hv15 @ hw.ac.uk>
_pkgname=cmgui
pkgname="bright-${_pkgname}"
_ver=7.3
pkgver=${_ver}.9241
pkgrel=1
pkgdesc="Bright Clusters Management GUI application"
arch=('x86_64')
url="http://www.brightcomputing.com/documentation"
license=('unknown')
depends=('firefox')
source=("http://support.brightcomputing.com/cmgui-download/${_pkgname}-${_ver}.tar.bz2"
        'cmgui.sh'
        'cmgui.desktop')
md5sums=('30e1c3cf73b84ab9e87b6099f4d491cd'
         '005a904d7c43fdab0df2048766a00cf1'
         '5528f3dbe95ec1376936d9d3c66319c5')
noextract=("${_pkgname}-${pkgver}.tar.bz2")

package() {
  cd "$pkgdir"

  # Install the profile.d file to extend the PATH
  install -Dm755 "$srcdir/cmgui.sh" "$pkgdir/etc/profile.d/cmgui.sh"

  # Install the desktop file
  install -Dm644 "$srcdir/cmgui.desktop" "$pkgdir/usr/share/applications/cmgui.desktop"

  # Extract the archive
  msg2 "Extracting archive"
  install -d "$pkgdir/opt/BrightCMGUI"
  bsdtar --strip-components 1 -xjf "$srcdir/${_pkgname}-${_ver}.tar.bz2" -C "$pkgdir/opt/BrightCMGUI"
}

# vim: ts=2 sw=2 et:
