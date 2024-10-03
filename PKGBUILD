# Maintainer:  Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=taskopen
pkgver=2.0.2
pkgrel=2
pkgdesc="Script for taking notes and open urls with taskwarrior"
arch=('i686' 'x86_64')
url="http://github.com/jschlatow/taskopen/"
license=('GPL-2.0-or-later')
depends=('task>=2.5.0')
optdepends=('xdg-utils: easily use default application associated with a file type'
            'perl: for rawedit script')
makedepends=('make' 'nim')
source=("https://codeload.github.com/jschlatow/taskopen/tar.gz/v${pkgver}")
sha256sums=("249cce42ac427376a8909e81e49f2d2ba0e79d29b9f83224560cb45df8b7d31c")

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  make VERSION=${pkgver} PREFIX="/usr" || return 1
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  make VERSION=${pkgver} DESTDIR="$pkgdir" PREFIX="/usr" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
