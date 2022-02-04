# Maintainer: Ranadeep B < mail at rnbguy dot at >

_pkgname=apalache
pkgname=$_pkgname-bin
pkgver=0.20.1
pkgrel=1
pkgdesc="A symbolic model checker for TLA+"
arch=('any')
url="https://$_pkgname.informal.systems/"
license=('Apache')
provides=(${_pkgname})
conflicts=(${_pkgname})
depends=('java-runtime>=11'
         'glibc=2.33'
         'findutils'
         'coreutils'
         'util-linux')
makedepends=('patch')
source=("https://github.com/informalsystems/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver.tgz"
        'sys-install.patch')
sha256sums=('12b94b211728fa0eb4272b0a29f1ae0d794a35d58f26e93e51dc2557af5ad004'
            'a99c93f3d7af4648fd79105e98a33819b5b1b8b4075fdbf60c26a931fe3c7e78')

prepare() {
    patch --directory="$srcdir" --forward --strip=1 --input="$srcdir/sys-install.patch"
}

package() {
    install -Dt "$pkgdir/usr/bin" "bin/$_pkgname-mc"
    install -Dt "$pkgdir/opt/$_pkgname" "target/scala-2.12/$_pkgname-pkg-$pkgver-full.jar"
    install -m644 -Dt "$pkgdir/usr/share/licenses/$_pkgname" LICENSE

    ln -s "/usr/bin/$_pkgname-mc" "$pkgdir/usr/bin/$_pkgname"
}
