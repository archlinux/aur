# Maintainer: julien virey <julien.virey@gmail.com>

pkgname=splatmoji
pkgver=1.2.0
pkgrel=1
pkgdesc="Quickly look up and input emoji and/or emoticons/kaomoji on your GNU/Linux desktop via pop-up menu."
arch=('any')
url="https://github.com/cspeterson/$pkgname"
license=('MIT')
depends=('rofi' 'xdotool' 'xsel')
provides=("$pkgname")
conflicts=("${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cfcc9949ae053be2106fb64cbd75adfff5a772a3b4bc2ae15ad44e2997a0e6ee')

package() {
    cd "$pkgname-$pkgver"

    mkdir -p "$pkgdir"/usr/bin/
    mkdir -p "$pkgdir/usr/share/$pkgname"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    cp -a --no-preserve=ownership * "$pkgdir/usr/share/$pkgname"

    cat > "$pkgdir/usr/bin/$pkgname" << EOF
#!/bin/sh
cd /usr/share/splatmoji
exec bash splatmoji "\${@}"
EOF

    chmod a+x "$pkgdir/usr/bin/$pkgname"
}
