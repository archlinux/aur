# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kde-gtk-config-git
pkgver=5.19.90.r10.g0e51688
pkgrel=1
pkgdesc='GTK2 and GTK3 Configurator for KDE (git version)'
arch=('x86_64')
url='https://www.kde.org/workspaces/plasmadesktop/'
license=('LGPL')
depends=('qt5-svg'  'kdecoration'  'kconfigwidgets'  'kdbusaddons')
optdepends=('gtk2: GTK2 apps support'
            'gtk3: GTK3 apps support'
            'xsettingsd: apply settings to GTK applications on the fly')
makedepends=('git' 'extra-cmake-modules' 'gtk2' 'gtk3' 'sassc')
conflicts=('kde-gtk-config')
provides=('kde-gtk-config')
source=('git+https://anongit.kde.org/kde-gtk-config.git')
sha256sums=('SKIP')

pkgver() {
    git -C kde-gtk-config describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S kde-gtk-config \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DLIBEXEC_INSTALL_DIR='lib' \
        -DBUILD_TESTING='ON' \
        -Wno-dev
    make -C build
}

check() {
    make -C build test
}

package() {
    make -C build DESTDIR="$pkgdir" install
}
