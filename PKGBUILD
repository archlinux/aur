# Contributor: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Etzos <supercodingmonkey @ gmail.com>
# Contributor: Gordin <9ordin @t gmail dot com>
# Contributor: Geequlim <geequlim@gmail.com>
# Contributor: Antti Juhani Oja <antti.oja@gmail.com>
# Contributor: Pasha Finkelshteyn <me@asm0dey.site>


pkgname=physicseditor
pkgver=1.9.3
pkgrel=1
pkgdesc="Physics editor for certain game engines such as Cocos2D-X, Corona SDK, etc."
arch=('x86_64')
url="http://www.codeandweb.com/$pkgname"
license=("custom:$pkgname")
install="$pkgname.install"
depends=('shared-mime-info' 'hicolor-icon-theme' 'desktop-file-utils' 'grantlee'
		 'gcc-libs-multilib' 'qt5-svg' 'qt5-declarative' 'qt5-imageformats'
		 'qt5-quickcontrols')
source=("$pkgname-$pkgver.deb::https://www.codeandweb.com/download/$pkgname/$pkgver/PhysicsEditor-$pkgver.deb")
sha256sums=('0fa190bc16c493c001f36e8df59776b42501c5acbf729df79670eb7dcca86d67')

build() {
    ar -x "$pkgname-$pkgver.deb"
}

package() {
    cd ${srcdir}/

    # Extract to the $pkgdir.
    tar xJf data.tar.xz -C "${pkgdir}/"

    # Enter $pkgdir.
    cd ${pkgdir}/usr/lib/$pkgname/

	# IMPORTANT NOTE: It looks like codeandweb stopped compiling with the -fPIC
	# flag. We must keep the bloat for now.

    # Delete all the extra lib folders.
    #rm -rf generic/ grantlee/ iconengines/ imageformats/ platforminputcontexts/ platforms/ \
    #       QtGraphicalEffects/ QtQml/ QtQuick/ QtQuick.2/ xcbglintegrations/

    # Delete the useless lib files.
    #rm -rf libGrantlee* libicudata* libicui18n* libicuuc* libQt5*

    # Get rid of the Qt configuration that messes up LD_LIBRARY_PATH.
    #rm -rf qt.conf

    install -Dm644 "${pkgdir}/usr/share/$pkgname/documents/LicenseAgreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LicenseAgreement.txt"
}
