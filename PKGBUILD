# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Francois Menning <f.menning@pm.me>
# Contributor: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=powerdevil-light
pkgver=5.26.5
pkgrel=1
pkgdesc='Manages the power consumption settings of a Plasma Shell. Light version without NetworkManager and Bluez support/dependencies.'
arch=('x86_64')
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=('plasma-workspace')
makedepends=('extra-cmake-modules' 'kdoctools')

optdepends=(
    'kinfocenter: for the Energy Information KCM'
    'power-profiles-daemon: power profiles support'
)

_name="${pkgname%-*}"
conflicts=("${_name}")
provides=("${_name}")

source=("https://download.kde.org/stable/plasma/${pkgver}/${_name}-${pkgver}.tar.xz"{,.sig})

sha256sums=(
    '773bddb2a38ee6dfb490df5a81ed0b76de9df4e3b2b2773fe66cea6b1bc76b18'
    'SKIP'
)

validpgpkeys=(
    'E0A3EB202F8E57528E13E72FD7574483BB57B18D' # Jonathan Esk-Riddell <jr@jriddell.org>
    '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D' # Bhushan Shah <bshah@kde.org>
    'D07BD8662C56CB291B316EB2F5675605C74E02CF' # David Edmundson <davidedmundson@kde.org>
    '1FA881591C26B276D7A5518EEAAF29B42A678C20' # Marco Martin <notmart@gmail.com>
)

build() {
    cmake -B "build" "${_name}-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DKF5NetworkManagerQt_FOUND=OFF \
        -DKF5BluezQt_FOUND=OFF \
        -DCMAKE_INSTALL_LIBEXECDIR=lib \
        -DBUILD_TESTING=OFF

    cmake --build "build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "build"
}
