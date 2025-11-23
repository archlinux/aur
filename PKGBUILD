# Maintainer: TheBill2001 <tuantran1632001 at gmail dot com>

pkgname=obs-urlsource
pkgver=0.4.0
pkgrel=2
pkgdesc='OBS plugin to fetch data from a URL or file, connect to an API or AI service, parse responses and display text, image or audio on scene'
arch=(x86_64)
url='https://obsproject.com/forum/resources/url-api-source-live-data-media-and-ai-on-obs-made-simple.1756/'
license=('GPL-2.0-only')
depends=('obs-studio' 'qt6-base' 'curl' 'pugixml')
makedepends=(
    'git' # The build process still need to download some dependencies
    'cmake'
    'gcc'
)
source=("https://github.com/royshil/obs-urlsource/releases/download/$pkgver/obs-urlsource-$pkgver-source.tar.xz")
sha256sums=('c1dafbfee3e271bd730c0eca5c487007afaeaa9d9c6573660734f8856182f161')

build() {
    cmake -B build -S obs-urlsource-$pkgver-source \
        -W no-dev \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_FRONTEND_API=ON \
        -DENABLE_QT=ON \
        -DUSE_SYSTEM_CURL=ON \
        -DUSE_SYSTEM_PUGIXML=ON \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
