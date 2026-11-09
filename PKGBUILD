# Maintainer:  Johannes Schlatow <johannes.schlatow@googlemail.com>

pkgname=taskopen
pkgver=2.0.3
pkgrel=1
pkgdesc="Script for taking notes and open urls with taskwarrior"
arch=('i686' 'x86_64')
url="https://codeberg.org/jschlatow/taskopen/"
license=('GPL-2.0-or-later')
depends=('task>=2.5.0')
optdepends=('xdg-utils: easily use default application associated with a file type'
            'perl: for rawedit script')
makedepends=('make' 'nim')
source=("https://codeberg.org/jschlatow/taskopen/archive/v${pkgver}.tar.gz")
sha256sums=("e3cf7b505ec2f8f6c622f195628e45655df6a0496cbff9abf7ab78c0793eeb63")

build() {
  cd "$srcdir/${pkgname}"

  make VERSION=${pkgver} PREFIX="/usr" || return 1
}

package() {
  cd "$srcdir/${pkgname}"

  make VERSION=${pkgver} DESTDIR="$pkgdir" PREFIX="/usr" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
