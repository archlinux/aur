# Maintainer: Bartłomiej Piotrowski <barthalion@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: ruario <ruario AT opera DOT com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Daniel Isenmann <daniel AT archlinux DOT org>
# Contributor: dorphell <dorphell AT archlinux DOT org>
# Contributor: Sigitas Mazaliauskas <sigis AT gmail DOT com>

pkgname=opera
pkgver=12.00
_buildver=1467
pkgrel=1
pkgdesc="A fast and secure web browser and Internet suite."
arch=('i686' 'x86_64')
url="http://www.opera.com/browser/"
license=('custom:opera')
depends=('gcc-libs' 'libxt' 'freetype2' 'libxext' 'glib2'
         'shared-mime-info' 'hicolor-icon-theme' 'desktop-file-utils')
optdepends=('gstreamer0.10-base-plugins: HTML5 Video support'
            'gstreamer0.10-good: HTML5 Video support')
install=${pkgname}.install
options=(!strip !zipman)

if [ "$CARCH" = "i686" ]; then
    _arch=i386
    source=(http://ftp.opera.com/pub/opera/linux/${pkgver/./}/opera-${pkgver}-${_buildver}.${_arch}.linux.tar.xz)
	sha256sums=('d5683f5a4cf0cfd9ce715359b77909c7923c85bcec98513907c1844285356fdc')
elif [ "$CARCH" = "x86_64" ]; then
    _arch=$CARCH
    source=(http://ftp.opera.com/pub/opera/linux/${pkgver/./}/opera-${pkgver}-${_buildver}.${_arch}.linux.tar.xz)
	sha256sums=('7c3dbe122b1fd20123f1b48a420dea080cc24ede4183d47d66b383c2b7ca5051')
fi

package() {
	opera-${pkgver}-${_buildver}.${_arch}.linux/install --prefix /usr --repackage "${pkgdir}/usr"
	install -D -m 644 "${pkgdir}/usr/share/${pkgname}/defaults/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
