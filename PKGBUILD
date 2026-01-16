# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=kavita-bin
pkgver=0.8.9
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
680ecc592cc48f2a68c8c00de84a07666031fae9d480f25e8a654870a8850037d2af13b32d2872e9a5c166727735971e99a1d1707edd4b51d4b3c9ec850ac661
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)
sha512sums_aarch64=(
dd59d36c133e566c9f6eb094016ecf96782f4bc9d729cd858d099145db326d3bae2e6cb8bb105b851537feacd2168375edc273552fcdffabe30ba69f897d9180
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)
sha512sums_armv7h=(
537df060f7d12d6a21f8234a6e7b24c00dc56f9e243cc9676a23e46c24038641ba6bcb24b337510ee8eda41464a9f44069aabdce60d37779d5de5fe4798c9c8b
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
