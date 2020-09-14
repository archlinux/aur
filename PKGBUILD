# Maintainer: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>

pkgname=avnet-bdf-git
pkgver=r21.30b6904
pkgrel=1
pkgdesc='Avnet Board Definition Files'
arch=('i686' 'x86_64')
url='https://github.com/Avnet/bdf'
license=('custom')
optdepends=('vivado: to actually use these files')
makedepends=('git')
source=("git+https://github.com/Avnet/bdf.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/bdf" || exit

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/bdf" || exit

    rm -v $(find . -maxdepth 1 -type f)
}

package() {
    cd "${srcdir}/bdf" || exit

    for vivado_version in 2017.4 2018.2 2018.3 2019.1 2019.2 2020.1; do
        local board_files_dir="${pkgdir}/opt/Xilinx/Vivado/${vivado_version}/data/boards/board_files"
        mkdir -p "${board_files_dir}"
        cp -rv . "${board_files_dir}"
    done
}
