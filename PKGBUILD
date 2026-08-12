# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=paml-bin
_pkgname=paml
pkgver=4.10.10
pkgrel=1
pkgdesc="Phylogenetic analysis by maximum likelihood (precompiled binary) https://doi.org/10.1093/molbev/msm088"
arch=('x86_64')
url="https://github.com/abacus-gene/paml"
license=('GPL-3.0-or-later')
depends=('glibc')
provides=("paml=${pkgver}")
conflicts=('paml')
options=('!strip' '!debug')
source=("${url}/releases/download/v${pkgver}/paml-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('c164971eba80df95bf59bb95dec50046b492b03fa9c0d9860b6c35f23417308a')

# Upstream prebuilt binaries are dynamically linked against glibc only (ldd:
# libc, libm). The release tarball bundles LICENSE, doc/, and Technical/.
# Mirrors the source `paml` package's file set (bin + doc + Technical + LICENSE);
# dat/examples/src are intentionally not packaged.

package() {
    cd "$srcdir/paml-${pkgver}-linux-x86_64"
    install -Dm755 -t "$pkgdir/usr/bin" bin/*
    install -d "$pkgdir/usr/share/${_pkgname}"
    cp -r doc Technical "$pkgdir/usr/share/${_pkgname}/"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
