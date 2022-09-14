# Maintainer: Proton Technologies AG <opensource at proton dot me>
# Maintainer: Alexandru Cheltutior <acrandom at pm dot me>
pkgname=protonvpn-gui
_gitpkgname=linux-app
pkgver=1.11.0
pkgrel=1
pkgdesc="Official ProtonVPN Graphical User Interface, maintained by the ProtonVPN team."
arch=("any")
url="https://github.com/ProtonVPN/"
license=("GPL3")
groups=("ProtonVPN")
depends=("python-protonvpn-nm-lib>=3.10.0" "python-gobject" "python-psutil" "gtk3" "python-cairo" "webkit2gtk")
optdepends=("libappindicator-gtk3")
makedepends=("python-setuptools")
source=("https://github.com/ProtonVPN/linux-app/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5693895f61043f6da9e6f0de3880071731a2c90e31cd6f3487214630ec68570f')
validpgpkeys=("6A5571928D2222D83BC7456E4EDE055B645F044F")

build() {
    cd "$_gitpkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_gitpkgname-$pkgver"
    install -d -m755 "${pkgdir}/usr/share/applications"
    install -d -m755 "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"

    cp protonvpn.desktop "${pkgdir}/usr/share/applications/protonvpn.desktop"
    cp ./protonvpn_gui/assets/icons/protonvpn-logo.png "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
    
    python setup.py install --root="$pkgdir" --optimize=1
}
