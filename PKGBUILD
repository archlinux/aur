# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=kavita-bin
pkgver=0.8.8.3
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
98411c7642edfb3b5ff000c28b2c45e263bd058066538ea2b15ad16fb456f051436e67ca88e66376b5a3124aecc408d4a51819489516f99fcfb8388e99b06192
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)
sha512sums_aarch64=(
8363e6fb26af66e23c22ba1ae1d4af9b7b33c6a93fda16dd3dbaf18483a359a060147082f0c60b961565bd6e3df063f823f2ee4e96acc6ba5c32280221917ca3
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)
sha512sums_armv7h=(
79808054893345bcc949ef8035950d6bbda6b1c247149c5046558b3bfa40a58b4b31f054c3eb82872e8ffdee565d1043e696749a16105e6c72f5f712b1616c85
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
