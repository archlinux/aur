#Maintainer : Sasasu <lizhaolong0123@gmail.com>
pkgname=caret-bin
pkgver=1.12.0
pkgrel=1
pkgdesc="Premium Markdown Editor http://caret.io"
arch=('x86_64')
url="https://github.com/careteditor/caret"
license=('unknown')
depends=('gconf')
source=("https://github.com/careteditor/caret/releases/download/$pkgver/Caret.deb")

prepare() {
    cat > "Caret" << EOF
#!/usr/bin/env sh
/opt/caret/Caret
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
    
    mkdir -p ${pkgdir}/usr/local/bin
    cp Caret ${pkgdir}/usr/local/bin/Caret
    
    rm ${pkgdir}/opt/caret/after-install.tpl
    rm ${pkgdir}/opt/caret/after-remove.tpl 
}
md5sums=('dcb565f80cc73049e827171a012c95b5')
