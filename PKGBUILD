# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=kavita-bin
pkgver=0.8.4.2
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
f9aaf270afb2380438755aac51a91668930a49a3607bea737ed47f9776fb339c3d4792faca9272be44f58db7be883c022e3b0e1d1348626835f70e8902d19b04
)
sha512sums_aarch64=(
b899aa32e119309dab8210818f3ee96a0cc2f42648c82eebf47670c2f53419b445f108ac456706757d4b4e4c2e0f34534c6c3e48f078c6bea0ac7fcd1dd4ad3e
)
sha512sums_armv7h=(
a7f87615c4991284aa7517b77b5dc412b71db322b9d737b5707e3c5b8a41834f79ca3cd24bf95d3814dbdb19ed8074e03cf09d0cfcc3fca0bf5b9c3ff2103df5
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
