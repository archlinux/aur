# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=kavita-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="Self hosted ebook and comic reader"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://www.kavitareader.com/"
license=('GPL3')
backup=("etc/Kavita/appsettings.json")
depends=()
makedepends=()
options=(!debug)
source_x86_64=(
https://github.com/Kareadita/Kavita/releases/download/v$pkgver/kavita-linux-x64.tar.gz
)
source_aarch64=(
https://github.com/Kareadita/Kavita/releases/download/v$pkgver/kavita-linux-arm64.tar.gz
)
source_armv7h=(
https://github.com/Kareadita/Kavita/releases/download/v$pkgver/kavita-linux-arm.tar.gz
)
sha512sums_x86_64=(
01c6fb01a01270352d589cc756293042c5c389e472a8d32bff5309392f5e168da1ff4f0b338911f8bfd11f491ac3079d31119fb21f04e12e55e994cc54073f72
)
sha512sums_aarch64=(
6ebc2ce0c233ff0a8f1ac8b448e843ca9e0727bfa4c296364d1f37a43d3b8c02c5f4a043501d3175980d5e43b947ef127028798437363577183137eba40ccba3
)
sha512sums_armv7h=(
b427929b3d906309b18c2d4fa3b98ca1dfdf23a474ab082f376f38f90eeaa2487035c818db5a3105811857cd42c891c5e837af396d89a4f0c20cee9865ac6c91
)

build() {
    cd "${srcdir}"

    tar -xvf kavita-linux-*.tar.gz
    cd Kavita
    chmod 755 Kavita
}

package() {

mkdir -p $pkgdir/opt/kavita
install -Dm 644 $srcdir/Kavita/config/appsettings.json  $pkgdir/etc/Kavita/appsettings.json
cp -Ra $srcdir/Kavita/* $pkgdir/opt/kavita
install -Dm 644 ../kavita.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
install -Dm 644 ../kavita.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
install=kavita.install
install -Dm 644 ../kavita.service -t "$pkgdir"/usr/lib/systemd/system/
rm $pkgdir/opt/kavita/config/appsettings.json
ln -s /etc/Kavita/appsettings.json $pkgdir/opt/kavita/config/appsettings.json

}

