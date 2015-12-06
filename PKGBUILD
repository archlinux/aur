# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Your Name <youremail@domain.com>
pkgname=hashcat-utils-git
pkgver=1.2.r1.g9135127
pkgrel=1
pkgdesc="Hashcat-utils are a set of small utilities that are useful in advanced password cracking."
arch=('i686' 'x86_64')
url="https://github.com/hashcat/hashcat-utils"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'make')
provides=('hashcat-utils')
conflicts=()
replaces=()
backup=()
options=()
install=
source=(git://github.com/hashcat/hashcat-utils.git)
noextract=()
md5sums=('SKIP')

_gitroot='https://github.com/hashcat/hashcat-utils.git'
_gitname='hashcat-utils'

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname/src"

  make linux
}

package() {
  cd "$srcdir/$_gitname/src"

  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p "$pkgdir/bin/"

  cp ./*.bin "$pkgdir/bin/"

  cd  "$pkgdir/bin/"
  for i in $(ls ".")
  do
    chmod +x $i
    mv $i ${i%.*}
  done

}

# vim:set ts=2 sw=2 et:
