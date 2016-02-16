# Contributor: Harold Leboulanger <harold.leboulanger AT gmail DOT com>
# Maintainer: McNoggins <gagnon88 AT gmail DOT com>
pkgname=ttwatch-git
pkgver=20160107
pkgrel=1
pkgdesc="TomTom GPS Watch Utilities"
arch=('i686' 'x86_64')
url="https://github.com/ryanbinns/ttwatch"
license=('MIT')
groups=()
depends=('libusb' 'curl')
makedepends=('git' 'curl' 'libusb' 'openssl')
source=('ttwatch-git::git+https://github.com/ryanbinns/ttwatch.git'
	'ttwatch-git.install')
md5sums=('SKIP'
         'b0aee8ee7a7e68d6ff056da4a72c7b72')
install="ttwatch-git.install"

noextract=()

pkgver() {
  # Use date of latest commit for pkgver
  cd "$pkgname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "$pkgname"
  ./configure --prefix="$pkgdir/usr"
  make
}

package() {
  cd "$pkgname"
  install -d ${pkgdir}/usr/bin
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make install

}

