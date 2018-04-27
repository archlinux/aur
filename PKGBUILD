# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=budgie-brightness-control-applet
pkgver=0.2
pkgrel=2
pkgdesc="Brightness control applet for budgie desktop"
arch=('i686' 'x86_64')
url='https://github.com/ilgarmehmetali/budgie-brightness-control-applet'
license=('GPL2')
depends=('budgie-desktop' 'gnome-settings-daemon' 'libpeas')
makedepends=('gobject-introspection' 'meson' 'ninja' 'vala')

source=("https://github.com/ilgarmehmetali/${pkgname}/archive/v${pkgver}.tar.gz"
        gsd-backlight-helper.patch)
sha512sums=('d73bb509c0f901feed3841b0d52f637ef2f9ae3628cac02f14eec4e1532ae17e0d5784795c081967c083ff79961097b2b0aa46fdc4761e760a91fca5e11d0624'
            '0df83d04eef6c8f041cf8ca3e345ec4b8e2699b40423e4db71f53733471f798e184114b0cdea585280176058016264cbd9ce42a6be44c427e2dfe4833bb3bb44')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}/src"
  patch -p0 -i ../../gsd-backlight-helper.patch
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  mkdir -p build
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  meson --prefix /usr --buildtype=plain ..
  ninja
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  DESTDIR="${pkgdir}" ninja install
}
