# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Sebastian Lau <lauseb644 _at_ gmail.com>
# Contributor: American_Jesus <american.jesus.pt AT gmail DOT com>

pkgname=nemo-dropbox
pkgver=6.2.0
pkgrel=1
pkgdesc="Dropbox for Linux - Nemo extension"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/linuxmint/nemo-extensions"
license=('custom:CC-BY-ND-3' 'GPL')
depends=('nemo' 'dropbox' 'polkit')
makedepends=('meson' 'samurai' 'glib2-devel')
groups=('nemo-extensions')
source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('b1c7e3d269ed05f472c80c16cf3f12827cbb48cb05406b276be14060225dbbc3')

build() {
  mkdir -p "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"/builddir
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"/builddir
  meson setup --prefix=/usr \
        --libexecdir=lib/${pkgname} \
        --buildtype=plain \
        ..
  samu
}

package() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"/builddir
  DESTDIR="${pkgdir}" samu install

  # install the common license
  install -Dm644 ../COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
