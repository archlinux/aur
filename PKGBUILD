# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=breeze-plymouth
pkgver=5.26.4
pkgrel=1
pkgdesc="Breeze theme for plymouth"
arch=(any)
url='https://projects.kde.org/breeze-plymouth'
license=(LGPL)
depends=(plymouth)
makedepends=(extra-cmake-modules)
optdepends=(noto-fonts)
source=("http://download.kde.org/stable/plasma/${pkgver}/${pkgname}-${pkgver}.tar.xz"{,.sig}
				'breeze-plymouth.cpiohook')
sha256sums=('ad6b9e1743fa8d23431e705bf98b9ec3904b022d0011f633ebf8b7871b6b2641'
            'SKIP'
            'e87418d5694514b6227a0fa81fbc71dfa05d50092a90082a4a4467f4d2d08385')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D' # Jonathan Riddell
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
	
	install -dm755 "${pkgdir}/etc/initcpio/install"
	install -m644 "${srcdir}/breeze-plymouth.cpiohook" "${pkgdir}/etc/initcpio/install/breeze-plymouth"
}
