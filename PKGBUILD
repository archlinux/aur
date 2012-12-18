# Maintainer: Bartłomiej Piotrowski <barthalion@gmail.com>
# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: ruario <ruario AT opera DOT com>
# Contributor: Daniel Isenmann <daniel AT archlinux DOT org>
# Contributor: dorphell <dorphell AT archlinux DOT org>
# Contributor: Sigitas Mazaliauskas <sigis AT gmail DOT com>

pkgname=opera
_ver=12.12
_build=1707
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
  sha256sums=('7f766faa08d62be616ea43cf4bb026c8b6afb5a51fa8eae1227f16d5658779ca')
elif [[ $CARCH == x86_64 ]]; then
  _arch=$CARCH
  source=(http://ftp.opera.com/pub/opera/linux/${_ver/./}/opera-${_ver}-${_build}.${_arch}.linux.tar.xz)
  sha256sums=('1ba428bd5acf4f17a8ef0f970fb9e1334477468abbf21612dd8c2eec5fff9129')
fi

package() {
  opera-${_ver}-${_build}.${_arch}.linux/install --prefix /usr --repackage $pkgdir/usr
  install -Dm 644 $pkgdir/usr/share/$pkgname/defaults/license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt
}
