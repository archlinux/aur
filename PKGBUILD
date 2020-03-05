# Maintainer: Yamada Hayao <shun819.mail@gmail.com>
# Contributor: YamaD <yamad.linuxer@gmail.com>

pkgname=plymouth-theme-alter-pp-git
pkgver=1.0.0
pkgrel=1
pkgdesc="AlterLinux用のplymouthテーマ"
arch=('any')
url=https://github.com/yamad-linuxer/plymouth-theme-alter
license=('GPL')
depends=('plymouth')
optdepends=()
source=("git+https://github.com/yamad-linuxer/plymouth-theme-alter.git")
md5sums=('SKIP')
conflicts=('plymouth-theme-alter-pp')

pkgver() {
    cd "plymouth-theme-alter"

    git describe --tags | sed 's/-/.r/; s/-g/./'
}

build () {
    cd "plymouth-theme-alter"

    rm -rf alter-logo
    rm LICENSE
    rm README.md
    rm install.sh
    rm -rf .git/

    mkdir -p ./usr/share/plymouth/themes/alter-pp/
    cp -r ./alter-pp/intro/* ./usr/share/plymouth/themes/alter-pp/
    cp -r ./alter-pp/loop/* ./usr/share/plymouth/themes/alter-pp/
    cp -r ./alter-pp/misc/* ./usr/share/plymouth/themes/alter-pp/

    rm -rf alter-pp

    mv ./usr/ ..
    cd ..
    rm -rf ./plymouth-theme-alter/

}

package() {
    mkdir -p "$pkgdir"
    cp -r * "$pkgdir"
}

