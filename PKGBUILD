# Maintainer: Claudio Nave <claudio nave nine seven at gmail dot com>
# Contributor: Andrej Marolt <andrej.marolt@gmail.com>

pkgname=openshift-source-to-image
pkgver=1.3.8
pkgrel=1
pkgdesc="A tool for building artifacts from source and injecting into docker images"
arch=('i686' 'x86_64')
url="https://github.com/openshift/source-to-image"
license=('Apache')
source=("https://github.com/openshift/source-to-image/releases/download/v${pkgver}/source-to-image-v${pkgver}-980ca195-linux-amd64.tar.gz")
sha256sums=('19fb08674bfacd561991737d00de3c5c3c05aed163e05321b50d0adbe186ea7b')

build() {
    echo "Installing source-to-image"
    $srcdir/s2i completion bash > $srcdir/s2i.bash
    $srcdir/s2i completion zsh  > $srcdir/s2i.zsh
    # Fix zsh completion
    sed -i '1i#compdef s2i' $srcdir/s2i.zsh
}

package() {
    # completions
    install -D -m644 $srcdir/s2i.bash $pkgdir/usr/share/bash-completion/completions/s2i
    install -D -m644 $srcdir/s2i.zsh  $pkgdir/usr/share/zsh/site-functions/_s2i

    # package
    install -D -m755 $srcdir/s2i      $pkgdir/usr/bin/s2i
    ln -s s2i                         $pkgdir/usr/bin/sti
}
