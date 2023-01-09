# Maintainer: Nriver <6752679+Nriver@users.noreply.github.com>
pkgname="trilium-cn"
pkgver=0.57.5_20221216
pkgrel=1
pkgdesc="Trilium notes 中文版"
arch=('x86_64')
url="https://github.com/Nriver/trilium-translation"
license=('AGPL3')
source=("https://github.com/Nriver/trilium-translation/releases/download/v$pkgver/trilium-cn-linux-x64.zip")
sha256sums=('82b8381a816f2d6e535a4632f912f9b5d85018339d17f1bbb6c47fd33517598b')

package() {
    export destdir="$pkgdir/"
    # Make folders for extraction
    mkdir -p "$pkgdir/opt/$pkgname"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/applications"
    # Move main files
    mv trilium-linux-x64/* "$pkgdir/opt/$pkgname"
    # Write command and make executable
    echo -e "#!/bin/sh
/opt/$pkgname/trilium" > "$pkgdir/usr/bin/trilium-cn"
    # Create .desktop file
    echo -e "[Desktop Entry]
Name=Trilium 中文版
GenericName=笔记应用
Comment=Trilium 中文版
Exec=trilium-cn %f
Icon=/opt/$pkgname/icon.png
Terminal=false
Type=Application
Categories=Office
StartupWMClass=trilium notes" > "$pkgdir/usr/share/applications/trilium-cn.desktop"
    chmod -R 0755 "$pkgdir"
}
