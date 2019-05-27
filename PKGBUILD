# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Max Zhao <alcasa dot mz at gmail dot com>
# Contributor: Leonard König <leonard.r.koenig at googlemail dot com>

pkgname=endless-sky
pkgver=0.9.9
pkgrel=1
arch=('i686' 'x86_64')
url="http://endless-sky.github.io/"
depends=(openal libpng glew hicolor-icon-theme libjpeg-turbo sdl2 libmad)
makedepends=(scons)
optdepends=('endless-sky-high-dpi: high resolution graphics assets'
            'endless-sky-editor: map editor')
license=('GPL3' 'CCPL' 'custom:public domain')
pkgdesc="A space exploration and combat game similar to Escape Velocity"
source=("$pkgname-$pkgver.tar.gz::https://github.com/endless-sky/endless-sky/archive/v${pkgver}.tar.gz")
sha512sums=('3e46ffea3f15b276a837b1e53b416a48564a578dc009055b35704060bf8e63df4eef368814cf75da80448e2b942a0b40212555d29286a78f22c1c877661def6d')

build() {
  cd $pkgname-$pkgver
  scons
}


package() {
  cd $pkgname-$pkgver

  # Install executable
  install -Dm755 -t "${pkgdir}/usr/bin" endless-sky

  # resources
  install -Dm644 credits.txt "${pkgdir}/usr/share/games/${pkgname}/credits.txt"
  install -Dm644 keys.txt "${pkgdir}/usr/share/games/${pkgname}/keys.txt"
  cp -rf data images sounds "${pkgdir}/usr/share/games/${pkgname}/"

  # .desktop
  install -Dm644 -t "${pkgdir}/usr/share/applications" endless-sky.desktop

  # icons
  for res in 16 22 24 32 48 128 256 512; do
    install -Dm644 \
      "${srcdir}/${pkgname}-${pkgver}/icons/icon_${res}x${res}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${pkgname}.png"
  done

  # manpage
  install -Dm644 -t "${pkgdir}/usr/share/man/man6" endless-sky.6

  # copyright
  install -Dm644 copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
