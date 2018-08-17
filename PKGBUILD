# Maintainer: Roman Mikhayloff <rimf@inbox.ru>

pkgname=expertguide-git
_gitname=eg
pkgver=v1.02.r0.g3c7e6fd
pkgrel=1
pkgdesc="Expert Guide, a Norton Guide reader for GNU/Linux"
arch=('i686' 'x86_64')
url="http://www.davep.org/norton-guides/"
license=('GPL')
depends=('slang')
makedepends=('git')
provides=('expertguide')
conflicts=('expertguide' 'eg')
source=('git+https://github.com/davep/eg.git'
        'build.patch')
sha1sums=('SKIP'
          '872b7364e7149f788d1ab814ac907dc302cae335')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_gitname}"
  patch -Np1 -i "${srcdir}/build.patch"
}

build() {
  cd "${srcdir}/${_gitname}"
  make
}

package() {
  cd "${srcdir}/${_gitname}"

  #make DESTDIR="${pkgdir}" install
  install -D eg -t "${pkgdir}/usr/bin"
  install -Dm644 eg.1 -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 default-guide/eg.ng -t "${pkgdir}/usr/share/norton-guides"
}

