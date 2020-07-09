# Maintainer: Guillaume Hayot <ghayot[at]postblue[dot]info>
pkgname=ayatana-ido
pkgver=0.4.90
pkgrel=2
pkgdesc='Ayatana Indicator Display Objects'
arch=('x86_64')
url='https://github.com/AyatanaIndicators/ayatana-ido'
license=('LGPL2.1' 'LGPL3')
depends=('gtk3' 'glib2')
makedepends=('mate-common' 'gtk-doc' 'gobject-introspection' 'vala')
source=("https://github.com/AyatanaIndicators/$pkgname/archive/$pkgver.tar.gz"
        "https://github.com/AyatanaIndicators/ayatana-ido/commit/9e2cc8f1a7684f388758ddc34fd352b480b24039.patch"
	"https://github.com/AyatanaIndicators/ayatana-ido/commit/033c9f49dbb70842094ca89017ab58faf9540bb9.patch")
sha512sums=('51daa6ee69cbd52be87d40a573a89b1c46f301adef4b4b84ca7fd7b96fe48008907c876fedd578f642e360c5d8b0ca1c976b654f598dea60f1b0b47dcbae3dce'
            'be88c858e76302f50751563db4c812ec13d722d20ab655fd79ac1a27e9eff4ec38cd3fb11a6a21b3e0656d60ce1bbd5fb30ece37f7c17aadda7a51c85ff20fb2'
            '83c1eae004315b0558add4304fe8a2c384aca9fe9f258d9bdd3048e56adbdd324e9cd9bbb5ed6e9b2642768fb411ecf711d0cefcd12e7777a7f4fc9748b1fbb5')

prepare() {
    cd "$pkgname-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/033c9f49dbb70842094ca89017ab58faf9540bb9.patch"
    patch --forward --strip=1 --input="${srcdir}/9e2cc8f1a7684f388758ddc34fd352b480b24039.patch"
}

build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  find ${pkgdir}/usr/lib -name *.la -delete
}
