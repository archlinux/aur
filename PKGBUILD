# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

pkgname=skesa
pkgver=2.4.0
pkgrel=1
arch=('x86_64')
url="https://github.com/ncbi/SKESA"
pkgdesc="A de-novo sequence read assembler and a de Bruijn graph based target enriched de-novo assembler."
license=('custom')
makedepends=('gcc' 'cmake' 'boost' 'make' 'sed' 'gcc-libs' 'zlib')
provides=("skesa=2.4.0" "saute=1.3.0" "gfa_connector=1.1.0" "kmercounter=2.2.0")
source=("https://github.com/ncbi/SKESA/archive/refs/tags/skesa.2.4.0_saute.1.3.0_1.tar.gz"
)
b2sums=('08b0477670a3e7751f598e903eb227e766bce91ba2e44cca1b8accbc7abff7191b3f9117e639d48f4d99c86bee3773385c25767bd755dae14d4186e8cfc264bf'
)

prepare() {
    cd $srcdir/SKESA-skesa.2.4.0_saute.1.3.0_1/
    # fix root issue in package
    #     patch -Np0 -i "$srcdir/Makefile.patch"
}

build() {
    cd $srcdir/SKESA-skesa.2.4.0_saute.1.3.0_1/

    make skesa
    make saute
    make saute_prot
    make gfa_connector
    make kmercounter
}

package() {
    cd $srcdir/SKESA-skesa.2.4.0_saute.1.3.0_1/

    install -Dm755 -t "$pkgdir/usr/bin" skesa
    install -Dm755 -t "$pkgdir/usr/bin" saute
    install -Dm755 -t "$pkgdir/usr/bin" saute_prot
    install -Dm755 -t "$pkgdir/usr/bin" gfa_connector
    install -Dm755 -t "$pkgdir/usr/bin" kmercounter
    install -Dm644 -t "${pkgdir}/usr/share/licenses/skesa" LICENSE
}
