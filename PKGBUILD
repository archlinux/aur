# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-bin"
_pkgname="sing-box"
pkgver="1.3.6"
pkgrel="1"
pkgdesc="The universal proxy platform (binary version)."
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
        "$_pkgname.tmpfiles"
        "config.json")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-amd64.tar.gz")
source_armv7h=("$_pkgname-$pkgver-armv7h.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-armv7.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-arm64.tar.gz")
sha512sums=('b5e5b8dad736b628a2761cc883b7e8439d604b5b1612447020ac7c143747e57acaf7dc8211cb50beb9d727f6d618cbe481874d012837fb3b2f089cd08299e1d2'
            '84dbbd0e7a9f67072bcfd836440ad002c2a46ebb0c9cb54310e13774b63890b6245e13472574e226cfe278c2f9d586fa28f3441a0defca0d35c3653684d07d97'
            '0541f144ee33bb4cb182231794065babae530260b95bff26cbeb5491ab856d40e247895d130629f9dbef58dcd6652f0c69d3e28f57f3bae916d36294565399b0'
            'c97518ba1e9b865239cedbba7bf6c5b9af0e0c873972fa6df7169aac43a8b500f9d063b382530faa326c0b5f135876cb9eb601a7922a6d0f53adaa9ba27e6816'
            'a3eb0e5789f04069fc7fd55ff09c437e394ae370110a43d6a1000759a524ac7d1b9f8b664656c2c9fb94fc9eca4852fb338a24186d9e3da30aed02773edbab86')
sha512sums_x86_64=('a6661333bf7a0820dc55f49e753faa085547b064a7ee4d771aa596fe2c771c11def539bc2dd48ffe3c5355072808c6c50447ed13985bff7bd2d38faeae4a29e3')
sha512sums_armv7h=('d30a9e8426cab918c30a90761c977bd338a9dd8be4a7f0fd026f09c7ad92e1f1133bdf18ab8a7a9130a2fe00f24ddf8b429a03f2f2ba8943b4fe3dbce7bc8b31')
sha512sums_aarch64=('f3d98052dcf8e29383de5314c9a106cc9efb383be643515b3c0c1873f126b4227cc2f5810d681f0a118af918793ab9f4949e20dd1d759c764d7cdeaa4056ce0a')

package() {
    declare -A ARCH_MAP
    ARCH_MAP=( [x86_64]="amd64" [armv7h]="armv7" [aarch64]="arm64" )

    cd "$srcdir"
    install -Dm644 "$_pkgname.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "$_pkgname@.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
    install -Dm644 "$_pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
    install -Dm644 "config.json" -t "$pkgdir/etc/$_pkgname"

    cd "$_pkgname-$pkgver-linux-${ARCH_MAP[$CARCH]}"
    install -Dm755 "$_pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
