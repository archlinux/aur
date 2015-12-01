# Maintainer: linuxSEAT <--put_my_name_here--@gmail.com> 
#
pkgname=sortphotos
pkgver=65.05eca3c
pkgrel=4
pkgdesc="A Python script that organizes photos and videos into folders"
arch=('any')
url="https://github.com/andrewning/sortphotos"
license=('MIT')
groups=()
depends=('python2' 'python2-setuptools')
makedepends=('git')
source=(${pkgname}::'git+https://github.com/andrewning/sortphotos.git'
        ${pkgname}.patch)
md5sums=('SKIP' 'a870e5ccc70a791d308a1f8fab110ab0')

pkgver() {
  cd "$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${srcdir}"/${pkgname}
  patch -p1 -i ../${pkgname}.patch || return 1
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
