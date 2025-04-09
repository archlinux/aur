# Maintainer: Stezkoy

_my_pkg=myoffice-standard-home-edition
pkgname=${_my_pkg}-bin
pkgver=3.3.44
pkgrel=5
pkgdesc="A set of office applications for creating text and spreadsheet documents. Home edition."
arch=('x86_64')
url="https://myoffice.ru/products/standard-home-edition/"
license=('EULA')
groups=('myoffice')
depends=('fontconfig' 'freetype2' 'glib2' 'hunspell' 'krb5' 'libcups' 'libglvnd' 'libpng' 'libpulse'
	'libx11' 'libxcb' 'libxext' 'libxkbcommon' 'libxkbcommon-x11' 'libxrender' 'link-grammar' 'lua'
	'mono' 'openssl-1.1' 'pcre2' 'pixman' 'qt5-base' 'qt5-multimedia' 'qt5-svg' 'zlib' 'bc')
options=('!strip' '!emptydirs')
install=${pkgname}.install

source=("${_my_pkg}-${pkgver}.deb::https://preset.myoffice-app.ru/MyOfficeStandardHomeEdition.deb")
sha256sums=('168ed93e9a2ee098b730c95e72a9ce50884f9483e83330503c26a375ad005f47')

package(){
	tar xzf data.tar.gz -C "${pkgdir}"
	#fix "Could not initialize GLX"
	rm -R ${pkgdir}/opt/${_my_pkg}/plugins/xcbglintegrations/
	install -D -m644 "${pkgdir}/opt/${_my_pkg}/Resources/UI/ru/LicenseAgreements.rcc" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
