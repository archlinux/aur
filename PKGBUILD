# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
_pkgname=cmgui
pkgname="bright-${_pkgname}"
_ver=7.3
pkgver=${_ver}.9290
pkgrel=1
pkgdesc="Bright Clusters Management GUI application"
arch=('any')
url="https://www.brightcomputing.com/documentation"
_dlurl="https://support.brightcomputing.com/cmgui-download/"
license=('unknown')
depends=('firefox' 'sed')
#makedepends=('curl')
source=("${_dlurl}/${_pkgname}-${_ver}.tar.bz2"
        'cmgui.sh'
        'cmgui.desktop')
noextract=("${_pkgname}-${_ver}.tar.bz2")
md5sums=('c94eebd7bce74d847290fa0b02ee370a'
         '005a904d7c43fdab0df2048766a00cf1'
         '5528f3dbe95ec1376936d9d3c66319c5')

# might want to use this in future, if checksum only check isn't sufficent
#pkgver() {
#  local rev="$(curl -s "$_dlurl" | sed -nE "s|.*Bright Cluster Manager ${_ver} CMGUI for Linux \(revision ([0-9]{4})\).*|\1|p")"
#  printf "%s.%d" "$_ver" "$rev"
#}

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
