pkgname=mercusys-ma530-dkms
pkgver=1.0
pkgrel=1
pkgdesc="DKMS module adding support for Mercusys MA530 (RTL8761B) Bluetooth adapter"
url="https://github.com/ProgrammingRainbow/mercusys-ma530-dkms"
arch=('any')
license=('GPL2')
depends=('dkms' 'linux-headers' 'curl' 'patch')

source=(
  "dkms.conf"
  "Makefile"
  "pre_build.sh"
  "add-rtl8761b.patch"
)
sha256sums=('c1204dfbd45cc0c355b45ab6bd8ffe6322d1712159f2aabe021bd4c71027fb3b'
            '3a9ceab68f09e92803e125512ddb5517561f5461641fdd4fb2655935666b4808'
            '0128f47c781704c5019c81d24e57af15ee26cc7049d34359f64a52d0366f38ab'
            '89f063233533d46971e5f5149111ee40213c4882fb14b0b86d43fc32fedf225f')

package() {
    local dest="$pkgdir/usr/src/${pkgname}-${pkgver}"

    install -d "$dest"

    # Install DKMS config
    install -m644 "$srcdir/dkms.conf" "$dest/"

    # Install Makefile
    install -m644 "$srcdir/Makefile" "$dest/"

    # Install PRE_BUILD script
    install -m755 "$srcdir/pre_build.sh" "$dest/"

    # Install patch
    install -m644 "$srcdir/add-rtl8761b.patch" "$dest/"
}
