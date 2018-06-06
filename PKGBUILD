#Maintainer : Sasasu <lizhaolong0123@gmail.com>
#Co-maintainer: dudez <manuel.bua@gmail.com>
pkgname=caret-bin
pkgver=3.4.6
pkgrel=1
pkgdesc="Premium Markdown Editor http://caret.io"
arch=('x86_64')
url="https://github.com/careteditor/caret"
license=('unknown')
depends=('gconf' 'nss' 'libxss' 'alsa-lib' 'libxtst' 'gtk2')
source=("https://github.com/careteditor/caret/releases/download/$pkgver/Caret.deb")
md5sums=('ab98e35470420cf6a3708a759de2d48e')

prepare() {
    cat > "Caret" << EOF
#!/usr/bin/env sh
/opt/caret/Caret \$@
EOF

    chmod +x Caret
}

build() {
    cd "$srcdir"
    tar -xf data.tar.xz
}

package() {
    cd "$srcdir"

    mkdir -p ${pkgdir}/opt/caret
    cp -ra opt/caret/* ${pkgdir}/opt/caret
    mkdir -p ${pkgdir}/usr/share
    cp -ra usr/share/* ${pkgdir}/usr/share

    mkdir -p ${pkgdir}/usr/bin
    cp Caret ${pkgdir}/usr/bin/Caret

    rm ${pkgdir}/opt/caret/after-install.tpl
    rm ${pkgdir}/opt/caret/after-remove.tpl
}
