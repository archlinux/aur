# Maintainer: Thomas Girod <tgirod@altu.fr>
# Contributor: Daniel Appelt <daniel.appelt@gmail.com>

pkgname=open-stage-control
pkgver=1.5.3
pkgrel=2
pkgdesc='A libre desktop OSC bi-directional control surface application'
arch=('x86_64' 'i686' 'armv7l')
url='http://osc.ammd.net/'
license=('GPL3')
depends=('npm' 'electron')
makedepends=('rsync')
optdepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/jean-emmanuel/${pkgname}/archive/v${pkgver}.tar.gz")
_platform='linux'
case "$CARCH" in
    i686)
        _arch=ia32
        ;;
    x86_64)
        _arch=x64
        ;;
    armv7h)
        _arch=armv7l
        ;;
esac

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

  rsync -a dist/${pkgname}-${_platform}-${_arch}/ "${pkgdir}/usr/share/${pkgname}"
  ln -s /usr/share/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}

md5sums=('f6b39dd60925c5e712efd9b1b035dce8')
