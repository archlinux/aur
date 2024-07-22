# Maintainer: Bipin Kumar <kbipinkumar@pm.me>
pkgname=bracken
_pkgname=Bracken
pkgver=3.0
pkgrel=1
pkgdesc="Bayesian Reestimation of Abundance with KrakEN. https://doi.org/10.7717/peerj-cs.104"
arch=('i686' 'x86_64')
url="https://ccb.jhu.edu/software/bracken/"
license=('GPL3')
depends=('glibc' 'gcc-libs' 'bash' 'python')
optdepends=('kraken2: To generate kraken database as input')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jenniferlu717/Bracken/archive/refs/tags/v${pkgver}.tar.gz" 
        )        
sha256sums=('1d437fd8df1a8c5c03d908a7026a41cd486f5ce771e288be7aadd93542da7e44')

prepare() {
    cd ${_pkgname}-${pkgver}
    chmod +x bracken{,-build}
    sed -i 's/O3/O2/g' src/Makefile
}

build() {
    cd ${_pkgname}-${pkgver}/src
    make

}

package() {
  cd ${_pkgname}-${pkgver}/src
    install -d ${pkgdir}/usr/bin
    install -d ${pkgdir}/usr/share/${pkgname}
    install -Dm755 kmer2read_distr ${pkgdir}/usr/bin/kmer2read_distr
    install -Dm755 est_abundance.py ${pkgdir}/usr/bin/est_abundance.py
    install -Dm755 generate_kmer_distribution.py ${pkgdir}/usr/bin/generate_kmer_distribution.py
    install -Dm755 ../bracken ${pkgdir}/usr/bin/bracken
    install -Dm755 ../bracken-build ${pkgdir}/usr/bin/bracken-build
    install -Dm755 ../analysis_scripts/combine_bracken_outputs.py ${pkgdir}/usr/bin/combine_bracken_outputs.py
    cp -r ../sample_data/ ${pkgdir}/usr/share/${pkgname}/
}            
