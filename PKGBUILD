# Maintainer: basigur

pkgname=papirus-folders-nordic
_pkgname=papirus-folders
pkgver=4.2
pkgrel=1
pkgdesc="Icons themes papirus color folder nordic"
arch=('any')
url="https://github.com/basigur/papirus-folders"
license=("LGPL3")
depends=('gtk-update-icon-cache' 'papirus-icon-theme')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/basigur/papirus-folders/archive/v${pkgver}.tar.gz")
sha256sums=('9f25d269734fd387fb052d9e16bde1ac04f5926e44a821a3e20620f8b8c4426f')


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

