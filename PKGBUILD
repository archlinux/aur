# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=keneric
pkgver=0.4.1
pkgrel=2
fullPkgName="${pkgname}-${pkgver}"
pkgdesc='A generic thumbnailer for KDE'
arch=(i686 x86_64)
url='http://kde-apps.org/content/show.php/?content=174485'
license=(GPL)
depends=(kio)
makedepends=(extra-cmake-modules)
source=("https://dl.opendesktop.org/api/files/download/id/1546322930/s/503fc5b1fdddf304180d27857d3e5e71aee1706bf368e3c59221a1cea5046ab0321cbce0a550519ea0b557010fe7fa4e01213541d48d0bd2c020a4e59466eab4/t/1554572309/u//${fullPkgName}.tar.gz"
    "stripPicture"
    "kenerickrita.desktop"
"kenericblend.desktop")
sha512sums=('372a629aac06b250f8b447bc8ba7609cef43b89ccb216d64c301930d1da25cd96e231d307b2c65878619bac912c56d5e3be21b833e25bbcb9b54bd2e8d665c88'
    '8facba2194ff3677c652afaa559eb1e4f143d077a7202c454c950d409d6d378da85577f1dc5c2fd0e47937bf95f2b50f8659cdd5929cdea7a920c7b514618a29'
    '9528a47faff250df9dd9ad6da699fc98aba77d7bc6e398f62aabf5a0c5ef2ae2d442438febe06f05b70258d12ae985fd8f99280e4b5ad44a5a79c4976e8e4b57'
'4460fd5523a4a50f824b3c6759786882470376416f75e826bd51c843b5ce8d211125e855e56c0b4cec2dc05ed530df2b2dd1eef6807d5e18b7c7cce289c0d37e')

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../ \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
    make
}

package() {
    make -C build DESTDIR="${pkgdir}" install

    mkdir -p "${pkgdir}"/usr/{bin,share/kservices5}
    install -Dm755 stripPicture "${pkgdir}"/usr/bin
    install -Dm644 *.desktop "${pkgdir}"/usr/share/kservices5
}
