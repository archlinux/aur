# Maintainer: Shimi Chen <shimi.chen@gmail.com>

pkgname=chemical-mime-data-git
pkgver=157.4fd66e3
pkgrel=3
pkgdesc="Chemical MIME type support Linux desktops"
arch=('any')
url="https://github.com/dleidert/chemical-mime"
license=('LGPL')
provides=('chemical-mime-data')
depends=('gnome-mime-data' 'shared-mime-info')
makedepends=('libxslt')
source=('git://github.com/dleidert/chemical-mime.git')
conflicts=('chemical-mime-data-debian' 'chemical-mime-data')
sha256sums=('SKIP')
_gitname="chemical-mime"
# install=chemical-mime-data.install

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
build() {
        cd "$srcdir/$_gitname"
        ./autogen.sh
        ./configure --prefix=/usr --disable-nls --without-kde-mime --disable-update-database --without-kde-magic
}

package() {
        cd "$srcdir/$_gitname"
        make DESTDIR="$pkgdir/" install
}
