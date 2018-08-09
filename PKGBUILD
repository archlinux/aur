# Maintainer: Changaco
# Maintainer: Pascal Bach
# Maintainer: Achilleas Pipinellis <axilleas@archlinux.info>
# Maintainer: Tomas Kral <tomas.kral@gmail.com>
# Maintainer: Mathias Merscher <archlinux@rheinekopfsache.de>

pkgname=origin-client-bin
pkgver=3.10.0
_hash=dd10d17
pkgrel=1
pkgdesc="The client tools for the Origin platform that powers OpenShift"
arch=(x86_64)
url="https://github.com/openshift/origin"
license=('Apache')

source=("bash-completions::https://raw.githubusercontent.com/openshift/origin/$_hash/contrib/completions/bash/oc"
        "zsh-completions::https://raw.githubusercontent.com/openshift/origin/$_hash/contrib/completions/zsh/oc"
        "https://github.com/openshift/origin/releases/download/v$pkgver/openshift-origin-client-tools-v$pkgver-$_hash-linux-64bit.tar.gz")

sha256sums=('cb75b40b16e944837ed43301ad198f2495e710183d0cdb2d913df1c3a7ad5e6d'
            '8968807fade858027b79ee2dc5f0a9a8b40614584ad3b5b84f36c9c770ddc760'
            '0f54235127884309d19b23e8e64e347f783efd6b5a94b49bfc4d0bf472efb5b8')

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
