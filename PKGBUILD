# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-bin"
pkgver="1.11.6"
pkgrel="1"
pkgdesc="The universal proxy platform (binary version)."
provides=("sing-box")
conflicts=("sing-box" "sing-box-beta" "sing-box-git")
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/SagerNet/sing-box"
license=("GPL3")
backup=("etc/sing-box/config.json")
source=("sing-box.service"
        "sing-box@.service"
        "sing-box.sysusers"
        "sing-box.tmpfiles"
        "config.json")
source_x86_64=("sing-box-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/sing-box-$pkgver-linux-amd64.tar.gz")
source_armv7h=("sing-box-$pkgver-armv7h.tar.gz::$url/releases/download/v$pkgver/sing-box-$pkgver-linux-armv7.tar.gz")
source_aarch64=("sing-box-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/sing-box-$pkgver-linux-arm64.tar.gz")
sha512sums=('22dd683d93e28ac8bc6eb33519b2d6dbf382f533f20937226f64f3ac583bb6101bda28ba0b4b097058fdf32c48a6ab007961b90298e82dea0e17fec66032f5b5'
            'f1122183b64ffc396394c6be3721c48d1ec094d0aad7a894324e9a0ccc9bcc1cedc11e3be9f6082f51e6851c8821a51361fe6286188ab2b3daca19a86e6f1c7c'
            '0541f144ee33bb4cb182231794065babae530260b95bff26cbeb5491ab856d40e247895d130629f9dbef58dcd6652f0c69d3e28f57f3bae916d36294565399b0'
            '5afe85ede1e8af0f9caa2db7cd03dec3c7aa0a135feefe26f77748742b22402b90f3d8d8172e535b3c1353b136620e6f20d66d2d782ea8687a66b6c4e6c82650'
            '6f83236630828c2315806f4b857d54266fe06872822b6b6b48c05f21db428e6e1308ffb04cb96fea5a0bf914a2467d7034af4827667389525e8e3b2e234c6528')
sha512sums_x86_64=('e453a7daefe1bc05351aa2b2384a208d85d3f4eb3cc7576319d677dfb0ae85b84ff09049dfd958d9b20b13793ab914ec823fa8e227c8b7cbc508eebe7f6cb645')
sha512sums_armv7h=('253a57861396729be477be87740afe6ded0e5adb9c189b42141efb58a40a9e8987faed5bed9bbd540ade4cb2e7a60f8ac341ee662accd894bd32867a990fdb57')
sha512sums_aarch64=('e8f03a5382ea2891adb7ee790b15adb63d39d60654442d2398520b5bb70d87cef2f07f846126e34ae70b7fac252dbedbc8f5e62423f17af2afcfb61f93e9f764')

package() {
    declare -A ARCH_MAP
    ARCH_MAP=( [x86_64]="amd64" [armv7h]="armv7" [aarch64]="arm64" )

    install -Dm644 sing-box.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 sing-box@.service -t "$pkgdir/usr/lib/systemd/system"
    install -Dm644 sing-box.sysusers "$pkgdir/usr/lib/sysusers.d/sing-box.conf"
    install -Dm644 sing-box.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/sing-box.conf"
    install -Dm644 config.json -t "$pkgdir/etc/sing-box"

    cd "sing-box-$pkgver-linux-${ARCH_MAP[$CARCH]}"
    install -Dm755 sing-box -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/sing-box"
    install -Dm644 <(./sing-box completion bash) "$pkgdir/usr/share/bash-completion/completions/sing-box"
    install -Dm644 <(./sing-box completion fish) "$pkgdir/usr/share/fish/vendor_completions.d/sing-box.fish"
    install -Dm644 <(./sing-box completion zsh) "$pkgdir/usr/share/zsh/site-functions/_sing-box"
}
