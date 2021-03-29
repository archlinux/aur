# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=bcnc
pkgver=0.9.14.304
pkgrel=1
pkgdesc="GRBL CNC command sender, autoleveler and g-code editor"
arch=('any')
url="https://github.com/vlachoudis/bCNC"
license=(GPL2)
depends=(python python-pyserial python-pillow tk)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vlachoudis/bCNC/archive/${pkgver}.tar.gz"
        "bcnc.desktop")
sha256sums=('151b9bdac1fbbb2300f1e133d70e7c8fe34702a8731e9caefc1583c9365faf60'
            'd5f3f49fabe26d5e1de285d1c61be8d6b48f6498effdf1fc80b396d12fa9a137')

build() {
  cd "bCNC-${pkgver}"
  python setup.py build
}

package() {
  cd "bCNC-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -D -m644 "${srcdir}/bcnc.desktop" "${pkgdir}/usr/share/applications/bcnc.desktop"
  install -D -m644 "bCNC/bCNC.png" "${pkgdir}/usr/share/pixmaps/bcnc.png"
  
  mkdir -p "${pkgdir}/usr/bin"
  echo "#!/usr/bin/env bash" > "${pkgdir}/usr/bin/bcnc"
  echo "python -m bCNC" > "${pkgdir}/usr/bin/bcnc"
  chmod +x "${pkgdir}/usr/bin/bcnc"
}
