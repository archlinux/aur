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
    cd ${srcdir}/HWchart/HWchart/bin/Release
    sudo mkdir /usr/bin/HWchart
    sudo cp *.exe /usr/bin/HWchart/
    sudo cp *.dll /usr/bin/HWchart/
    cd ${srcdir}/HWchart/linux
    sudo cp hwchart.desktop /usr/share/applications/
    sudo chmod 755 /usr/share/applications/hwchart.desktop
    sudo mkdir /usr/share/hwchart
    sudo cp hwchart.png /usr/share/
}
