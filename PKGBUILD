# Maintainer: Nissar Chababy <funilrys at outlook dot com>
# Ex-Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=keneric
pkgver=0.3
pkgrel=2
fullPkgName="174485-${pkgname}-${pkgver}"
pkgdesc='A generic thumbnailer for KDE'
arch=(i686 x86_64)
url='http://kde-apps.org/content/show.php/?content=174485'
license=(GPL)
depends=(kio)
makedepends=(extra-cmake-modules)
source=("${fullPkgName}.tar.gz::https://www.linux-apps.com/p/1080815/startdownload?file_id=1460971625&file_name=${fullPkgName}.tar.gz&file_type=application/x-gzip&file_size=469003&url=https%3A%2F%2Fdl.opendesktop.org%2Fapi%2Ffiles%2Fdownload%2Fid%2F1460971625%2Fs%2F2d7d5df9335cce0abe330a5e4449f05b%2Ft%2F1535045678%2Fu%2F%2F${fullPkgName}.tar.gz"
        "stripPicture"
        "kenerickrita.desktop"
        "kenericblend.desktop")
sha512sums=('0c57621d3b74df9f059e10b217e2c471628ed69eed432f97026b39dc58e822721d69873fe8302e138d95538621820b851068d6dc6760cccbfb4a1f0b2a6682f7'
         '8facba2194ff3677c652afaa559eb1e4f143d077a7202c454c950d409d6d378da85577f1dc5c2fd0e47937bf95f2b50f8659cdd5929cdea7a920c7b514618a29'
         '9528a47faff250df9dd9ad6da699fc98aba77d7bc6e398f62aabf5a0c5ef2ae2d442438febe06f05b70258d12ae985fd8f99280e4b5ad44a5a79c4976e8e4b57'
         '4460fd5523a4a50f824b3c6759786882470376416f75e826bd51c843b5ce8d211125e855e56c0b4cec2dc05ed530df2b2dd1eef6807d5e18b7c7cce289c0d37e')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../${pkgname}-${pkgver} \
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
