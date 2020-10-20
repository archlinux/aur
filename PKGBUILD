pkgname=wsdd2
pkgver=1.8.3
pkgrel=1
pkgdesc="WSD/LLMNR Discovery/Name Service Daemon. Install it to make Samba shares discoverable on Windows hosts."
url="https://github.com/Andy2244/wsdd2"
arch=(x86_64)
license=(GPL)
depends=()
makedepends=()
source=(
	"wsdd2-${pkgver}-${pkgrel}.tar.gz::https://github.com/Andy2244/wsdd2/archive/${pkgver}.tar.gz"
)
sha256sums=('1517042107e141d17caa7e156cb25574c4129965cda3128c1307e2213fadc4cb')

build()
{
	cd "$srcdir/${pkgname}-${pkgver}"
	make
}

package()
{
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/lib/systemd/system"
    mkdir -p "${pkgdir}/usr/lib/systemd/system/smb.service.wants"

    cd "$srcdir/${pkgname}-${pkgver}"
    cp "wsdd2" "${pkgdir}/usr/bin"
    cp "wsdd2.service" "${pkgdir}/usr/lib/systemd/system"
    cd "${pkgdir}/usr/lib/systemd/system/smb.service.wants"
    ln -s "../wsdd2.service" .
}

