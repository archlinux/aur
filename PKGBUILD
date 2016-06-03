# Maintainer: Marco Kundt <mrckndt@gmail.com>

pkgname=gtk3-nocsd-git
pkgver=r54.a590b96
pkgrel=2
pkgdesc='A hack to disable gtk+ 3 client side decoration'
arch=('i686' 'x86_64')
url='https://github.com/PCMan/gtk3-nocsd'
license=('GPL')
depends=('gtk3')
makedepends=('git' 'pkgconfig' 'gobject-introspection' 'gtk3')
conflicts=('gtk3-nocsd')
source=(git+https://github.com/PCMan/gtk3-nocsd
        30-gtk3-nocsd.sh)

sha256sums=('SKIP'
            'a165915e91d067f0843b3d397ae7633caa09dfb9f278096ffc2a5075c1eca523')

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
  install -D -m 0644 libgtk3-nocsd.so.0 "${pkgdir}"/usr/lib/libgtk3-nocsd.so.0
  install -D -m 0644 gtk3-nocsd.1 "${pkgdir}"/usr/share/man/man1/gtk3-nocsd.1
  install -D -m 0644 gtk3-nocsd.bash-completion "${pkgdir}"/usr/share/bash-completion/completions/gtk3-nocsd

  cd "$srcdir"
  install -D -m 0755 30-gtk3-nocsd.sh "${pkgdir}"/etc/X11/xinit/xinitrc.d/30-gtk3-nocsd.sh
}
