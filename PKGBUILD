# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=hot-babe
pkgver=0.2.2
pkgrel=11
pkgdesc="A system load monitor that displays the system activity in a very special way"
arch=('i686' 'x86_64')
url="https://community.linuxmint.com/software/view/hot-babe"
license=('custom')
depends=('gtk2' 'desktop-file-utils')
makedepends=('pkgconfig')
install=$pkgname.install
source=(http://ftp.vim.org/ftp/os/Linux/distr/jolicloud/apt/mirrors/pool/free/h/$pkgname/${pkgname}_${pkgver}.orig.tar.gz
        $pkgname.desktop)
sha256sums=('b903c6cdfacfa10e1dbd30fadef292382bf0a49757e2acb05bf6474a30d7791b'
            'eecbf8157030fdc161ef67a6886d7be9dd344470acc0f82d215177b573fe36f7')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  sed -i -e 's|/local||g' -e 's|-g||g' Makefile
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

  install -Dm644 "${srcdir}"/$pkgname.desktop "${pkgdir}"/usr/share/applications/$pkgname.desktop
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
