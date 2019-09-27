# Maintainer: basigur

pkgname=papirus-folders-nordic
_pkgname=papirus-folders
pkgver=4.1
pkgrel=1
pkgdesc="Icons themes papirus color folder nordic"
arch=('any')
url="https://github.com/basigur/papirus-folders"
license=("LGPL3")
depends=('gtk-update-icon-cache' 'papirus-icon-theme')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/basigur/papirus-folders/archive/v${pkgver}.tar.gz")
sha256sums=('fbfad9e7372669b750fa8f13fcdefea69d11c6407e1e85f6b2f6bbf8e1ee493c')


prepare() {
  cd "${_pkgname}"-"${pkgver}"
    sed -i 's!gtk-update-icon-cache!#gtk-update-icon-cache!' papirus-nordic.sh
    sed -i 's!fakeroot!#fakeroot!' papirus-nordic.sh
    sed -i 's!cd build!#cd build!' papirus-nordic.sh
}


build() {
  cd "${_pkgname}"-"${pkgver}"
    chmod +x papirus-nordic.sh
    ./papirus-nordic.sh
    chmod -x papirus-nordic.sh
}


package() {
  cd "${_pkgname}"-"${pkgver}"
    install -d "${pkgdir}/usr/share/icons"
    install -Dm644 README.md "$pkgdir"/usr/share/doc/"$pkgname"/README.md
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
    cp -r build/*/ "$pkgdir/usr/share/icons/"
}

