# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=kavita-bin
pkgver=0.8.5.11
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
cdf3d49c29af6c576cc1028238f95d5c7a623743d6152cfab3707be5d547f2ade6d9df2a995ba4b3c34285328a2b8583354e1b574f605b24f992ef3847430783
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)
sha512sums_aarch64=(
4166c2bfa0cf3d525800756cd47e2297f6071f7c8e164d761ff4b8fa4b3f6f432b27de69f55ff16eea82996a39c7982cb1b5253f3442362b8a6f2fe0566de954
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)
sha512sums_armv7h=(
f10f827207efaadd95dcfffc408daf007c42efa19c423053d3beeeae822346c133acb69770e88d20147507d0ff8e2f34c63cb164b0d2ff48577c18fcfd03d7c5
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
