pkgname='plasma-wallpaper-makethatpape-git'
pkgver=r34.ccd2d6b
pkgrel=1
pkgdesc='Plasma Wallpaper makeThatPape'
arch=('any')
url='https://cgit.kde.org/scratch/mpyne/plasma_wallpaper_asciiquarium.git/about/'
license=('GPL')
depends=('plasma-workspace' 'python' 'python-pillow')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'tar')
provides=("${pkgname}")
source=("git+https://gitlab.com/reightb/makethatpape")
md5sums=('SKIP')

pkgver() {
  cd "makethatpape"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/makethatpape"
  ./package.sh
}

package() {
  mkdir -p $pkgdir/usr/share/plasma/wallpapers
  cd $pkgdir/usr/share/plasma/wallpapers
  tar -xvf $srcdir/makethatpape/makeThatPape*.tar.gz
  mv kde-plugin org.kde.plasma.makethatpape
}
