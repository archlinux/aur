# Maintainer: Hao Long <aur@esd.cc>
# Contributor: Ryan Dowling <ryan@ryandowling.me>

pkgname=hyper-bin
pkgver=3.0.2
pkgrel=1
pkgdesc="A terminal built on web technologies"
arch=('x86_64')
url="https://hyper.is"
license=('MIT')
conflicts=('hyper' 'hyper-appimage')
provides=('hyper')
depends=('gtk3' 'libxss' 'nss')
options=('!strip')
source=("https://github.com/zeit/hyper/releases/download/${pkgver}/hyper_${pkgver}_amd64.deb"
        "https://github.com/zeit/hyper/raw/${pkgver}/LICENSE")
sha256sums=('d78cf1f3f3928be00426e6409638c17eed9d5fed782065571a8759e4cae6643b'
            'f1042dc10a7346f5f9f141ae8878f6a6dd048fa4890d30fe37c676c65aa3aca0')

package() {
  # extract the data file (already has everything as we need it)
  tar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"

  # link the binary
  install -d -m755 "${pkgdir}/usr/bin"
  ln -sr "${pkgdir}/opt/Hyper/resources/bin/hyper" "${pkgdir}/usr/bin/hyper"

  # License
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
