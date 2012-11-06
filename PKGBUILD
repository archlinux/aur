# Maintainer: Bartłomiej Piotrowski <barthalion@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: ruario <ruario AT opera DOT com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Daniel Isenmann <daniel AT archlinux DOT org>
# Contributor: dorphell <dorphell AT archlinux DOT org>
# Contributor: Sigitas Mazaliauskas <sigis AT gmail DOT com>

pkgname=opera
_ver=12.10
_build=1652
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

if [[ $CARCH == i686 ]]; then
  _arch=i386
  source=(http://ftp.opera.com/pub/opera/linux/${_ver/./}/opera-${_ver}-${_build}.${_arch}.linux.tar.xz)
  sha256sums=('e7a099b0ca20307e7682fdec4aaec4bd2856cf1d3ae75e1da67b76cfda5fe619')
elif [[ $CARCH == x86_64 ]]; then
  _arch=$CARCH
  source=(http://ftp.opera.com/pub/opera/linux/${_ver/./}/opera-${_ver}-${_build}.${_arch}.linux.tar.xz)
  sha256sums=('d5fc0d8db10fe083a3e1df4c1dac2e983656c2a54bb6352f84be93e61e80ded4')
fi

package() {
  opera-${_ver}-${_build}.${_arch}.linux/install --prefix /usr --repackage $pkgdir/usr
  install -Dm 644 $pkgdir/usr/share/$pkgname/defaults/license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt
}
