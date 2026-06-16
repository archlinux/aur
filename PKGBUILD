# Maintainer: konez2k@aur
# Contributor: Wilson E. Alvarez <wilson.e.alvarez1@gmail.com>
# Contributor: Etzos <supercodingmonkey @ gmail.com>
# Contributer: Gordin <9ordin @t gmail dot com>
# Contributor: Geequlim <geequlim@gmail.com>
# Contributor: Antti Juhani Oja <antti.oja@gmail.com>

# grantlee was removed from [extra];
# Install `grantlee` from the AUR before `makepkg -s`, or build with an AUR helper.

pkgname=texturepacker
pkgver=8.0.1
pkgrel=1
pkgdesc="Sprite sheet creator and image optimizer"
arch=('x86_64')
url="https://www.codeandweb.com/$pkgname"
license=("custom:$pkgname")
install="$pkgname.install"
depends=('shared-mime-info' 'hicolor-icon-theme' 'desktop-file-utils'
    'gcc-libs-multilib' 'qt5-svg' 'qt5-declarative' 'qt5-imageformats'
    'qt5-quickcontrols')
source=("https://www.codeandweb.com/download/$pkgname/${pkgver}/TexturePacker-${pkgver}.deb")
sha256sums=('7e9db59e2bae4bf7a75e97035d52e68f01e3c75e7b903e098918db7733050017')
options=('!debug')

build() {
    ar -x "TexturePacker-${pkgver}.deb"
}

package() {
    cd ${srcdir}/

    # Extract to the $pkgdir.
    tar --use-compress-program=zstd -xf data.tar.zst -C "${pkgdir}/"

    # Enter $pkgdir.
    cd ${pkgdir}/usr/lib/$pkgname/

    install -Dm644 "${pkgdir}/usr/share/$pkgname/documents/LicenseAgreement.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LicenseAgreement.txt"
}
