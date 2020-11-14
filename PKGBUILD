# Maintainer: Ben 'silentnoodle' Lönnqvist <lonnqvistben at gmail dot com>
pkgname=med-memory-editor
pkgver=3.6.1
pkgrel=1
pkgdesc='Linux alternative game memory editor'
arch=('i686' 'x86_64')
url='https://github.com/allencch/med'
license=('BSD')
depends=('jsoncpp' 'qt5-base' 'polkit')
makedepends=('cmake')
source=(
    "https://github.com/allencch/med/archive/${pkgver}.tar.gz"
    org.archlinux.pkexec.med.policy
    med.desktop
)
md5sums=('d71767293163e4525f95c9cefcf28b83'
         '6f6f9b3d4f242bf06f9d5e4b150fc96a'
         'b9ab16446697880e1878aafc77e6b463')

build() {
    cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S "med-${pkgver}"
}

package(){
    make -C build DESTDIR="$pkgdir/" install
    sed -i '2 i export LC_ALL=en_US.UTF-8' $pkgdir/usr/bin/med
    sed -i 's/qt/ui/g' $pkgdir/usr/bin/med
    install -Dm644 "med-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/med/LICENSE"
    install -Dm644 org.archlinux.pkexec.med.policy "$pkgdir/usr/share/polkit-1/actions/org.archlinux.pkexec.med.policy"
    install -Dm644 med.desktop "$pkgdir/usr/share/applications/med.desktop"
}
