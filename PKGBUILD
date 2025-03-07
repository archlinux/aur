# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=kavita-bin
pkgver=0.8.5
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
09d0cf0fa89fc5336bc7cdc264234b6520ed188ddf0d7ac8349eff04c661962cdfc0f3adf5a0fc6983f45f571edb0e4c41d99da34f88fdae622fa13484ddcc98
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)
sha512sums_aarch64=(
45e9bc1aa2631677011a529f0264bcf7a680da01de3104b039fa061a43f027d9f22ee8adc53163185a1aeac5f4e205f4936fb7a2abdd17e405faa56ade188399
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)
sha512sums_armv7h=(
8e4ce6470c9a9e9f6ab70970a6f711e28f1cccef125de25074d588901d889a6b6bf4c15030421233b90ccec64fb8600452a3ab4f4592696cfb915286d0998395
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
