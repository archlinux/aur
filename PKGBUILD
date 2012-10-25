# Maintainer: Bartłomiej Piotrowski <barthalion@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: ruario <ruario AT opera DOT com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Daniel Isenmann <daniel AT archlinux DOT org>
# Contributor: dorphell <dorphell AT archlinux DOT org>
# Contributor: Sigitas Mazaliauskas <sigis AT gmail DOT com>

pkgname=opera
_ver=12.02
_build=1629
pkgver=$_ver.$_build
pkgrel=1
pkgdesc='A fast and secure web browser and Internet suite'
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
  sha256sums=('458e070c5e0be98030af490b9ccee85cb052208f171d6ff143d01d4096232470')
elif [[ $CARCH == x86_64 ]]; then
  _arch=$CARCH
  source=(http://ftp.opera.com/pub/opera/linux/${_ver/./}/opera-${_ver}-${_build}.${_arch}.linux.tar.xz)
  sha256sums=('4dd89d0f657b263073bb6fc5c7ca333aea8a958c2981b0a31e13b2a81626d7ad')
fi

package() {
  opera-${_ver}-${_build}.${_arch}.linux/install --prefix /usr --repackage $pkgdir/usr
  install -D -m 644 $pkgdir/usr/share/$pkgname/defaults/license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt
}
