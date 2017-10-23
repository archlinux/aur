# Maintainer: Kazutoshi Noguchi <noguchi.kazutosi+lGlcOenS [at] gmail [dot] com>
# Contributor: Marco Kundt <mrckndt [at] gmail [dot] com>

pkgname=gtk3-nocsd-git
pkgver=r55.82ff5a0
pkgrel=3
pkgdesc='A hack to disable gtk+ 3 client side decoration'
arch=('i686' 'x86_64')
url='https://github.com/PCMan/gtk3-nocsd'
license=('LGPL')
depends=('gtk3')
makedepends=('git' 'gobject-introspection')
source=(git+https://github.com/PCMan/gtk3-nocsd
        30-gtk3-nocsd.sh)

sha256sums=('SKIP'
            'da498916ffc29b1d13de43271a46c0c2582c4cdad8d1ddd15217b868f83d86e8')

_gitname='gtk3-nocsd'

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  install -D -m 0755 gtk3-nocsd "${pkgdir}"/usr/bin/gtk3-nocsd
  install -D -m 0644 gtk3-nocsd.1 "${pkgdir}"/usr/share/man/man1/gtk3-nocsd.1
  install -D -m 0644 gtk3-nocsd.bash-completion "${pkgdir}"/usr/share/bash-completion/completions/gtk3-nocsd

  install -D -m 0644 libgtk3-nocsd.so.0 "${pkgdir}"/usr/lib/libgtk3-nocsd.so.0

  cd "$srcdir"
  install -D -m 0755 30-gtk3-nocsd.sh "${pkgdir}"/etc/X11/xinit/xinitrc.d/30-gtk3-nocsd.sh
}
