# Maintainer: Emily Maré (emileet) <emileet@plsnobully.me>

pkgname=obs-ndi
pkgver=4.8.0
_obsver=25.0.4
pkgrel=1
pkgdesc="Network A/V in OBS Studio with NewTek's NDI technology"
arch=('x86_64')
license=('GPL2')
url="https://github.com/Palakis/${pkgname}"
provides=('obs-ndi')
conflicts=('obs-ndi-bin' 'obs-ndi-git')
depends=('avahi' 'ndi-sdk' 'obs-studio')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Palakis/obs-ndi/archive/${pkgver}.tar.gz"
        "obs-studio-${_obsver}.tar.gz::https://github.com/obsproject/obs-studio/archive/${_obsver}.tar.gz")
sha256sums=('21234dd0c04f0dd7dcc9d4a1503e8e0cdacb39f5bbb40f00e8b6b4535f5e7e4f'
            'c8db224d2ee4d9b91448be9e47414398e570eebe4a59ff9fd19b066789d1ccdb')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}

    cmake -B build -DLIBOBS_INCLUDE_DIR=${srcdir}/obs-studio-${_obsver}/libobs -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}/build
    make DESTDIR=${pkgdir} install

    install -Dm644 ../LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
