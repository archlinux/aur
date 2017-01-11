# Maintainer: Michael Straube <straubem@gmx.de>

pkgname=floodit
pkgver=0.1.1
pkgrel=4
pkgdesc="A flood it clone written in python"
arch=('any')
license=('unknown')
url="https://github.com/metulburr/FloodIt"
depends=('python2-pygame')
source=("$pkgname-$pkgver.tar.gz::https://github.com/metulburr/FloodIt/archive/$pkgver.tar.gz"
        "fix-savepath.patch"
        "floodit.desktop"
        "floodit")
sha256sums=('14555e32aeebd3e817723d6c7e3d4fe64b4d75bc6a85d07f74c7790dfdbf2e94'
            '53d73c5742a82316ec5744898d3703616de9c00308cbbffb7c9158576380a720'
            '98040abbaf0d84a4ee4fd111a1ebc5c906448033f77e11abfbd6c84030e9e770'
            '3e3d622870eeb1f67919c816d366b2b912535e928c474570c2363a2c5f6cb0d0')

prepare() {
  cd FloodIt-$pkgver

  sed -i 's/python/python2/' game.py

  patch -p0 < ../fix-savepath.patch
}

package() {
  cd FloodIt-$pkgver

  install -d "$pkgdir"/usr/share/floodit
  cp -r data resources game.py "$pkgdir"/usr/share/floodit

  install -Dm755 ../floodit "$pkgdir"/usr/bin/floodit
  install -Dm644 ../floodit.desktop "$pkgdir"/usr/share/applications/floodit.desktop
}
