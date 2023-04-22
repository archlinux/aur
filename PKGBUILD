# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-bin"
_pkgname="sing-box"
pkgver="1.2.6"
pkgrel="1"
pkgdesc="The universal proxy platform."
provides=("sing-box")
conflicts=("sing-box" "sing-box-beta" "sing-box-git")
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/SagerNet/sing-box"
license=("GPL3")
optdepends=("sing-geosite: sing-geosite database"
            "sing-geoip: sing-geoip database")
backup=("etc/$_pkgname/config.json")
source=("$_pkgname.service"
        "$_pkgname@.service"
        "$_pkgname.sysusers"
        "config.json")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-amd64.tar.gz")
source_armv7h=("$_pkgname-$pkgver-armv7h.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-armv7.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-arm64.tar.gz")
sha512sums=('d6eaf407ccf6239f05bb5da0c962be8ef0855c18f5bf342d0721a54ee4246ba541a5a9481858daeb02491afe9dd1e7546477b4d6554c9111506a445034eacd02'
            '6cb7f8d44a06a2d61febf25813c536eb63e79142b0bbe1b964f232080df6cdc45a70c7ca6a5834cba23280684650a51ba6a5535a03664a49d18e518b394087dc'
            '8ec720c3f9cc1bd5ec2ad118dd3d1c27d86f39062e8d623713c4d841d7cf42e9b3b1552dbe9d66a90737cbece36a3e20cd568b82cd34f3faf82a745a5e59a680'
            'a3eb0e5789f04069fc7fd55ff09c437e394ae370110a43d6a1000759a524ac7d1b9f8b664656c2c9fb94fc9eca4852fb338a24186d9e3da30aed02773edbab86')
sha512sums_x86_64=('98d22ae9b6472cb196bb79d6bd69b97ff49ab3ba6e2beed3f9783ccca07cf1b89b0827a81cd2e9d0c864758945e7c564e64aacf34e10b2ddfe82777b842a6d34')
sha512sums_armv7h=('691182186823a333f068a4a8af10d36e785134a28773c8f16e212370fcd9d115b4d31c0d0b9b8bb20b2e3eaaaa07bbbefe73d1675c0648d81cf72b14ec1fed95')
sha512sums_aarch64=('804e96977205aba9b6a5e56c56dc234de26287b5beb0827bef5f82839afe8d85a1a903a05d8251c4681a07992737c3a8435b8fa01e8ac7b5a02b9645a7df6aeb')

package() {
    declare -A ARCH_MAP
    ARCH_MAP=( [x86_64]="amd64" [armv7h]="armv7" [aarch64]="arm64" )

    cd "$srcdir"
    install -Dm644 "$_pkgname.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "$_pkgname@.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
    install -Dm644 "config.json" -t "$pkgdir/etc/$_pkgname"

    cd "$_pkgname-$pkgver-linux-${ARCH_MAP[$CARCH]}"
    install -Dm755 "$_pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
