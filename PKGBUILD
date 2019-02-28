# Maintainer: Paul Dann <pdgiddie+archlinux@gmail.com>
pkgname=fontconfig-emoji-git
pkgver=r9.ced1758
pkgrel=1
epoch=
pkgdesc="Fontconfig configuration for emojis"
arch=('any')
url="https://github.com/stove-panini/fontconfig-emoji"
license=()
groups=()
depends=('ttf-bitstream-vera')
makedepends=('git')
checkdepends=()
optdepends=('noto-fonts-emoji')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/stove-panini/fontconfig-emoji")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  mkdir -p $pkgdir/etc/fonts/conf.avail
  mkdir -p $pkgdir/etc/fonts/conf.d
  cp *.conf $pkgdir/etc/fonts/conf.avail/
  for file in *.conf; do
    ln -s ../conf.avail/"$(basename $file)" $pkgdir/etc/fonts/conf.d
  done
}
