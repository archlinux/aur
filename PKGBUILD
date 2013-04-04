# vim:set ft=sh:
# Maintainer: Bartłomiej Piotrowski <barthalion@gmail.com>
# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: ruario <ruario AT opera DOT com>
# Contributor: Daniel Isenmann <daniel AT archlinux DOT org>
# Contributor: dorphell <dorphell AT archlinux DOT org>
# Contributor: Sigitas Mazaliauskas <sigis AT gmail DOT com>

pkgname=opera
_ver=12.15
_build=1748
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
  sha256sums=('602eff2177b42d809c44c832cb961eb5cfad1d502d20af31f082a703bee2eae2')
elif [[ $CARCH == x86_64 ]]; then
  _arch=$CARCH
  source=(http://get.geo.opera.com/pub/opera/linux/${_ver/./}/opera-${_ver}-${_build}.${_arch}.linux.tar.xz)
  sha256sums=('249e74b1fdf0c2d32813f76bd1f54eaf0a41473ee46957924016b604cc16888d')
fi

package() {
  opera-${_ver}-${_build}.${_arch}.linux/install --prefix /usr --repackage $pkgdir/usr
  install -Dm 644 $pkgdir/usr/share/$pkgname/defaults/license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt
}
