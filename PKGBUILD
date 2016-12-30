# Maintainer: awe00 < awe00 AT hotmail DOT fr>

pkgname=plotnetcfg-git
pkgver=v0.4.1.r54.g2bbca33
pkgrel=1
pkgdesc="A tool that scans networking configuration on the machine and plots a diagram of the configuration hierarchy"
arch=('i686' 'x86_64')
url="https://github.com/jbenc/plotnetcfg"
license=('GPL2')
depends=('jansson')
makedepends=('git')
provides=('plotnetcfg')
source=("git+https://github.com/jbenc/plotnetcfg")
md5sums=('SKIP')
_gitrepo=plotnetcfg

pkgver() {
  cd "$_gitrepo"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitrepo"
  make
}

package() {
  cd "$_gitrepo"

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/man/man5/" "${pkgdir}/usr/share/man/man8/"
  install -t "${pkgdir}/usr/bin" plotnetcfg
  install -m 644 -t "${pkgdir}/usr/share/man/man8/" plotnetcfg.8
  install -m 644 -t "${pkgdir}/usr/share/man/man5/" plotnetcfg-json.5
}
