# Maintainer: Changaco
# Maintainer: Pascal Bach
# Maintainer: Achilleas Pipinellis <axilleas@archlinux.info>
# Maintainer: Tomas Kral <tomas.kral@gmail.com>
# Maintainer: Mathias Merscher <archlinux@rheinekopfsache.de>

pkgname=origin-client-bin
pkgver=3.7.0
_hash=7ed6862
pkgrel=1
pkgdesc="The client tools for the Origin platform that powers OpenShift"
arch=(x86_64)
url="https://github.com/openshift/origin"
license=('Apache')

source=("bash-completions::https://raw.githubusercontent.com/openshift/origin/$_hash/contrib/completions/bash/oc"
        "zsh-completions::https://raw.githubusercontent.com/openshift/origin/$_hash/contrib/completions/zsh/oc"
        "https://github.com/openshift/origin/releases/download/v$pkgver/openshift-origin-client-tools-v$pkgver-$_hash-linux-64bit.tar.gz")

sha256sums=('54f1f871de93d8090df39153daceb7f660ca5c175a6b4d40392d8401a8c9ec0d'
            '9a6b1f2949e933dd9eac29164f3d14c36efed4a1beb2dc67e9bf7e7fce175487'
            '573e39965633671aac08d68f57d66ff182fb646649523914f0a60debb6515eba')

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
