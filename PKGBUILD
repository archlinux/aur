# Contributor: CountMurphy <spartan1086@gmail.com>
pkgname=kavita-bin
pkgver=0.8.8
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
e646cd9b774b2af2b611f4a07270d1e1697f766ba15f2ca2ab71d4b591a7174ff752fc70376de7a3539e865094421952671a2ee4a0dc325ab56f6879cbebf1da
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)
sha512sums_aarch64=(
5572be1c51de96f22980e7ca898786328d216c4258bbd7003a32ad18552f9f64efcf598b2e3a0c178363035ef9be616b3ae80a578c8b362f2384740b4e25ab43
'SKIP'
'SKIP'
'SKIP'
'SKIP'
)
sha512sums_armv7h=(
3b827bebd240f2768cb52228125619e7bc264b33624f6651cf31c473af34e1a196d23ae7c5bacc7df1063ebb3ffcdf582e012d43b6580c72b4c374ca6bcde3d2
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
