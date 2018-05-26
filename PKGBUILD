# Maintainer: Ariel AxionL <axionl@aosc.io>

pkgname=openshift-origin-client-bin
pkgver=3.9.0
_hash=191fece
pkgrel=1
groups=('openshift-origin')
provides=("openshift-origin-client")
pkgdesc="Enterprise Kubernetes for Developers ."
arch=('x86_64')
url="https://github.com/filebrowser/filebrowser"
license=('Apache')
depends=('glibc')
optdepends=('kubernetes: https://github.com/kubernetes/kubernetes')

source=("bash-completions::https://raw.githubusercontent.com/openshift/origin/$_hash/contrib/completions/bash/oc"
        "zsh-completions::https://raw.githubusercontent.com/openshift/origin/$_hash/contrib/completions/zsh/oc")

source_x86_64=(openshift-origin-client.tar.gz::https://github.com/openshift/origin/releases/download/v3.9.0/openshift-origin-client-tools-v$pkgver-$_hash-linux-64bit.tar.gz)

sha256sums=('d8596830429e40f28aa600d3d4154306cb13878046a51c4f30945fa1d8d6b622'
            '941ecbe95114a7eec4070778c06f8555263a26063868cc294baada0c23085158')
sha256sums_x86_64=('6ed2fb1579b14b4557e4450a807c97cd1b68a6c727cd1e12deedc5512907222e')

package() {
    install -D -m644 $srcdir/bash-completions $pkgdir/usr/share/bash-completion/completions/oc
    install -D -m644 $srcdir/zsh-completions $pkgdir/usr/share/zsh/site-functions/_oc

    dir="$srcdir/openshift-origin-client-tools-v$pkgver-$_hash-linux-64bit"

    install -Dm644 $dir/LICENSE ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 $dir/oc $pkgdir/usr/bin/oc
}
