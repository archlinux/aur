# Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Michael Straube <michael_straube web de>
# Contributor: Etzos <supercodingmonkey @ gmail.com>
# Contributor: Gordin <9ordin @t gmail dot com>
# Contributor: Geequlim <geequlim@gmail.com>
# Contributor: Antti Juhani Oja <antti.oja@gmail.com>

pkgname=spriteilluminator
pkgver=1.5.2
pkgrel=2
pkgdesc="Tool for creating Normal Maps, also known as Dot3 Bump Maps, which generate a 2.5D effect in different game engines including Cocos2D-X"
arch=('x86_64')
url="http://www.codeandweb.com/$pkgname"
license=("custom:$pkgname")
install="$pkgname.install"
depends=('shared-mime-info' 'hicolor-icon-theme' 'desktop-file-utils' 'grantlee'
		 'gcc-libs-multilib' 'qt5-svg' 'qt5-declarative' 'qt5-imageformats'
		 'qt5-quickcontrols')
source=("https://www.codeandweb.com/download/$pkgname/${pkgver}/SpriteIlluminator-${pkgver}-ubuntu64.deb")
sha256sums=("8ddfd32d3d1722abc8f52937a11b86e4ddedba1fb0d55a1b2dff241a3df00eac")

build() {
    ar -x "SpriteIlluminator-${pkgver}-ubuntu64.deb"
}

package() {
    cd ${srcdir}/

    # Extract to the $pkgdir.
    tar xJf data.tar.xz -C "${pkgdir}/"

    # Enter $pkgdir.
    cd ${pkgdir}/usr/lib/$pkgname/

	# FIXME: There's a symbol in the spriteilluminator Qt library that's not in
	# the official repository. Double check if we can use the Qt library from
	# the official repository on future versions

    ## Delete all the extra lib folders.
    #rm -rf generic/ grantlee/ iconengines/ imageformats/ platforminputcontexts/ platforms/ \
    #       QtGraphicalEffects/ QtQml/ QtQuick/ QtQuick.2/ xcbglintegrations/

    ## Delete the useless lib files.
    #rm -rf libGrantlee* libicudata* libicui18n* libicuuc* libQt5*

    ## Get rid of the Qt configuration that messes up LD_LIBRARY_PATH.
    #rm -rf qt.conf

    install -Dm644 "${pkgdir}/usr/share/$pkgname/documents/LicenseAgreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LicenseAgreement.txt"
}
