# Maintainer: Vinicius Moreira

pkgname=fpakman-staging
pkgver=0.4.2.RC
pkgrel=1
pkgdesc="Free non-official GUI for Flatpak / Snap applications management (staging: it is a testing branch which receives updates frequently and may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/fpakman"
license=('zlib/libpng')
depends=('python' 'python-pip' 'python-pyqt5' 'python-requests' 'python-colorama')
optdepends=('flatpak' 'snapd')
makedepends=('git' 'python-setuptools')
provides=("fpakman")
conflicts=('fpakman')
source=("${url}/archive/8f9f8d04db238234790e515fd79efdfbdf86456b.zip")
sha512sums=('d3d3aaa5ed34962b3da4322dea00207ea660e5030caea1f42a0f81a3ac08c447ad43a515b4a4e89d7165bb46fececcee5b058ff82bc70adab1908d6ddb8fd426')

build() {
  cd "${srcdir}/fpakman-8f9f8d04db238234790e515fd79efdfbdf86456b"
  python3 setup.py build
}

package() {
  cd "${srcdir}/fpakman-8f9f8d04db238234790e515fd79efdfbdf86456b"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  python3 aur/desktop_entry.py
  
  mkdir -p $pkgdir/usr/share/applications
  mv fpakman.desktop $pkgdir/usr/share/applications/
}
