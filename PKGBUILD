# Maintainer: dibof228

pkgname=max
pkgver=25.8.0.454
pkgrel=4

pkgdesc="MAX is a multifunctional digital platform with a fully integrated messenger."
arch=("x86_64")
url='https://max.ru'
license=("custom:max")
categories=("network")

depends=("gtk3" "libnotify" "nss" "libxss" "libxtst" "xdg-utils" "at-spi2-core" "util-linux-libs" "libsecret")
makedepends=("tar" "binutils")

source=("https://download.max.ru/electron/MAX.deb")
md5sums=('91a4413990890aaced063daa78f148ab')

prepare() {
    tar -xf data.tar.xz
}

package() {
    cp -r "${srcdir}/usr" "${pkgdir}/"
    cp -r "${srcdir}/opt" "${pkgdir}/"

    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/MAX" << 'EOF'
#!/bin/sh
exec /opt/MAX/MAX "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/MAX"
}
