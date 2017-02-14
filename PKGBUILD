# Maintainer: Marin M <https://github.com/marin-m>

pkgname=pbtk-git
pkgver=1
pkgrel=1
pkgdesc='A toolset for reverse engineering and fuzzing Protobuf-based apps'
url='https://github.com/marin-m/pbtk'
arch=('any')
license=('GPL3')
depends=('python-pyqt5' 'python-protobuf' 'python-requests' 'python-websocket-client' 'qt5-webengine' 'chromium' 'jad' 'dex2jar')
makedepends=('git')
source=('git+https://github.com/marin-m/pbtk')
sha512sums=('SKIP')

prepare() {
  cat > pbtk.sh << EOF
#!/bin/bash
cd /usr/share/pbtk/
exec ./gui.py "\$@"
EOF
}

package() {
  cd pbtk
  install -Dm 755 ../pbtk.sh "${pkgdir}/usr/bin/pbtk"
  install -Dm 755 gui.py extractors -t "${pkgdir}/usr/share/pbtk"
  cp -r utils views "${pkgdir}/usr/share/pbtk"
  # install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
