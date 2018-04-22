# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=budgie-pixel-saver-applet
pkgver=4.0.0
pkgrel=1
pkgdesc="Pixel Saver applet for Budgie Desktop"
url='https://github.com/ilgarmehmetali/budgie-pixel-saver-applet'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('budgie-desktop' 'gnome-settings-daemon' 'libpeas' 'libwnck3' 'xorg-xprop')
makedepends=('gobject-introspection' 'meson' 'ninja' 'vala')
install=budgie-pixel-saver-applet.install

source=("https://github.com/ilgarmehmetali/${pkgname}/archive/v${pkgver}.tar.gz"
        remove-meson-post-install.patch)
sha512sums=('987c58f2750bb3740b8715feb0900addf1328dba35e70cdf963acf2873885a7474eaf14be727cb01b1d76a52f5befa9b5618abcd2d84c20254b558f753298648'
            '6efedeec94b43120b7e90aba01ee7ab49a75807aa7b620ba797d51da8d23a713f0a6c2ece63ce9f24588cd9aae7b0ada65b5a3e7c97d7055c7f2685d3ad94486')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  patch -p0 -i ../remove-meson-post-install.patch
  mkdir -p build
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  meson --prefix /usr --buildtype=plain ..
  ninja
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  DESTDIR="${pkgdir}" ninja install
}
