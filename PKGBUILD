# Maintainer: Hao Long <aur@esd.cc>
# Contributor: Ryan Dowling <ryan@ryandowling.me>

pkgname=hyper-bin
pkgver=3.1.3
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
sha256sums=('c3e1484887867f72b5767ca4204cd4dca7afc9a14d9785f46de4fa0dd2d6fb34'
            '07a1ce5a08f3f385ea6f2aef0c8246c2d9bdd7c8dd21235b76b1cb7116efc13f')

package() {
  # extract the data file (already has everything as we need it)
  tar -xf "${srcdir}/data.tar.bz2" -C "${pkgdir}"

  # link the binary
  install -d -m755 "${pkgdir}/usr/bin"
  ln -sr "${pkgdir}/opt/Hyper/resources/bin/hyper" "${pkgdir}/usr/bin/hyper"

  # License
  install -Dm644 ${pkgname}-${pkgver}-LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
