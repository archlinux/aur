# Contributor: Adria Arrufat <swiftscythe@gmail.com>
pkgname=joschy-git
pkgver=20100816
pkgrel=1
pkgdesc="Video upload/search/etc library"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/RecordItNow?content=114610"
license=('GPL')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4' 'git')
provides=('joschy')
source=()
md5sums=()

_gitroot='git://gitorious.org/joschy/joschy.git'
_gitname='joschy'

build(){

  cd $srcdir

  if [[ -d $_gitname ]]; then
        (cd $_gitname && git pull origin)
  else
        git clone $_gitroot $_gitname
  fi

  cd $_gitname

        rm -rf build
        mkdir build && cd build
        cmake -DCMAKE_INSTALL_PREFIX=/usr .. || return 1
        make || return 1
        make DESTDIR="$pkgdir/" install || return 1
}
