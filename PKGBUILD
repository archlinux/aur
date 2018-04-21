# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=budgie-weather-applet
pkgver=0.0.1
pkgrel=1
pkgdesc="A weather applet for Budgie Desktop"
url='https://github.com/ilgarmehmetali/budgie-weather-applet'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('libpeas' 'budgie-desktop' 'gnome-settings-daemon' 'json-glib' 'libgweather')
makedepends=('gobject-introspection' 'meson' 'ninja' 'vala')
source=("https://github.com/ilgarmehmetali/${pkgname}/archive/v${pkgver}.tar.gz"
        "https://github.com/ilgarmehmetali/${pkgname}/pull/16.patch"
        dep_gtk3-3.22.patch)
sha512sums=('7c7591ae2e4c9120ab5427b027def37787147c65de54e9e9ae89cbbcac512c83729145e15fbed423f275970280594c1f3ddf22962e1235474f7c6d3cf811a277'
            '8eb7c38af9ef2aaa6160d52c53a6735745968c0abd7c432860e0c2f954af9b4ef32001b4883ebaf96dc0fd724bd5d473d9010d796e7cfeffbc4ad81e71ee4632'
            '5ceeb5431e1955683d4c7578142369f8847c0fbebe54c248b0ccdac4c6ad724bd07e4ed9c35f5b62342266be8f617230050939bd988ee8cd0756105938b6c30b')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  patch -p1 -i ../16.patch
  patch -p0 -i ../dep_gtk3-3.22.patch
  mkdir -p build
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  meson --prefix /usr --buildtype=plain ..
  ninja
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  DESTDIR="${pkgdir}" ninja install
}
