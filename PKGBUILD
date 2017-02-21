# Maintainer: Marin M <https://github.com/marin-m>

pkgname=pbtk-git
pkgver=1.0.4
pkgrel=2
pkgdesc='A toolset for reverse engineering and fuzzing Protobuf-based apps'
url='https://github.com/marin-m/pbtk'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('python-pyqt5' 'python-protobuf' 'python-requests' 'python-websocket-client' 'qt5-webengine' 'chromium' 'java-runtime')
makedepends=('git' 'findutils')
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
  install -Dm 755 gui.py -t "${pkgdir}/usr/share/pbtk"
  
  find . -regex '.*\(\.bat\|\.exe\|_osx\)' -type f -delete
  chmod -R 755 extractors utils/external
  
  cp -r extractors utils views "${pkgdir}/usr/share/pbtk"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/pbtk"
}
