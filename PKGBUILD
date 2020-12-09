# Maintainer: Solomon Choina <shlomochoina@gmail.com
pkgname=mintmenu
pkgver=6.1.1
pkgrel=2
pkgdesc="Mint Menu for MATE"
arch=('any')
url="https://github.com/linuxmint/mintmenu"
license=('GPL2')
depends=('mate-panel' 'xdg-utils' 'python' 'python-gobject' 
         'python-xlib' 'python-setproctitle' 'xapp' 'python-unidecode')
makedepends=('git')
optdepends=('mint-translations: translations files'
            'mate-screensaver: lock screen button'
            'pamac: package manager button'
)
source=("$pkgname-$pkgver::git+$url#commit=b807a89b682e65c9d9f9b1051f366157d5af6e67" 
        'arch-compat.patch')
sha256sums=('SKIP'
            'ad3b5267206782ea5631d030dc827b7f24c5eb6d5b71964d432e3ccb19266a9f')


prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  patch -Np1 -i ../arch-compat.patch

}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  cp -R usr "$pkgdir/"
  cd "$pkgdir"/usr/lib/linuxmint/mintMenu
  find . -type f -name '*.py' | xargs -n1 python3 -m compileall . 

}
