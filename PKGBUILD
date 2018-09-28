# Maintainer: Jakob Senkl <jlp@live.at>
pkgname=hwchart
provides=('hwchart')
pkgver=1.5
pkgrel=1
_pkgdebrel=1
pkgdesc="a simple application to graph networks"
arch=('i686' 'x86_64')
url="https://github.com/fyr77/HWchart/"
license=('MIT')

source=("git://github.com/fyr77/HWchart.git")
md5sums=('SKIP')

depends=('mono')
makedepends=('nuget' 'git')

build() {
    cd ${srcdir}/HWchart
    /usr/bin/nuget restore
    msbuild /p:Configuration=Release
}

package() {
    sudo mkdir /usr/bin/hwchart
    sudo cp ${srcdir}/HWchart/HWchart/bin/Release/*.exe /usr/bin/hwchart/
    sudo cp ${srcdir}/HWchart/HWchart/bin/Release/*.dll /usr/bin/hwchart/
    sudo cp ${srcdir}/HWchart/linux/hwchart.desktop /usr/share/applications/
    sudo chmod 755 /usr/share/applications/hwchart.desktop
    sudo mkdir /usr/share/hwchart
    sudo cp ${srcdir}/HWchart/linux/hwchart.png /usr/share/
}
