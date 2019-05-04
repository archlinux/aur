# Maintainer Joey Dumont <joey.dumont@gmail.com>
# Contributor: Harold Leboulanger <harold.leboulanger AT gmail DOT com>
# Contributor: McNoggins <gagnon88 AT gmail DOT com>
pkgname=ttwatch-git
pkgver=20190211
pkgrel=1
pkgdesc="TomTom GPS Watch Utilities"
arch=('i686' 'x86_64')
url="https://github.com/ryanbinns/ttwatch"
license=('MIT')
groups=()
depends=('libusb' 'curl' 'protobuf' 'protobuf-c')
makedepends=('git' 'curl' 'libusb' 'openssl' 'cmake')
source=('ttwatch-git::git+https://github.com/ryanbinns/ttwatch.git'
	'ttwatch-git.install')
sha256sums=('SKIP'
            'c2583dfb88ae16e9349406f9e0025b20d54b0404bfd77c5d4555f11856ae2396')
install="ttwatch-git.install"

noextract=()

pkgver() {
  # Use date of latest commit for pkgver
  cd "$pkgname"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "$pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr . 
  make
}

package() {
  cd "$pkgname"
  install -d ${pkgdir}/usr/bin
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  make install

}

