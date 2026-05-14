# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=kavita-bin
pkgver=0.9.0.2
pkgrel=2
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
081d5412db6a1bd898a9d53d522023cdcd2e9f5e886b7cfa80079fa9873c8de54763410c9b721284bf36283b74e3b4980379507fd67ff94169d58f7fbfdf966c
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)
sha512sums_aarch64=(
25a215cdd659eaf68925ed9223002132eef23b3e9e6e4ba016f48354fc04d70d8d327ac6a6b47300c00001c3ebb2e11e30f30100d1d0a32df881f1cb6bdc2b9a
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)
sha512sums_armv7h=(
b4e4a6a6a7329388c2476d37e4efbb2c89884f6e00391c3d2ed4c19664a3d2c2b84db99557c04e50e85161b15d04e45d29db38423141ad5e02e139fbc401b0c0
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
install -Dm 644 $srcdir/Kavita/config/appsettings-init.json  $pkgdir/etc/Kavita/appsettings.json
cp -Ra $srcdir/Kavita/* $pkgdir/opt/kavita
install -Dm 644 ${srcdir}/kavita.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
install -Dm 644 ${srcdir}/kavita.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
install=kavita.install
install -Dm 644 ${srcdir}/kavita.service -t "$pkgdir"/usr/lib/systemd/system/
rm $pkgdir/opt/kavita/config/appsettings-init.json
ln -s /etc/Kavita/appsettings.json $pkgdir/opt/kavita/config/appsettings-init.json

}
