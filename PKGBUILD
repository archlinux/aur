# Maintainer: Duong Do Minh Chau <duongdominhchau@gmail.com>
pkgname=gitqlient
pkgver=1.5.0
pkgrel=1
pkgdesc="A Git client originally forked from QGit that has continued its own path"
arch=(x86_64)
url="https://github.com/francescmm/GitQlient"
license=('LGPL')
depends=(git qt5-base)
source=("$url/releases/download/v${pkgver}/${pkgname}_${pkgver}.tar.gz")
sha256sums=(95a46674fd4405d5ba605b707791fbf22c02bf81fd0fe893a31d270e9e0d1154)

build() {
    cd "${pkgname}_${pkgver}"
    # By default `qmake` use current directory name, but the `.pro` file
    # name is `GitQlient`, not `GitQlient-$pkgver`, so we need to explicitly
    # specify the `.pro` file here
    qmake PREFIX="/usr" GitQlient.pro
    make
}

package() {
    cd "${pkgname}_${pkgver}"
    make INSTALL_ROOT="${pkgdir}" install
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/gitqlient"
}
