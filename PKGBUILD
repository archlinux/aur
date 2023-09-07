# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-beta-bin"
_pkgname="sing-box"
_pkgver="1.5.0-beta.4"
pkgver="${_pkgver/-/.}"
pkgrel="1"
pkgdesc="The universal proxy platform (beta binary version)."
provides=("sing-box")
conflicts=("sing-box" "sing-box-beta" "sing-box-git" "sing-box-bin")
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
source_x86_64=("$_pkgname-$_pkgver-x86_64.tar.gz::$url/releases/download/v$_pkgver/$_pkgname-$_pkgver-linux-amd64.tar.gz")
source_armv7h=("$_pkgname-$_pkgver-armv7h.tar.gz::$url/releases/download/v$_pkgver/$_pkgname-$_pkgver-linux-armv7.tar.gz")
source_aarch64=("$_pkgname-$_pkgver-aarch64.tar.gz::$url/releases/download/v$_pkgver/$_pkgname-$_pkgver-linux-arm64.tar.gz")
sha512sums=('b5e5b8dad736b628a2761cc883b7e8439d604b5b1612447020ac7c143747e57acaf7dc8211cb50beb9d727f6d618cbe481874d012837fb3b2f089cd08299e1d2'
            '84dbbd0e7a9f67072bcfd836440ad002c2a46ebb0c9cb54310e13774b63890b6245e13472574e226cfe278c2f9d586fa28f3441a0defca0d35c3653684d07d97'
            '0541f144ee33bb4cb182231794065babae530260b95bff26cbeb5491ab856d40e247895d130629f9dbef58dcd6652f0c69d3e28f57f3bae916d36294565399b0'
            'c97518ba1e9b865239cedbba7bf6c5b9af0e0c873972fa6df7169aac43a8b500f9d063b382530faa326c0b5f135876cb9eb601a7922a6d0f53adaa9ba27e6816'
            'a3eb0e5789f04069fc7fd55ff09c437e394ae370110a43d6a1000759a524ac7d1b9f8b664656c2c9fb94fc9eca4852fb338a24186d9e3da30aed02773edbab86')
sha512sums_x86_64=('79508451a8433f5950734b2f8e3c337e6349a924d5ddd8c6e87c747233e093ea462178cdb169e695b315ffa2c9c74f917725cfbe8eabc2e5379958a957552198')
sha512sums_armv7h=('401a1ce432c011c9384a5b7a72c8c1b105dff45300ceb99de56c0942c769dfb3640a1874b81afa011bde21b3290dfae204c1b00bd360b8a505d67f5e566cdab5')
sha512sums_aarch64=('b72da23346a7e6d929eece544a56ec0ff4b6eb785188025e87f2f37b3875174ebe6c3a2e1b8125f5e507700cb29b0e20baf8dd08cb3a011d75ca5e62929abd65')

package() {
    declare -A ARCH_MAP
    ARCH_MAP=( [x86_64]="amd64" [armv7h]="armv7" [aarch64]="arm64" )

    cd "$srcdir"
    install -Dm644 "$_pkgname.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "$_pkgname@.service" -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 "$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
    install -Dm644 "$_pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
    install -Dm644 "config.json" -t "$pkgdir/etc/$_pkgname"

    cd "$_pkgname-$_pkgver-linux-${ARCH_MAP[$CARCH]}"
    install -Dm755 "$_pkgname" -t "$pkgdir/usr/bin"
    install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
