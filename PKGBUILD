# Maintainer: Vinicius Moreira

pkgname=fpakman
pkgver=0.3.0
pkgrel=1
pkgdesc="Free non-official GUI for Flatpak applications management."
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('zlib/libpng')
depends=('flatpak' 'python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman-staging')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('117b635e372f28ef24e03003d489fae7ddd6c5e92eccc5de52a577a7cc464b4b90974cfd74cbb286c2fa4747e2dac908168ce8ab7351ad4f188db626a1a19eeb')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/desktop_entry.py

  mkdir -p $pkgdir/usr/share/applications  
  mv fpakman.desktop $pkgdir/usr/share/applications/
}
