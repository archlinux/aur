# COntributor: maz-1

pkgname=easyrpg-rtp
pkgver=91.993d88c
pkgrel=1
pkgdesc="RPG Maker 2000/2003 material replacement"
arch=('any')
url="https://github.com/EasyRPG/RTP"
license=('GPL3')
makedepends=(git)
optdepends=(easyrpg-player
"oxipng: optimize images at build time")
source=(${pkgname}::"git+${url}.git") # replace with stable frozen commit
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  echo $(git rev-list --count HEAD).$(git describe --always)
}

build() {
  cd $pkgname
  oxipng -o 6 --strip safe -r . || : # -Z is slow
  rm -r .git *.md Makefile .gitattributes .gitignore COPYING
}

package () {
  install -d "${pkgdir}"/usr/share/easyrpg
  cp -r --reflink=auto ${pkgname} "${pkgdir}"/usr/share/easyrpg/rtp
}
