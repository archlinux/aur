# Maintainer: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Anton Shestakov <engored@ya.ru>

_pkgname=supermodel
pkgname=$_pkgname-git
pkgver=r918.a60f998
pkgrel=1
pkgdesc='A Sega Model 3 Arcade Emulator'
arch=('i686' 'x86_64')
url='http://www.supermodel3.com/'
license=('GPL3')
depends=('mesa' 'sdl' 'zlib' 'glu' 'sdl2_net')
makedepends=('git')
install=supermodel.install
source=('supermodel.sh'
        "$_pkgname::git+https://github.com/trzy/Supermodel.git")
md5sums=('ea8274c2a37acddd026fce9c831530cc'
         'SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make -f 'Makefiles/Makefile.UNIX'
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 "$srcdir/supermodel.sh" "$pkgdir/usr/bin/supermodel"

  install -Dm755 "bin/supermodel" "$pkgdir/usr/share/supermodel/Supermodel"

  install -Dm644 "Docs/LICENSE.txt" "$pkgdir/usr/share/licenses/supermodel/LICENSE"
  install -Dm644 "Docs/README.txt" "$pkgdir/usr/share/doc/supermodel/README"

  install -d "$pkgdir/usr/share/supermodel/Config"
  install -m644 Config/* "$pkgdir/usr/share/supermodel/Config/"
}
