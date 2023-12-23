# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: JKA Network <contacto@jkanetwork.com>
# Contributor: Javier Steinaker <jsteinaker@gmail.com>

pkgname=pinta-git
pkgver=r3406.ee146dc2
pkgrel=2
pkgdesc="Drawing/editing program modeled after Paint.NET. It's goal is to provide a simplified alternative to GIMP for casual users"
arch=(any)
url="https://pinta-project.com"
license=(MIT)
depends=(libadwaita dotnet-runtime webp-pixbuf-loader)
makedepends=(autoconf-archive git intltool dotnet-sdk)
provides=(pinta)
conflicts=(pinta)
source=("git+https://github.com/PintaProject/Pinta.git")
sha256sums=('SKIP')

pkgver() {
  cd "Pinta"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "Pinta"
  ./autogen.sh
}

build() {
  cd "Pinta"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var

  make
}

package() {
  cd "Pinta"
  make DESTDIR="${pkgdir}" install
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" license-*.txt
}
