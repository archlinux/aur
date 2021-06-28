# Maintainer: Platon Ryzhikov <ihummer63@yandex.ru>

pkgname=kubernetes-website-git
pkgdesc="The Kubernetes documentation"
pkgver=969a3db92.r1369.g6ebdc7cd11
pkgrel=1
arch=('any')
makedepends=('git' 'hugo' 'npm')
provides=('kubernetes-website' 'kubernetes-doc')
conflicts=('kubernetes-website' 'kubernetes-doc')
url='https://github.com/kubernetes/website'
license=('custom')
source=('git+https://github.com/kubernetes/website#branch=main')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/website"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/website"
  npm ci
  make module-init
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
