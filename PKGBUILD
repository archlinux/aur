# Maintainer: Yamada Hayao <shun819.mail@gmail.com>
# Contributor: YamaD <yamad.linuxer@gmail.com>

pkgname=plymouth-theme-alter-logo-git
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
conflicts=('plymouth-theme-alter-logo')

pkgver() {
    cd "plymouth-theme-alter"

    git describe --tags | sed 's/-/.r/; s/-g/./'
}

build () {
    cd "plymouth-theme-alter"

    rm -rf alter-pp
    rm LICENSE
    rm README.md
    rm install.sh
    rm -rf .git/

    mkdir -p ./usr/share/plymouth/themes/alter-logo/
    cp -r ./alter-logo/intro/* ./usr/share/plymouth/themes/alter-logo/
    cp -r ./alter-logo/loop/* ./usr/share/plymouth/themes/alter-logo/
    cp -r ./alter-logo/misc/* ./usr/share/plymouth/themes/alter-logo/

    rm -rf alter-logo

    mv ./usr/ ..
    cd ..
    rm -rf ./plymouth-theme-alter/

}

package() {
    mkdir -p "$pkgdir"
    cp -r * "$pkgdir"
}

