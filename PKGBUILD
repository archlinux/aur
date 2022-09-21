# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Jenya Sovetkin <e.sovetkin <at> gmail <dot> com>
# Contributor: K. Piche <kpiche <at> rogers <dot> com>

pkgname=ripmime
_pkgname=ripMIME
pkgver=1.4.1.0
pkgrel=1
epoch=1
pkgdesc='Email attachment extractor'
arch=(any)
url='https://github.com/inflex/ripMIME'
license=('BSD')
conflicts=('ripmime-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/inflex/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('6d551d6b65b4da6c6b8dfd05be8141026cc760ca1fb8a707b7bf96c199c9f52d')

build() {
  cd "$_pkgname-$pkgver"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/man/man1"
  make LOCATION="${pkgdir}/usr" install

  # Proper location for man pages
  mkdir "${pkgdir}/usr/share"
  mv "${pkgdir}/usr/man" "${pkgdir}/usr/share/man"

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
