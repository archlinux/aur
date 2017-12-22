# Maintainer: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Etzos <supercodingmonkey @ gmail.com>
# Contributer: Gordin <9ordin @t gmail dot com>
# Contributor: Geequlim <geequlim@gmail.com>
# Contributor: Antti Juhani Oja <antti.oja@gmail.com>

pkgname=texturepacker
pkgver=4.6.1
pkgrel=1
pkgdesc="Sprite sheet creator and image optimizer"
arch=('x86_64')
url="https://www.codeandweb.com/$pkgname"
license=("custom:$pkgname")
install="$pkgname.install"
depends=('shared-mime-info' 'hicolor-icon-theme' 'desktop-file-utils' 'grantlee-qt5'
         'gcc-libs-multilib' 'qt5-svg' 'qt5-declarative' 'qt5-imageformats'
         'qt5-quickcontrols')
source=("http://www.codeandweb.com/download/$pkgname/${pkgver}/TexturePacker-${pkgver}-ubuntu64.deb")
sha256sums=("c891db802489fdebcce55ae55d6f1418c5d794fff4a86bed7bfdc5dd21827edf")


build() {
    ar -x "TexturePacker-${pkgver}-ubuntu64.deb"
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
