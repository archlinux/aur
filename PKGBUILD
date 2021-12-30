# Maintainer: Demir Yerli demiryerli@gmail.com
pkgname='runasunified'
pkgver=2.0.0
pkgrel=1
epoch=1
pkgdesc='Run an app as root in linux'
arch=('x86_64')
url="https://github.com/mrquantumoff/RunAsUnified"
license=('GPLv3')
makedepends=('dotnet-sdk-6.0' 'mono')
depends=('sudo' 'dotnet-runtime-6.0' 'bash' 'git')
replaces=('asudo')
source=("ruas-linux.tar.gz")
noextract=()
md5sums=('SKIP')
prepare() {
	sudo rm -rf /usr/bin/ref
	sudo rm -rf /usr/bin/ruas
	sudo rm -rf /usr/bin/RunAsUnified
	sudo mkdir /usr/bin/ref
	cd RunAsUnified/RunAsUnified
}

build() {
	cd RunAsUnified/RunAsUnified
	dotnet build
}
package() {
	cd RunAsUnified/RunAsUnified
	cd bin/Debug/net6.0
	sudo mv RunAsUnified ruas
	sudo chmod +x ruas
	sudo cp ruas $pkgdir
	sudo cp RunAsUnified.dll $pkgdir
	sudo cp RunAsUnified.deps.json $pkgdir
	sudo cp RunAsUnified.runtimeconfig.json $pkgdir
	sudo cp ruas /usr/bin
	sudo cp RunAsUnified.dll /usr/bin
	sudo cp RunAsUnified.dll /usr/bin/ref
	sudo cp RunAsUnified.runtimeconfig.json /usr/bin
	sudo cp RunAsUnified.deps.json /usr/bin
}
