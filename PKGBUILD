# Maintainer: Changaco
# Maintainer: Pascal Bach
# Maintainer: Achilleas Pipinellis <axilleas@archlinux.info>
# Maintainer: Tomas Kral <tomas.kral@gmail.com>
# Maintainer: Mathias Merscher <archlinux@rheinekopfsache.de>

pkgname=origin-client-bin
pkgver=3.6.1
_hash=008f2d5
pkgrel=1
pkgdesc="The client tools for the Origin platform that powers OpenShift"
arch=(x86_64)
url="https://github.com/openshift/origin"
license=('Apache')

source=("bash-completions::https://raw.githubusercontent.com/openshift/origin/$_hash/contrib/completions/bash/oc"
        "zsh-completions::https://raw.githubusercontent.com/openshift/origin/$_hash/contrib/completions/zsh/oc"
        "https://github.com/openshift/origin/releases/download/v$pkgver/openshift-origin-client-tools-v$pkgver-$_hash-linux-64bit.tar.gz")

sha256sums=('7cf9f61d8a161affff43ae7022188bb877a6c5eecbef3c9829790f6d76e5c664'
            '0d4a3d387a9982b91ef1636f42b72fa3437871011eb9ee5fe26da8ce44276fce'
            '922afb7a5642040ea7a6b780cd68eb1d15533b6376b503351a4c38a452338d11')

prepare() {
    # Fix zsh completion
    sed -i '1i#compdef oc' $srcdir/zsh-completions
}

package() {
    # completions
    install -D -m644 $srcdir/bash-completions $pkgdir/usr/share/bash-completion/completions/oc
    install -D -m644 $srcdir/zsh-completions $pkgdir/usr/share/zsh/site-functions/_oc

    # package
	install -D -m755 $srcdir/*/oc $pkgdir/usr/bin/oc
}
