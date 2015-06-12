# Maintainer: Lara Maia <lara@craft.net.br>
DLAGENTS=('http::/usr/bin/curl -e "http://www.geeks3d.com/20131028/gputest-0-6-0-opengl-benchmark-for-windows-mac-os-x-and-linux-downloads/" -fLC - --retry 3 --retry-delay 3 -o %o %u')

pkgname=madshaders
pkgdesc="cross-platform GPU stress test and OpenGL benchmark."
url='http://www.geeks3d.com/madshaders/'
license=("custom");
arch=('any');
pkgver=0.3.0
pkgrel=3

source=('http://www.ozone3d.net/glslhacker/demos/MadShaders_030_linux.zip'
        'http://www.ozone3d.net/dl/201404/mad-shaders-frontend-linux.tar.bz2'
        'fix_paths.patch')
md5sums=('b5478d7416b0c1c50bb49d21ffdc69f1'
         'dfb4b7f03b9e3e8deda0bedddda408bf'
         '59784bfabfedc113561a55d2f1a6bf53')

depends=('glslhacker')
makedepends=('unzip')
optdepends=('tk: for madshaders-tk frontend'
            'python2: for madshaders-tk frontend'
            'python-gobject: for madshaders-gtk frontend')

prepare() {
    patch -Np0 -i fix_paths.patch
}

package() {
    cd "MadShaders_030_linux"

    install -Dm644 README.txt "$pkgdir/usr/share/licenses/$pkgname/README.txt"

    install -dm755 "$pkgdir/usr/share/$pkgname/"
    cp -rf demos/ "$pkgdir/usr/share/$pkgname/"

    install -Dm755 madshaders.py "$pkgdir/usr/bin/madshaders-tk"

    cd "$srcdir/mad-shaders-frontend"

    install -Dm644 README_mad-shaders-frontend "$pkgdir/usr/share/licenses/$pkgname/README_gtk-frontend"
    install -Dm644 LICENSE_mad-shaders-frontend "$pkgdir/usr/share/licenses/$pkgname/LICENSE_gtk-frontend"
    
    install -Dm644 mad-shaders-frontend.glade "$pkgdir/usr/share/$pkgname/"
    install -Dm644 mad-shaders-frontend-icon.png "$pkgdir/usr/share/$pkgname/"
    install -Dm755 mad-shaders-frontend.py "$pkgdir/usr/bin/madshaders-gtk"
}
