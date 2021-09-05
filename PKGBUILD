# Maintainer: Suraj Patel <real4suraj@gmail.com>
pkgname=suraj-snappy-git
pkgver=1.0.r2.52815b4
pkgrel=1
pkgdesc="A all in one command line utility for screenshots and screenrecords"
arch=(x86_64)
url="https://github.com/real4suraj/snappy.git"
license=('GPL')
depends=('git' 'ffmpeg' 'scrot')
provides=(snappy_screenutility)
source=("git+$url")
md5sums=('SKIP')

check_installed() {
  [ "$(pacman -Qi $1 &> /dev/null)" ] && return 0
  [ -f "/usr/bin/$1" ] && return 0
  [ -f "/usr/local/bin/$1" ] && return 0
  return 1
}

pkgver() {
  cd snappy 
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  check_installed "dmenu" && echo "Found dmenu in path" || sudo pacman -S dmenu 
  cd snappy 
  gcc -lX11 xrectsel.c -o xrectsel
}

package() {
  cd snappy 
  install -Dm755 xrectsel "${pkgdir}"/usr/bin/xrectsel
  install -Dm755 snappy_aur "${pkgdir}"/usr/local/bin/snappy_screenutility
}
