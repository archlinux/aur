# Maintainer: Hanna Rose <imhxnna@gmail.com>
# Contributor: Jambon <jambonmcyeah@gmail.com>

pkgname=ttf-win10
pkgver=19043.928.210409
_minor=1212.21h1
_type="release_svc_refresh"
pkgrel=2
arch=(any)
url='https://docs.microsoft.com/en-us/typography/'
license=(custom)
makedepends=(p7zip)
depends=(fontconfig xorg-fonts-encodings xorg-mkfontscale xorg-mkfontdir)
provides=(ttf-font)
conflicts=(ttf-vista-fonts ttf-ms-win8 ttf-win7-fonts ttf-office-2007-fonts)
pkgdesc="Microsoft Windows 10 TrueType fonts"
_file="${pkgver}-${_minor}_${_type}_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"
source=("https://software-download.microsoft.com/download/pr/${_file}")
sha256sums=("026607e7aa7ff80441045d8830556bf8899062ca9b3c543702f112dd6ffe6078")


prepare() {
    mkdir license
    mkdir fonts
    7z e ${_file} sources/install.wim
    7z e install.wim Windows/Fonts/"*".{ttf,ttc} -o./fonts
    7z e install.wim Windows/System32/Licenses/neutral/"*"/"*"/license.rtf -o./license -y
}

package() {
    install -Dm644 fonts/* -t $pkgdir/usr/share/fonts/Microsoft/
    install -Dm644 license/license.rtf -t "$pkgdir/usr/share/licenses/$pkgname"
}
