# Maintainer:  Caleb Maclennan <caleb@alerque.com>
# Contributor: Joeny Ang <ang.joeny@gmail.com>
# Contributor: Zaler <zldream1011@gmail.com>
# Contributor: joni <kljohann@gmail.com>
# Contributor: Dies <JerryCasiano@gmail.com>

pkgname=font-manager-git
_branch=master
pkgver=0.7.5.r0.gdaf9d39
pkgrel=1
pkgdesc='A simple font management application for GTK+ Desktop Environments'
url='https://fontmanager.github.io'
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxml2' 'sqlite')
optdepends=('file-roller')
makedepends=('git' 'yelp-tools' 'gobject-introspection' 'vala' 'meson' 'ninja')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+https://github.com/FontManager/master.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"

  meson --prefix /usr --buildtype=debugoptimized build_dir
  ninja -v -C build_dir
}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir" ninja -C build_dir install
}
