pkgname=wsdd2
pkgver=1.8.6
pkgrel=2
pkgdesc="WSD/LLMNR Discovery/Name Service Daemon. Install it to make Samba shares discoverable on Windows hosts."
url="https://github.com/Netgear/wsdd2"
arch=('x86_64' 'armv7h' 'aarch64')
license=(GPL)
depends=()
makedepends=('samba')
source=(
  "wsdd2-${pkgver}-${pkgrel}.tar.gz::https://github.com/Netgear/wsdd2/archive/${pkgver}.tar.gz"
)
sha256sums=('707f9403559de70cc488c6c3deea12baf30d74068da88a59e7c0669a347b4661')

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
