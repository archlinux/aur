# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: aksr <aksr at t-com dot me>
pkgname=meowsql-git
pkgver=0.4.14alpha.r0.g45fefbf
pkgrel=1
epoch=1
pkgdesc='Lightweight database GUI client for MariaDB/MySQL/PostgreSQL, a C++/Qt clone of HeidiSQL'
arch=('i686' 'x86_64')
url='https://github.com/ragnar-lodbrok/meow-sql'
license=('GPL2')
depends=('qt5-base'
         'mariadb-libs'
         'postgresql-libs')
makedepends=('git')
optdepends=('mariadb'
            'postgresql')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"

  # Generate git tag based version. Use only tags created on current branch (--first-parent). Count only proper v#.#* [#=number] tags.
  git describe --long --tags --first-parent --match 'v[0-9][0-9.][0-9.]*' | sed 's=^v==;s=^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)=\1\2=;s=\([0-9]\+-g\)=r\1=;s=-=.=g'
}

build() {
  cd "$pkgname"
  qmake-qt5 meowsql.pro
  make
}

package() {
  cd "$pkgname"
  install -D -m755 meowsql $pkgdir/usr/bin/meowsql
  install -D -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
}
