# Maintainer: Tristan Webb <tristanjwebb@gmail.com>
pkgname=wemux-git
pkgver=3.2.0.r2.g483f10a
pkgrel=3
pkgdesc="Multi-user Tmux made easy"
url="https://github.com/zolrath/wemux"
arch=('any')
license=('MIT')
depends=('tmux' 'lsof' 'openssh')
optdepends=
makedepends=('git')
backup=('etc/wemux/wemux.conf')
install='wemux-git.install'
md5sums=('SKIP') 
source=(git://github.com/zolrath/wemux.git)

pkgver() {
  cd wemux
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd wemux
}

package(){
  cd wemux
  install -dm755 $pkgdir/usr/share 

  sed -i -e "s/usr\/local\/etc/etc\/wemux/g" ./wemux

  install -dm755 $pkgdir/usr/share/wemux/

  #install manpage
  install -Dm644  ./man/wemux.1 $pkgdir/usr/share/man/man1/wemux.1
  
  
  #install binary and readme
  install -Dm755  ./wemux $pkgdir/usr/bin/wemux
  install -Dm644  ./README.md $pkgdir/usr/share/wemux/README.md

  #install conf
  install -Dm644 ./wemux.conf.example $pkgdir/etc/wemux/wemux.conf 

  #install licence
  install -Dm644 ./MIT-LICENSE $pkgdir/usr/share/licenses/wemux/LICENSE

}

# vim:set ts=2 sw=2 et:
