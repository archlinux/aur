# Maintainer: HaiHome <HaiHome_114514@outlook.com>
# Contributor: 	fkxxyz <fkxxyz@gmail.com>
pkgname=arctime
pkgver=4.5
pkgrel=1
pkgdesc="A simple, powerful and efficient cross-platform subtitle production software"
arch=('x86_64')
url="https://arctime.cn"
license=('custom')
depends=('mpv' 'java-runtime')
source=("https://dlm.arctime.pro/ARCTIME_PRO_${pkgver}_LINUX.7z"
        "arctime.desktop"
        "16x16.png"
        "24x24.png"
        "32x32.png"
        "48x48.png")
sha256sums=('4f8ba8bb0ab17ba2645f29b38ddf52eb3d44e2df492527a6f390676a84ff120a'
            'e51a09ab47c28cd40dccd09d91f865e788e01b9aa21686a14efe520243b5688d'
            '9f490a4fc4d4f15e31b15e84717e11ce794e908055484f22d02aa0a166093677'
            '406a3953b7b5d54814f6613f23badc0eff04909688d67295371aeeead862ae85'
            'fcd6ecf0a786658968d0c8747b860b5238c0df73c873642dd7ce5fca186d2122'
            'c9bc9ac2ffdc703b672c1f918ea4d48479693bdc69dfd346a077547de47ce7d1')
options=('!strip' '!debug')

package() {
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8

    install -dm755 "$pkgdir/opt/arctime-pro"
    cp -r "$srcdir/ARCTIME_PRO_4.5_LINUX/"* "$pkgdir/opt/arctime-pro/"

    chmod -R a+rX "$pkgdir/opt/arctime-pro"

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/arctime" <<EOF
#!/bin/bash
cd /opt/arctime-pro
exec ./run.sh "\$@"
EOF

    install -Dm644 "$srcdir/arctime.desktop" \
        "$pkgdir/usr/share/applications/arctime.desktop"

    install -Dm644 "$srcdir/16x16.png" \
        "$pkgdir/usr/share/icons/hicolor/16x16/apps/arctime.png"
    install -Dm644 "$srcdir/24x24.png" \
        "$pkgdir/usr/share/icons/hicolor/24x24/apps/arctime.png"
    install -Dm644 "$srcdir/32x32.png" \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/arctime.png"
    install -Dm644 "$srcdir/48x48.png" \
        "$pkgdir/usr/share/icons/hicolor/48x48/apps/arctime.png"

    install -Dm644 "$pkgdir/opt/arctime-pro/tools/GPL LICENSE.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
