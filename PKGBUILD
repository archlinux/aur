# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Anthony Wang <a at exozy dot me>

_pkgbase=zenmonitor
pkgname=zenmonitor3
pkgver=2.0.0
pkgrel=2
pkgdesc="Zenmonitor3 is monitoring software for AMD Zen-based CPUs, now with Zen 3 support! "
arch=('x86_64' 'i686')
url="https://github.com/detiam/zenmonitor3"
license=('GPL')
depends=('gtk3')
optdepends=('zenpower: for monitoring AMD Zen-based CPUs')
makedepends=('git')
provides=('zenmonitor')
install=$pkgname.install

source=("$_pkgbase::git+$url.git#commit=1e1ceec7353dc418578fe8ae56536bfee6adeca3")
sha256sums=('2d581105fccf9d5d139a5c1b284d4691499694a2e4ef2866024f86f5ea24d51b')

prepare() {
  cd "$srcdir/$_pkgbase"
  # Fix pkgdir references in desktop files
  sed -i 's/@APP_EXEC@|${DESTDIR}/@APP_EXEC@|/g' makefile
}

build() {
  cd "$srcdir/$_pkgbase"
  make DESTDIR="${pkgdir}" PREFIX="/usr" all
}

package() {
  cd "$srcdir/$_pkgbase"
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
  make DESTDIR="${pkgdir}" PREFIX="/usr" install-cli
}
