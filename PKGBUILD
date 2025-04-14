# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=kavita-bin
pkgver=0.8.6
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
kavita.install
kavita.service
kavita.sysusers
kavita.tmpfiles
)
source_aarch64=(
https://github.com/Kareadita/Kavita/releases/download/v$pkgver/kavita-linux-arm64.tar.gz
kavita.install
kavita.service
kavita.sysusers
kavita.tmpfiles
)
source_armv7h=(
https://github.com/Kareadita/Kavita/releases/download/v$pkgver/kavita-linux-arm.tar.gz
kavita.install
kavita.service
kavita.sysusers
kavita.tmpfiles
)
sha512sums_x86_64=(
87dbd450ac59aeeacbe666ae82d951a994893442445d4ae0d62d7cc4ad5b02b9236ed5f9a6657a79c332eb98cfc137689a4fb573e321377caf3086ed4ae0335a
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)
sha512sums_aarch64=(
aa6671840159e455996cc380fc383728a17289c18bab57f03acc052a7ddfbbc3d897a6ccfa040c147b8fac72dcefacb4b78c0f4c59d3eb9010728f1998b69afc
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)
sha512sums_armv7h=(
b55e75e869feae38e2cd025268578c292f494c433787a951dbac1375d8ffc78d33555f6dbf288e12f643d8be0d3613e73000dcbeceac8a86119427eecf17077c
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)

build() {
    cd "${srcdir}"

    cd Kavita
    chmod 755 Kavita
}

package() {

mkdir -p $pkgdir/opt/kavita
install -Dm 644 $srcdir/Kavita/config/appsettings.json  $pkgdir/etc/Kavita/appsettings.json
cp -Ra $srcdir/Kavita/* $pkgdir/opt/kavita
install -Dm 644 ${srcdir}/kavita.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
install -Dm 644 ${srcdir}/kavita.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
install=kavita.install
install -Dm 644 ${srcdir}/kavita.service -t "$pkgdir"/usr/lib/systemd/system/
rm $pkgdir/opt/kavita/config/appsettings.json
ln -s /etc/Kavita/appsettings.json $pkgdir/opt/kavita/config/appsettings.json

}
