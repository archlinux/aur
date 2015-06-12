# Maintainer: Lara Maia <lara@craft.net.br>
DLAGENTS=('http::/usr/bin/curl -e "http://www.geeks3d.com/20131028/gputest-0-6-0-opengl-benchmark-for-windows-mac-os-x-and-linux-downloads/" -fLC - --retry 3 --retry-delay 3 -o %o %u')

pkgname=gl-z
pkgdesc="cross-platform GL info tool"
url='http://www.geeks3d.com/20141121/gl-z-opengl-information-utility-extensions-viewer-for-windows-linux-and-os-x/'
license=("custom");
arch=('any');
pkgver=0.1.0
pkgrel=2

source=('http://www.ozone3d.net/dl/201411/GL-Z-010-linux64.zip')
md5sums=('1993c3ca62f723609c1b43e69d4513eb')

depends=('glslhacker')
makedepends=('unzip')

package() {
    cd "GL-Z-linux64"

    install -Dm644 README.txt "$pkgdir/usr/share/licenses/$pkgname/README.txt"

    install -dm755 "$pkgdir/usr/share/$pkgname/"
    install -Dm644 glz_src/glz.xml "$pkgdir/usr/share/$pkgname/"
    cp -rf glz_src/data "$pkgdir/usr/share/$pkgname/"

    install -dm755 "$pkgdir/usr/bin/"
    echo -e "#!/bin/bash\nglslhacker /demofile=\\\"/usr/share/$pkgname/glz.xml\\\"" > "$pkgdir/usr/bin/gl-z"
    chmod 755 "$pkgdir/usr/bin/gl-z"
}
