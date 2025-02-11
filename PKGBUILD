# Maintainer: adityaphra <aditya.phra@gmail.com>

pkgname="sing-box-bin"
pkgver="1.11.2"
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
sha512sums_x86_64=('167dcd7ec9fd567f42fec90386d367095f2493326bb7e3de0161d880c84c7487d4c90abd60339e564cdb2d1cfe3208c901777a9db91be52e14d62fed587cdcad')
sha512sums_armv7h=('4f60c5dedde0669e8a8d18e56948acf40a275aa140d80a922f72bac0d4d0f160763e60178380f46f5e04085dc4c97054fdf4fb2e136dafc6c0e2b4ad2fc49f94')
sha512sums_aarch64=('a92aa680eee1c2f3110cb9b181698a80c0757c89a6eac6f4899b7d5c17301fd7f093c6caa0f11721ba6785ff9bb3166814b8d8d079c0acc307f0ee946902c433')

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
