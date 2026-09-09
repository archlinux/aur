# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=papirus-folder-icons
pkgver=0.1.0
pkgrel=2
pkgdesc="An expanded set of custom folder icons for the Papirus Icon Theme using Font Awesome symbolics."
arch=('any')
url="https://gitlab.com/benleppke/papirus-folder-icons"
license=('GPL-3.0-or-later')
depends=('papirus-icon-theme')
makedepends=('setconf')
options=('!strip')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz"
        'setup.patch')
sha256sums=('c5b75e8f9adc42516189b00ca0076c90e414e8bce670aa23b312160b17999b0b'
            '587cdcf8ee81ab101a8880ca11a48e2cfa8456c31c87a2962583bd882931b215')

prepare() {
  cd "$pkgname-v$pkgver"

  # Don't run gtk-update-icon-cache
  patch -Np1 -i ../setup.patch

  setconf setup.sh SYSTEM_DEST_DIR ""$pkgdir/usr/share/icons""
}

package() {
  cd "$pkgname-v$pkgver"
  sh setup.sh --install --system --force
}
