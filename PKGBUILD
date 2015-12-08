# Maintainer: linuxSEAT <--put_my_name_here--@gmail.com> 
#
pkgname=sortphotos
pkgver=65.05eca3c
pkgrel=5
pkgdesc="A Python script that organizes photos and videos into folders"
arch=('any')
url="https://github.com/andrewning/sortphotos"
license=('MIT')
groups=()
depends=('python2' 'python2-setuptools')
makedepends=('git')
source=(${pkgname}::'git+https://github.com/andrewning/sortphotos.git'
        ${pkgname}.patch)
md5sums=('SKIP' '93e2f0515896e68a0401db8b8ee718e5')

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
