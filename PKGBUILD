# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=kavita-bin
pkgver=0.8.4
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
72a7d9f69b995b9f0f13180dc3fde34d588708379da50c10b59dfb0fe50d32b2fe7603c0235f5dd2c8a58b37369b93aee9a01bf45a365789e738e77bf049c468
)
sha512sums_aarch64=(
c52122033affbe1278921c29a935fea2f6d288bcdbad39c467393b824e4f852f617cd2aca74aa1fdd1d451f003cd0728c0a9b83ce60ba10f496e01263219eed4
)
sha512sums_armv7h=(
e5a78bb4a86fe6a2196a41be03038af14c9eed1c9ada2845d7f3181780e70a0f936ca6513aeff7fc46068707b6dfcdb023a4512e955ce875c6482463dcecfab4
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
