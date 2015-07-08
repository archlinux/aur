# Maintainer: Dave Simons <pkgs@simonsd.org> 

pkgname=dynamic-colors-git
pkgver=0
pkgrel=1
pkgdesc="Change terminal colors on the fly"
arch=('i686' 'x86_64')
url="https://github.com/sos4nt/dynamic-colors"
makedepends=('git')
provides=('dynamic-colors')
source=('git://github.com/sos4nt/dynamic-colors.git')
md5sums=('SKIP')
license=('MIT')

pkgver() {
  cd "$srcdir/dynamic-colors"
  git rev-parse --short HEAD
}

build() {
  cd "$srcdir/dynamic-colors"
  sed -i 's_\${HOME}/.dynamic-colors_/usr/share/dynamic-colors_' bin/dynamic-colors
  sed -i 's@\${DYNAMIC_COLORS_ROOT}/\(colorscheme\"\)@${HOME}/.\1@g' bin/dynamic-colors
  rm .git* -rf
}

package() {
  cd "$srcdir/dynamic-colors"
  install -dm755 "$pkgdir/usr/bin" "$pkgdir/usr/share/dynamic-colors/colorschemes" "$pkgdir/run/dynamic-colors"
  install -m755 "bin/dynamic-colors" "$pkgdir/usr/bin/dynamic-colors"
  cp -r "colorschemes/" "$pkgdir/usr/share/dynamic-colors/"
  touch "$pkgdir/run/dynamic-colors/colorscheme"
  chmod 777 "$pkgdir/run/dynamic-colors/colorscheme"
}
