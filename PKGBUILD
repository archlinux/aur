# Maintainer: oliver at first.in-berlin.de
# Former Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Mildred <silkensedai@online.fr>

pkgname=omake
pkgver=0.9.8.6_0.rc1
pkgrel=5
pkgdesc="A build system designed for scalability and portability"
arch=('i686' 'x86_64')
url="http://omake.metaprl.org/index.html"
license=('GPL2')
depends=('readline' 'gamin')
makedepends=('make' 'ocaml' 'patch')
source=(http://pkgs.fedoraproject.org/repo/pkgs/ocaml-omake/omake-0.9.8.6-0.rc1.tar.gz/fe39a476ef4e33b7ba2ca77a6bcaded2/omake-0.9.8.6-0.rc1.tar.gz
        disable-warnings.patch)

prepare() {
  cd "$srcdir/$pkgname-${pkgver%_*}"

  patch -Np0 -i "$srcdir/disable-warnings.patch"
}

build() {
  cd "$srcdir/$pkgname-${pkgver%_*}"

  make bootstrap
  make PREFIX=/usr all
}

package() {
  cd "$srcdir/$pkgname-${pkgver%_*}"
  make PREFIX=/usr INSTALL_ROOT="$pkgdir" install
}

md5sums=('fe39a476ef4e33b7ba2ca77a6bcaded2'
         '36633380e0c64235ee0fbfea2386f254')
