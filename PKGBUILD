# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=kavita-bin
pkgver=0.9.1.4
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
4a2ec939eaa05e2f4dc68fc94b33a0e0a00efd0d9741abc237a4f1a338724c17a07887003d8cfb0209e106bb9cd704c010e18d2f32f6712783cd39689bdd0fe9
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)
sha512sums_aarch64=(
1ed12a3f3a6e1d66438b9cba3da0e9807420507d8a5b57f945dddd27515a69f44bca30b26809ede040068ac5c79ab45d2581d555a681ffea731ed7b4572d4b2e
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)
sha512sums_armv7h=(
7e572c4879eff01760dba18453c644275064c5682b0c44a14565414d268e56c75779c6dbbdc07e8cfbc21a625c6b78e1ebbe86d4a08a5fd86957f076743a190e
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
