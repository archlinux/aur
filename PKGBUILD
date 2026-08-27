# Maintainer: George Sofianos <george at sofianos dot dev>

# Release notes https://rocm.docs.amd.com/en/latest/about/release-notes.html
pkgname=rocm-bin-extras
pkgdesc="ROCm Core SDK - Extras (MIGraphX)"
pkgver=10.0.0
pkgrel=1
epoch=0
arch=('x86_64')
url='https://www.amd.com'
license=('custom:AMD')
depends=('ocl-icd' 'gcc-libs')
provides=('migraphx' 'rvs' 'roc-optiq') # 'mivisionx' 'hipfort' 'rocpydecode' 'rocal'
conflicts=('migraphx' 'rvs' 'roc-optiq')
options=('!strip')
noextract=()

source=(
"https://stable.repo.amd.com/rocm/migraphx/tarball/migraphx-2.17.0%2Brocm10.0.0.tar.gz"
"https://github.com/ROCm/roc-optiq/releases/download/v1.0.0-optiq/roc-optiq_1.0.0.2-1_amd64-ubuntu-26.deb"
"https://stable.repo.amd.com/rocm/extras/rvs/packages/ubuntu2604/pool/main/amdrocm10-rvs_1.6.122-708_amd64.deb"
# "https://rocm.frameworks.amd.com/deb-multi-arch/amdrocm-migraphx/pool/main/amdrocm-migraphx_2.16.0-3.py314_amd64.deb"
# "https://rocm.frameworks.amd.com/deb-multi-arch/amdrocm-migraphx/pool/main/amdrocm-migraphx-dev_2.16.0-3.py314_amd64.deb"
)

sha256sums=(
"bf4def72ae884f5373ed3b7315ecf3bb2e4f7107d130592d5bb0ccc37d496e54"
"d6744d12af4526cf7538361f6faed84f54844a7fd05be3221d436ecdc7607f20"
"989649e8306a8a8417e98f9c07314437e90a85704d8c9a99fc163b2476d5f7f9"
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

    mkdir -p "$pkgdir/opt"

    cp -a "$srcdir/migraphx-2.17.0+rocm10.0.0" "$pkgdir/opt/"
    cp -a "$srcdir/opt/." "$pkgdir/opt/"
}
