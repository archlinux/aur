# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
pkgname=rocm-bin-extras
pkgdesc="ROCm Core SDK and TheRock Build System - Extras"
pkgver=7.14.0
pkgrel=1
epoch=0
arch=('x86_64')
url='http://www.amd.com'
license=('custom:AMD')
depends=('ocl-icd' 'gcc-libs')
provides=('migraphx') # 'mivisionx' 'hipfort' 'rocpydecode' 'rocal'
conflicts=('migraphx')
options=('!strip')
noextract=()

source=(
"https://rocm.frameworks.amd.com/deb-multi-arch/amdrocm-migraphx/pool/main/amdrocm-migraphx_2.16.0-3.py314_amd64.deb"
"https://rocm.frameworks.amd.com/deb-multi-arch/amdrocm-migraphx/pool/main/amdrocm-migraphx-dev_2.16.0-3.py314_amd64.deb"
)

sha256sums=(
"6741f52c748f9befd53324b0f0c47998be1146cc815267bd128d7a2a2ebadeb0"
"b0461d57e5c9372107e26af658f539ca58207a46ac5bf22251acd5259156b3ce"
)

package() {
    for p in *.deb; do
        ar x "${p}"
        if [[ -f data.tar.gz ]]; then
            # echo gz: "${srcdir}/${p}"
            tar xfx data.tar.gz
            rm data.tar.gz
        elif [[ -f data.tar.xz ]]; then
            # echo xz: "${srcdir}/${p}"
            tar xJf data.tar.xz
            rm data.tar.xz
        fi
    done

    install -d "${pkgdir}/opt/rocm/extras-7"
    mv "${srcdir}/opt/rocm/"* "${pkgdir}/opt/rocm/extras-7/"
}
