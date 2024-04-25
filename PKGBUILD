# Maintainer: Solomon Choina <shlomochoina@gmail.com
pkgname=mintmenu
pkgver=6.1.7
pkgrel=1
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
source=("$pkgname-$pkgver::git+$url#commit=7c034738de085f319a8d87bfe7d459f82f3a70b8"
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
