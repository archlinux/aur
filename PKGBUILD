# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-bin"
_pkgname="sing-box"
pkgver="1.2.1"
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
sha512sums_x86_64=('ff802c75495da2d200d27cb3f598b8d4bbbeca4b87343164974ec76c81b98c720c6d71045ec178ebc5cfa1b68484df4a91d05803fd00f86cd0f07e58d83d517c')
sha512sums_armv7h=('70f103521909950257f640eef23b2ae6159942d03a69c8f7b1a62005426b0cce05480d871e9d3de2a20c535e5ff11614e83816dd71f2ec2e0c59bd4d602402b2')
sha512sums_aarch64=('a08df6e18b3bfd971c6e29da74e0de3864c66e85609372bceae38650fd18c91e00072e9425efbafb8e67876d4ff2197655079adf166a81889fe36b455bae0fbc')

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
