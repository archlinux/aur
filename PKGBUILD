# Maintainer: Mansour Behabadi <mansour@oxplot.com>

pkgname=gcsms-git
_gitname=gcsms
pkgver=33.08e1bb3
pkgrel=1
pkgdesc='Send SMS for free through shell using Google Calendar API'
arch=('any')
url='https://github.com/oxplot/gcsms'
license=('GPLv3')
depends=('python')
makedepends=('git')
conflicts=('gcsms')
provides=('gcsms')
source=('git+https://github.com/oxplot/gcsms.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd $_gitname
  python setup.py build
}

package() {
  cd $_gitname
  python setup.py install --root="${pkgdir}" --optimize=1

  # Install license and docs
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -D -m644 sample.config "${pkgdir}/usr/share/doc/${pkgname}/sample.config"
}
