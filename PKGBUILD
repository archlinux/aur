# Maintainer: Duong Do Minh Chau <duongdominhchau@gmail.com>
pkgname=gitqlient
pkgver=1.4.0
pkgrel=1
pkgdesc="A Git client originally forked from QGit that has continued its own path"
arch=(x86_64)
url="https://github.com/francescmm/GitQlient"
license=('LGPL')
depends=(git qt5-base qt5-webengine qt5-webchannel)
source=("https://github.com/francescmm/GitQlient/archive/v${pkgver}.tar.gz")
sha256sums=(46e436a38f40e5d7f24f2fb13e866e45c2e9acc956dc59f03ab6a19a2d8c8a76)

build() {
    cd "GitQlient-$pkgver"
    # By default qmake use current directory name, but the `.pro` file
    # name is `GitQlient`, not `GitQlient-$pkgver`, so we need to explicitly
    # specify the `.pro` file here
    qmake PREFIX="/usr" GitQlient.pro
    make
}

package() {
    cd "GitQlient-$pkgver"
    make INSTALL_ROOT="${pkgdir}" install
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/gitqlient"
}
