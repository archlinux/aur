# Maintainer: Hao Long <aur@esd.cc>
# Contributor: Ryan Dowling <ryan@ryandowling.me>

pkgname=hyper-bin
pkgver=3.1.5
pkgrel=1
pkgdesc="A terminal built on web technologies"
arch=('x86_64')
url="https://hyper.is"
license=('MIT')
conflicts=('hyper' 'hyper-appimage')
provides=('hyper')
depends=('gtk3' 'libxss' 'nss')
options=('!strip')
source=("${pkgname}-${pkgver}-amd64.deb::https://github.com/zeit/hyper/releases/download/v${pkgver}/Hyper_${pkgver}_amd64.deb"
        "${pkgname}-${pkgver}-LICENSE::https://github.com/zeit/hyper/raw/v${pkgver}/LICENSE")
b2sums=('71e13f47d873dc3c2c9623a6ec509d4a956c4e0ae62df552728142ddfa1ea0e305993eb161a519d9517d35863507a276e3419a24a03f2a1af3d070cdae880dd1'
        'ce0705a42e98b23c60d347990c0ee91443b53bf282fb55ecb7f294d84b08f1b4515989efe2458999212a5705e6e4105e43998eb3e24b1f797129d0c1bf2bf7f8')

package() {
  # extract the data file (already has everything as we need it)
  tar -xf "${srcdir}/data.tar.bz2" -C "${pkgdir}"

  # link the binary
  install -d -m755 "${pkgdir}/usr/bin"
  ln -sr "${pkgdir}/opt/Hyper/resources/bin/hyper" "${pkgdir}/usr/bin/hyper"

  # License
  install -Dm644 ${pkgname}-${pkgver}-LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
