# Maintainer: Ariel AxionL <axionl@aosc.io>

pkgname=color-picker
pkgver=1.1.5
pkgrel=2
pkgdesc="A color picker for elementary OS."
arch=('x86_64')
depends=('granite')
makedepends=('meson' 'vala')
conflicts=("color-picker-git")
provides=("colorpicker")
url="https://github.com/RonnyDo/ColorPicker"
license=("GPL3")
source=("https://raw.githubusercontent.com/RonnyDo/ColorPicker/master/LICENSE")
source_x86_64=("ColorPicker-$pkgver.tar.gz::https://github.com/RonnyDo/ColorPicker/archive/$pkgver.tar.gz")

sha256sums=('589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2')
sha256sums_x86_64=('15118e3139215ae8d26e48f3834fd1b5a4cde6aa8b062972b666bea8c1ba5bbe')

build() {
    cd $srcdir/ColorPicker-$pkgver
    meson _build --prefix=/usr -DGETTEXT_PACKAGE=${pkgname}
    cd _build
    ninja
}

package() {
    install -Dm755 LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE

    cd $srcdir/ColorPicker-$pkgver/_build

    DESTDIR="$pkgdir/" ninja install

    ln -s "/usr/bin/com.github.ronnydo.colorpicker" "${pkgdir}/usr/bin/colorpicker"
}
