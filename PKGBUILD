# Maintainer: Cornelius Sevald-Krause <cornelius.sevald at protonmail dot com>

pkgname=mendoza
pkgver=0.0.3
pkgrel=1
pkgdesc="Static site generator written in Janet"
url="https://github.com/bakpakin/mendoza"
arch=('x86_64')
license=('MIT')
depends=('janet-lang')
optdepends=('janet-spork: run debug server')
makedepends=('git')
provides=('mdz')
source=("$pkgname-$pkgver$customver::git+https://github.com/bakpakin/$pkgname.git#tag=$pkgver")
sha256sums=('1077d1bd3ceb813ba690a1e0f2b2f20e83ae39ae0bd0fa5ab97016005b46ffb6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  jpm --local build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  _modpath="$(janet -e '(print (dyn :syspath))')"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}" \
    "${pkgdir}/${_modpath}" \
    "${pkgdir}/usr/share/man/man1"

  # Install documentatino
  install -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md

  jpm --dest-dir="${pkgdir}" \
    --modpath="${_modpath}" \
    --binpath="/usr/bin" install
}
