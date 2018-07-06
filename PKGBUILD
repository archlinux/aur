# Maintainer: Andrej Marolt <andrej.marolt@gmail.com>
pkgname=openshift-source-to-image
_release=v1.1.11
_commit=78a76d97
pkgver=1.1.11
pkgrel=2
pkgdesc="A tool for building artifacts from source and injecting into docker images"
arch=('i686' 'x86_64')
url="https://github.com/openshift/source-to-image"
license=('Apache')
source=("https://github.com/openshift/source-to-image/releases/download/${_release}/source-to-image-${_release}-${_commit}-linux-amd64.tar.gz")
md5sums=('5ada6a338d660c339bac075e580858d9')

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
