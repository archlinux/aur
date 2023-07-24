# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-bin"
_pkgname="sing-box"
pkgver="1.3.3"
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
sha512sums_x86_64=('a359804bdce802aad9080acac26867637a9d1a70c394c1531b73e19a00211dd5161eb1490483cc20e57dbb65f2a35040949ba7ea2c7c7e0c459a93919494623b')
sha512sums_armv7h=('c12c04a2534dc520bf615a1b9f77ccfb7fd21168ce756e3e769a299d83476e11a18a0d33ee4812d07bf0055c4c0c874afea3137a2e83fa10dbd2b1914588eb17')
sha512sums_aarch64=('45d500af1a2c44942dac977aa90a02a6f8e3d3ecd0c35348b135a9d6b5704d22fb8dc26e953658cddbb7eb4e722b376a454eca0accc09f6b7fa62643c71d6d10')

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
