# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.4.2.RC
pkgrel=2
pkgdesc="Free non-official GUI for Flatpak / Snap applications management (staging: it is a testing branch which receives updates frequently and may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
optdepends=('flatpak' 'snapd')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/6b8ee684633ffac200b1290b7589c92735579c91.zip")
sha512sums=('d42b6b6c0061ea3c1b48f04064bbe2332da26415f5f0b3a49ff933119d19d43ce67992cb74d96f7a6bd328432b6618660ec1e196771b351cd73c6d07277c8b0e')

build() {
  cd "${srcdir}/fpakman-6b8ee684633ffac200b1290b7589c92735579c91"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-6b8ee684633ffac200b1290b7589c92735579c91"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/desktop_entry.py
  
  mkdir -p $pkgdir/usr/share/applications
  mv fpakman.desktop $pkgdir/usr/share/applications/
}
