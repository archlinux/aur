# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=kavita-bin
pkgver=0.8.5.3
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
f3d10fb1ac68d9eb1fcff7bd09e2db17b09923966034d782bc891b582c76a50da9b12217d369976de1e93ea35008df37e21acf4918c1f00b39cb7828883b78da
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)
sha512sums_aarch64=(
fbf8a0e139944c1f9619b093420abce1bee7f3ed72ff55b44adbb09fe4756571e443e126eefe3ec2dee88472a46df4243e16082f44699b649fb54d9c563fec98
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)
sha512sums_armv7h=(
71bdc69d93d831529df72364a2fa8caf2765e89cc13977ffefaaf83951d29e114b3d094f1a798de0a8f0c9f8081637a15be0728b20bbc338e39343df07e9602b
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
