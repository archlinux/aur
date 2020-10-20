# Maintainer: Thomas Girod <tgirod@altu.fr>
# Contributor: Daniel Appelt <daniel.appelt@gmail.com>

pkgname=open-stage-control
pkgver=1.5.3
pkgrel=1
pkgdesc='A libre desktop OSC bi-directional control surface application'
arch=('x86_64')
url='http://osc.ammd.net/'
license=('GPL3')
depends=('npm')
makedepends=('rsync')
optdepends=('python-pyrtmidi: send and receive midi messages')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/jean-emmanuel/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  npm install
  npm run build
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  npm run package

  install -d ${pkgdir}/usr/share/${pkgname}
  install -d ${pkgdir}/usr/bin

  rsync -a dist/${pkgname}-linux-x64/ "${pkgdir}/usr/share/${pkgname}"
  ln -s ${pkgdir}/usr/share/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

md5sums=('f6b39dd60925c5e712efd9b1b035dce8')
