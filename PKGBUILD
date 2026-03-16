# Maintainer: Marin M <https://github.com/marin-m>

pkgname=pbtk-git
pkgver=1.0.7
pkgrel=3
pkgdesc='A toolset for reverse engineering and fuzzing Protobuf-based apps'
url='https://github.com/marin-m/pbtk'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('pyside6' 'python-protobuf' 'python-requests' 'python-websocket-client' 'qt6-webengine' 'chromium' 'jre8-openjdk')
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
  chmod -R 755 src/extractors src/utils/external
  
  cp -r src "${pkgdir}/usr/share/pbtk"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/pbtk"
}
