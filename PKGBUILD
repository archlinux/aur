pkgname=wsdd2
pkgver=1.8.7
pkgrel=1
pkgdesc="WSD/LLMNR Discovery/Name Service Daemon. Install it to make Samba shares discoverable on Windows hosts."
url="https://github.com/Netgear/wsdd2"
arch=('x86_64' 'armv7h' 'aarch64')
license=(GPL)
depends=('samba')
source=(
  "wsdd2-${pkgver}.tar.gz::https://github.com/Netgear/wsdd2/archive/${pkgver}.tar.gz"
)
sha256sums=('b0b6b31522f4a5e39d075b31d59d57af9a567f543e0b39b2fbdfec324d30310a')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i s/smbd/smb/ wsdd2.service
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package()
{
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install SBINDIR=/usr/bin DESTDIR="${pkgdir}"
}
