# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

pkgname=kubernetes-website-git
pkgdesc="The Kubernetes documentation"
pkgver=snapshot.initial.v1.17.r464.gea9977e3db
pkgrel=1
arch=('any')
makedepends=('git' 'hugo')
provides=('kubernetes-website' 'kubernetes-doc')
conflicts=('kubernetes-website' 'kubernetes-doc')
url='https://github.com/kubernetes/website'
license=('custom')
source=('git+https://github.com/kubernetes/website')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/website"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/website"
  make all
}

package() {
  cd "$srcdir/website"
  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/share"
  mkdir "$pkgdir/usr/share/doc"
  mkdir "$pkgdir/usr/share/doc/kubernetes"
  cp -r ./public/* "$pkgdir/usr/share/doc/kubernetes"
}
