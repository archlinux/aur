# Maintainer: ebiadsu <ebiadsu@posteo.de>
_pipname=ovh
pkgname=python-${_pipname}
pkgver=0.4.7
pkgrel=1
pkgdesc="Official OVH.com API wrapper"
arch=("x86_64")
url="https://api.ovh.com"
license=('custom')
makedepends=("python" "python-pip")

prepare() {
  # manual download to get LICENSE file
  pip download ${_pipname}
  cd $srcdir
  tar -xvzf ${_pipname}-$pkgver.tar.gz ${_pipname}-$pkgver/LICENSE
}

build() {
  pip install --no-deps --target="${_pipname}" ${_pipname}
}

package() {
  mkdir -p $pkgdir/usr/lib/python3.6/site-packages/
  cp -r $srcdir/${_pipname}/* $pkgdir/usr/lib/python3.6/site-packages/

  # install license file
  install -Dm644  ${_pipname}-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
