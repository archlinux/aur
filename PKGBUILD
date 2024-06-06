# Maintainer: twa022 <twa022 at gmail dot com>

pkgname='nemo-media-columns'
pkgver=6.0.1
pkgrel=3
pkgdesc="Media properties columns in Nemo"
arch=('any')
license=('GPL2')
url="https://github.com/linuxmint/nemo-extensions"
depends=('nemo-python' 'python-mutagen' 'libgexiv2' 'python-pymediainfo'
         'python-pillow' 'python-pypdf' 'python-stopit')
options=('!emptydirs')
makedepends=('python-distutils-extra')
source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz"
        'pypdf.patch::https://github.com/linuxmint/nemo-extensions/commit/68b27d5ed9738008fc7e899fa4b0c7222ea9ddfb.patch')
sha256sums=('d7d0e78df10dc4240623a1daa7cd457cc4c31969c8a6ff1cdeca4b3ce66b5cdb'
            '40063e0b02469fef7aff2da3e4a9f7f5bc372ed86ea0219a4f975fbfa94343fe')

prepare() {
  cd nemo-extensions-${pkgver}
  patch -Np1 -i ../pypdf.patch
}

package() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"

  python ./setup.py install --prefix=/usr --root="${pkgdir}" \
                            --no-compile -O0
}
