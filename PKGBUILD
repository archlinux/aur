# Maintainer: Adam Harvey <adam@adamharvey.name>
pkgname=kgames
pkgver=1.0
pkgrel=1
pkgdesc="A collection of old Xt/Xaw games refurbished to use modern drawing"
arch=('x86_64')
url="https://keithp.com"
license=('BSD' 'MIT')
groups=()
depends=('libxaw' 'libxrender' 'freetype2' 'fontconfig' 'cairo' 'libxft' 'librsvg')
makedepends=('meson' 'ninja' 'git' 'bison')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
# The omnibus copyright file that covers the entire package is only available
# in the Debian package, unfortunately.
source=("$pkgname::git+https://keithp.com/cgit/kgames.git#tag=$pkgver" 'https://metadata.ftp-master.debian.org/changelogs//main/k/kgames/kgames_1.0-2_copyright')
noextract=()
sha512sums=('SKIP'
            'bc7a13078071c4876d726d407dffc54fc35a95f6aa29baf6ec1e7729a6e166f7fbe12c474fd99692324eaf77ba662761775234c1d08cbcc4343812952007d78f')

build() {
  cd "$pkgname"

  rm -rf build
  meson build --prefix=/usr
  ninja -C build
}

package() {
  cd "$pkgname"

  DESTDIR="$pkgdir/" ninja -C build install
  install -Dm644 ../kgames_1.0-2_copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
