# Maintainer: Ben 'silentnoodle' Lönnqvist <lonnqvistben at gmail dot com>
pkgname=med-memory-editor
pkgver=3.7.1
pkgrel=1
pkgdesc='Linux alternative game memory editor'
arch=('i686' 'x86_64')
url='https://github.com/allencch/med'
license=('BSD')
depends=('jsoncpp' 'qt5-base' 'polkit')
makedepends=('cmake')
source=("https://github.com/allencch/med/archive/${pkgver}.tar.gz"
        org.archlinux.pkexec.med.policy
        med.desktop)
sha256sums=('224c9e42e3aab005aac4a133a32e3eebe939551748b27ecd2434a60a1f5af7c5'
            'f09800e12134df7e65c7336cf9851be4013cb8795778941dbf97d5868894e76e'
            'dbaa52dd26fff0c1665773de587e62ef755391e1183cc001b6fe1a2658939448')

build() {
    cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S "med-${pkgver}"
}

package(){
    make -C build DESTDIR="$pkgdir/" install
    sed -i 's/qt/ui/g' $pkgdir/usr/bin/med
    install -Dm644 "med-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/med/LICENSE"
    install -Dm644 org.archlinux.pkexec.med.policy "$pkgdir/usr/share/polkit-1/actions/org.archlinux.pkexec.med.policy"
    install -Dm644 med.desktop "$pkgdir/usr/share/applications/med.desktop"
}
