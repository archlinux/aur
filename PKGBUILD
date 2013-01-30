# Maintainer: Bartłomiej Piotrowski <barthalion@gmail.com>
# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: ruario <ruario AT opera DOT com>
# Contributor: Daniel Isenmann <daniel AT archlinux DOT org>
# Contributor: dorphell <dorphell AT archlinux DOT org>
# Contributor: Sigitas Mazaliauskas <sigis AT gmail DOT com>

pkgname=opera
_ver=12.13
_build=1734
pkgver=$_ver.$_build
pkgrel=1
pkgdesc='Fast and secure web browser and Internet suite'
arch=('i686' 'x86_64')
url='http://www.opera.com/browser/'
license=('custom:opera')
depends=('gcc-libs' 'libxt' 'freetype2' 'libxext' 'glib2'
         'shared-mime-info' 'hicolor-icon-theme' 'desktop-file-utils')
optdepends=('gstreamer0.10-base-plugins: HTML5 Video support'
            'gstreamer0.10-good: HTML5 Video support')
install=$pkgname.install
options=(!strip !zipman)


  #source=(http://get.geo.opera.com/pub/opera/linux/${_ver/./}/opera-${_ver}-${_build}.i386.linux.tar.xz
  #http://get.geo.opera.com/pub/opera/linux/${_ver/./}/opera-${_ver}-${_build}.x86_64.linux.tar.xz)

if [[ $CARCH == i686 ]]; then
  _arch=i386
  source=(http://get.geo.opera.com/pub/opera/linux/${_ver/./}/opera-${_ver}-${_build}.${_arch}.linux.tar.xz)
  sha256sums=('8f5d825ad95122c79bb612fa252732f59fd9f97417d976f9503753dda37ef1b4')
elif [[ $CARCH == x86_64 ]]; then
  _arch=$CARCH
  source=(http://get.geo.opera.com/pub/opera/linux/${_ver/./}/opera-${_ver}-${_build}.${_arch}.linux.tar.xz)
  sha256sums=('d980e7e2a362d89c712022b1a1e2822bf4fcc16d7858c1b9111c2d579ef9c2c9')
fi

package() {
  opera-${_ver}-${_build}.${_arch}.linux/install --prefix /usr --repackage $pkgdir/usr
  install -Dm 644 $pkgdir/usr/share/$pkgname/defaults/license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt
}
