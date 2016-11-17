# $Id$
# Maintainer: Kirigaya Kazushin <kirigaya@mkacg.com>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: Xu Fasheng <fasheng.xu[AT]gmail.com>
 
pkgname=deepin-terminal-git
pkgver=2.0.16
pkgrel=3
pkgdesc='Default terminal emulation application for Deepin'
arch=('i686' 'x86_64')
url="https://github.com/manateelazycat/deepin-terminal"
license=('GPL3')
depends=('vte3' 'libsecret' 'libgee' 'libwnck3' 'expect' 'deepin-shortcut-viewer' 
'deepin-menu')
makedepends=('git' 'vala')
groups=('deepin-extra')
options=(!emptydirs)
source=("git+https://github.com/manateelazycat/deepin-terminal.git")
sha256sums=('SKIP')

prepare() {
  sed -i 's|return __FILE__;|return "/usr/share/deepin-terminal/project_path.c";|' deepin-terminal/project_path.c
}

build() {
  cd "$srcdir"
  mkdir build; cd build; cmake ../deepin-terminal;make PREFIX=/usr
}
 
package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
