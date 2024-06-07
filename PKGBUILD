# Maintainer:     Ryan James <Ryan_James@linuxmail.org>	
# old-Maintainer: Michael DeGuzis <mdeguzis@gmail.com>

pkgname=qzdl
pkgver=3.3.0.0
pkgrel=1
pkgdesc="A ZDoom launcher using Qt"
arch=('x86_64' 'i686')
url="http://zdl.vectec.net"
license=('GPL')
depends=('qt5-base')
conflicts=('qzdl-git')
makedepends=('git' 'gdb' 'make')
source=("git+https://github.com/qbasicer/qzdl.git" "qzdl.desktop" "zdl.png")
md5sums=('SKIP'
         'b00191baadc095c2452753106f65860d'
         'f54ace087194fa0e8f1e295551843b86')
_gitname="qzdl"
_branch=master

build()
{
  cd "${srcdir}/${_gitname}"
  git checkout ${_branch}
  rm -rf "${srcdir}/${_gitname}-build"
  mkdir "${srcdir}/${_gitname}-build"
  ls -A | grep -v .git | xargs -d '\n' cp -r -t ../${_gitname}-build
  cd "${srcdir}/${_gitname}-build"
  cmake ../qzdl-build 
  make
}

package()
{
  cd "${srcdir}/${_gitname}-build"
  mkdir -p "${pkgdir}/usr/bin"
  mv "zdl" "${pkgdir}/usr/bin/qzdl"

  install -Dm644 "$srcdir"/qzdl.desktop "$pkgdir"/usr/share/applications/"$pkgname".desktop
  install -Dm644 "$srcdir"/zdl.png      "$pkgdir"/usr/share/pixmaps/"$pkgname".png
}

