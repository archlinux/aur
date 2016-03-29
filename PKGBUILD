# Maintainer: Robert Vally <robert@vally.co.nz>
pkgname=i3lock-shiver
pkgver=2.5
pkgrel=20140424 
pkgdesc='A fork of i3lock which introduces a blur option that does not rely on OpenGL'
arch=('i686' 'x86_64')
url='http://i3wm.org'
license=('MIT')
groups=('i3-vcs')
provides=('i3lock')
conflicts=('i3lock')
depends=('xcb-util-image' 'libev' 'cairo' 'libxkbcommon' 'libxkbfile')
makedepends=('git')
source=('git+https://github.com/shiver/i3lock.git')
sha1sums=('SKIP')

_gitname='i3lock'

#pkgver() {
#  cd "$srcdir/$_gitname"
#  git describe --tags | sed 's/-/./g'
#}

build() {
  cd "$_gitname"
  make
  gzip i3lock.1
}


package() {  
  cd "$_gitname"
  make DESTDIR="${pkgdir}" install
  
  install -Dm644 i3lock.1.gz ${pkgdir}/usr/share/man/man1/i3lock.1.gz
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  make clean
}

# vim:set ts=2 sw=2 et:
