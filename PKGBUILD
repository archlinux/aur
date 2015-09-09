# Maintainer: Maximilien Di Dio      <mrgamerlix@gmail.com>

pkgname=probuild-git
_pkgname_simple=probuild
pkgver=r119.dd9d243
pkgrel=1
pkgdesc="An amelioration of GCC compiler which allow to compile a program without links in the command !"
arch=('any')
url="https://gitlab.com/MaximilienLIX/probuild"
license=('LGPL3')
depends=('gcc')
makedepends=('git' 'cmake')
source=("git+https://gitlab.com/MaximilienLIX/probuild.git")
md5sums=('SKIP')

pkgver() {
   cd "$_pkgname_simple"
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
   cd "$_pkgname_simple/LINUX"
   cmake -DCMAKE_INSTALL_PREFIX=/usr
   make
}

package() {
   cd "$_pkgname_simple/LINUX"
   install -d "$pkgdir/usr/bin/"
   install -d "$pkgdir/usr/share/man/man1/"
   install -m755 "$srcdir/$_pkgname_simple/LINUX/bin/probuild" "$pkgdir/usr/bin"
   install -m644 "$srcdir/$_pkgname_simple/LINUX/doc/probuild.gz" "$pkgdir/usr/share/man/man1/"
}
