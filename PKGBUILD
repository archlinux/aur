# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Jenya Sovetkin <e.sovetkin <at> gmail <dot> com>
# Contributor: K. Piche <kpiche <at> rogers <dot> com>

pkgname=ripmime
pkgver=r13
_commit=a556ffe08d620602475c976732e8e1a82f3169e9
pkgrel=1
epoch=1
pkgdesc='MIME/email package decoder'
arch=(any)
url="https://github.com/inflex/ripMIME"
license=('BSD')
conflicts=('ripmime-git')
source=("git+https://github.com/inflex/${pkgname}.git#commit=$_commit")
sha256sums=('SKIP')
makedepends=('git')

build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/man/man1"
  make LOCATION="${pkgdir}/usr" install

  # Proper location for man pages
  mkdir "${pkgdir}/usr/share"
  mv "${pkgdir}/usr/man" "${pkgdir}/usr/share/man"

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
