# Maintainer: Radu C. Martin <radu dot c dot martin at gmail dot com>

pkgname=carnot
pkgver=7.1.0
pkgrel=1
pkgdesc='A tool for the calculation and simulation of the thermal components of HVAC systems with regards to conventional and regenerative elements'
arch=('i686' 'x86_64')
url='https://www.fh-aachen.de/forschung/solar-institut-juelich/carnot/'
license=('BSD-3-Clause')
makedepends=('gcc8')
depends=('matlab')
source=(
    "$pkgname-$pkgver.zip::https://fh-aachen.sciebo.de/s/0hxub0iIJrui3ED/download?path=%2F&files=Carnot_71.zip"
    'script_build.m'
    )
sha256sums=(
    'ecd28cb7324c3b0bc2ae4760180fa7b7d69395a9f04138b185782acc27105c57'
    '3ce68c106d4f778fb93593bd2b8f1f4ebf99a8f50f17f5333d956c1d41773e4f'
    )

prepare(){
    sed -i '254s/c99"/c99" /' $srcdir/version_manager/MakeMEX.m
    sed -i '258s/c99"/c99" /' $srcdir/version_manager/MakeMEX_CleanUp.m
}

build(){
    matlab -batch script_build
}

package(){
    rm $srcdir/$pkgname-$pkgver.zip $srcdir/script_build.m
    mkdir -p $pkgdir/opt/tmw/$pkgname
    cp -r * $pkgdir/opt/tmw/$pkgname
    
    echo "#############################################################"
    echo "# Finished Packaging CARNOT Toolbox                         #"
    echo "# You should add it to MATLAB search path after install     #"
    echo "# by either running 'init_carnot' or 'init_carnot_savepath' #"
    echo "# from /opt/tmw/carnot                                      #"
    echo "#############################################################"
}
