# Maintainer: Felix Yan <felixonmars@gmail.com>

pkgname=pmgmusic
pkgver=1.0
pkgrel=2
pkgdesc="PMG - a VOS clone for linux"
arch=('i686' 'x86_64')
url="https://github.com/felixonmars/pmgmusic"
license=('GPL')
depends=("popt" "alsa-lib" "gtk2" "glib2" "libglade")
optdepends=('fluidsynth' 'timidity++')
source=(
  'fix_glade_path.patch'
  "https://github.com/felixonmars/pmgmusic/archive/v${pkgver}.tar.gz"
)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -Np1 -i ../fix_glade_path.patch
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 pmg "$pkgdir/usr/bin/pmg"
  install -Dm755 dump_vos "$pkgdir/usr/bin/dump_vos"
  install -Dm644 pmg.glade "$pkgdir/usr/share/pmgmusic/pmg.glade"
}
md5sums=('68f454557d83a0c1e9d9d0083011bbfb'
         '4661f5d0ed0715587efd3c92993499f7')
