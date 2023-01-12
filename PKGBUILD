# Maintainer: Hao Long <aur@esd.cc>
# Contributor: Ryan Dowling <ryan@ryandowling.me>

pkgname=hyper-bin
pkgver=3.4.1
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
b2sums=('0e051895837724ea0537ba670edfeec95997370afbf1c0eae6e723d191dfaec1e36ec1704b40a0f7c72f322107b925a16493ddfa3f1af0524b91083ac027e140'
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
