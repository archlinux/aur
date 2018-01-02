# Maintainer: Alexander Sulfrian <asulfrian at zedat dot fu-berlin dot de>

pkgname='osemu-git'
pkgver=732
pkgrel=1
pkgdesc='A simple (micro) emu for oscam'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h')
url='https://github.com/oscam-emu/OSEmu'
license=('GPL3')
depends=('oscam-git')
install='osemu.install'
source=("$pkgname::git+https://github.com/oscam-emu/OSEmu.git"
        'Remove-embedded-SoftCam-key.patch'
        'Change-default-key-path.patch')
sha256sums=('SKIP'
            'b1d6b39908625e97f22d8e7f7a6bdb7be20b5761ceaa6fa2bc3181333877f4c2'
            '6839b6901aa1fdd39bcc6feb47aeab52bb911627a8d32b9c71f138f4948051a6')

pkgver() {
  cd "$srcdir/$pkgname"
  sed -n 's/^\$Version: \([0-9]*\) *\$$/\1/p' VERSION
}

prepare() {
  cd "$srcdir/$pkgname"
  patch -Np1 -i "$srcdir/Remove-embedded-SoftCam-key.patch"
  patch -Np1 -i "$srcdir/Change-default-key-path.patch"
}

build() {
  cd "$srcdir/$pkgname"
}

package() {
  cd "$srcdir/$pkgname"

  # Install binary
  install -Dm755 OSEmu "$pkgdir/usr/bin/osemu"

  # Install docs
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname"
}
