# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.3.1.RC
pkgrel=2
pkgdesc="Free non-official GUI for Flatpak applications management (staging: it is a testing branch which receives updates frequently and may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('zlib/libpng')
depends=('flatpak' 'python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/a9e3d13aa08fb795345ddd10d69c4446edacd6e2.zip")
sha512sums=('07fb843727fa6020d6c04deaf9e389500f136a11b4f5092255b3094613ac19c56ade5fd0b5b1f49eb60da18d75c17671c0a1081a191759d39d55c5276999cdb8')

build() {
  cd "${srcdir}/fpakman-a9e3d13aa08fb795345ddd10d69c4446edacd6e2"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-a9e3d13aa08fb795345ddd10d69c4446edacd6e2"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/desktop_entry.py
  
  mkdir -p $pkgdir/usr/share/applications  
  mv fpakman.desktop $pkgdir/usr/share/applications/
}
