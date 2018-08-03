# Maintainer: Solomon Choina <shlomochoina@gmail.com
pkgname=mintmenu
pkgver=5.9.0
pkgrel=1
pkgdesc="Mint Menu for MATE"
arch=('any')
url="https://github.com/linuxmint/mintmenu"
license=('GPL2')
depends=('mate-panel' 'xdg-utils' 'python2')
optdepends=('mint-translations: translations files'
            'mate-screensaver: lock screen button'
            'pamac: package manager button'
)
source=("${url}/archive/${pkgver}.tar.gz" 
        'arch-compat.patch')
sha256sums=('c2d2a2e7a84a07c0277440b6ee82e96c4575b6e9c5b2bbdc6dcd2779db13a51a'
            '5bc384c52d437cf00b3824e7cf783de080841f1a34c6f85db0328b13e72c983f')


prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  patch -Np1 -i ../arch-compat.patch

}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  cp -R usr "$pkgdir/"
  cd "$pkgdir"/usr/lib/linuxmint/mintMenu
  ./compile.py
}
