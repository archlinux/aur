# Maintainer: Ouyang Jun <ouyangjun1999@gmail.com>
# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Jove Yu <yushijun110 [at] gmail.com>
# Contributor: Ariel AxionL <axionl at aosc dot io>

pkgname=wps-office-stable
pkgver=10.1.0.6757
#_pkgver=10.1.0.5707~a21
pkgrel=1
pkgdesc="Kingsoft Office (WPS Office) is an office productivity suite"
arch=('i686' 'x86_64')
license=("custom")
url="http://wps-community.org/"
depends=('fontconfig' 'xorg-mkfontdir' 'libxrender' 'desktop-file-utils' 'shared-mime-info' 'xdg-utils' 'glu' 'openssl-1.0' 'sdl2' 'libpulse' 'hicolor-icon-theme')
optdepends=('cups: for printing support'
            'libjpeg-turbo: JPEG image codec support'
            'pango: for complex (right-to-left) text support'
            'curl: An URL retrieval utility and library'
            'ttf-wps-fonts: Symbol fonts required by wps-office'
            'ttf-ms-fonts: Microsft Fonts recommended for wps-office')
conflicts=('kingsoft-office' 'wps-office')
provides=('wps-office')
options=('!emptydirs')
install=${pkgname}.install
[[ "$CARCH" = "i686" ]] && _archext=x86 || _archext=x86_64
source_i686=("http://kdl.cc.ksosoft.com/wps-community/download/6757/wps-office_${pkgver}_x86.tar.xz")
source_x86_64=("http://kdl.cc.ksosoft.com/wps-community/download/6757/wps-office_${pkgver}_x86_64.tar.xz")
sha512sums_i686=('ba5001f0fd2a605c3688084d34aa293a728ac46d52379cea6db8c5232c4331e60476d5845087002071f89ec9d8bdf7c020222b4aaff780736eaeff5a273f40ee')
sha512sums_x86_64=('5f9f88cc9795a317267531cb1cd260d86e1613dc5eef34005eaa58dd8ac0715ce3ba1da60ee83c617cb16d759b0da9274963f8a4fb4a86c4890eca0565af9c62')





prepare() {
    cd wps-office_${pkgver}_$_archext

    sed -i 's|/opt/kingsoft/wps-office|/usr/lib|' wps wpp et
}

package() {
    cd wps-office_${pkgver}_$_archext

    install -d "${pkgdir}/usr/lib"
    cp -r office6 "${pkgdir}/usr/lib"

    install -d "${pkgdir}/usr/bin"
    install -m755 wps wpp et "${pkgdir}/usr/bin"

    install -d "${pkgdir}/usr/share/applications"
    cp -r resource/applications/* "${pkgdir}/usr/share/applications"

    install -d "${pkgdir}/usr/share/icons"
    cp -r resource/icons/* "${pkgdir}/usr/share/icons"

    install -d "${pkgdir}/usr/share/mime"
    cp -r resource/mime/* "${pkgdir}/usr/share/mime"

    install -d "${pkgdir}/usr/share/fonts/wps-office"


    install -Dm644 office6/mui/default/EULA.txt "${pkgdir}/usr/share/licenses/$pkgname/EULA.txt"
}
