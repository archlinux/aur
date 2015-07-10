# Author: Luca De Pandis <lucadepandis (at) gmail (dot) com>

pkgname=knlmeanscl
__gitname=KNLMeansCL
pkgver="0.5.7"
pkgrel=1
pkgdesc="OpenCL implementation of the Non-local means denoising algorithm"
arch=("x86_64")
license=('GPL')
url="https://github.com/Khanattila/KNLMeansCL"
source=("git+https://github.com/Khanattila/KNLMeansCL.git")
depends=("vapoursynth" "ocl-icd")
makedepends=("opencl-headers")
md5sums=('SKIP')

pkgver() {
    cd ${__gitname}
    grep VERSION ${__gitname}/${__gitname}.h | cut -f3 -d ' ' 
}

build() {
    cd ${__gitname}
    chmod 0755 configure
    ./configure --install="/usr/lib/vapoursynth" \
                --extra-cxxflags="-march=x86-64 -mtune=generic"
    make
}

package() {
    cd ${__gitname}
    make install DESTDIR=${pkgdir}

    install -Dm 0644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    for d in CHANGELOG.md README.md; do
        install -Dm 0644 $d ${pkgdir}/usr/doc/knlmeanscl/$d
    done
}
