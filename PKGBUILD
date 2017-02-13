# Mainer: Peter Babič <babicpet at gmail dot com>
pkgname=scriptbasic
pkgver=2.1_RC1
pkgrel=3
pkgdesc="Scriba compiler for a powerful scripting language/API"
arch=("x86_64")
url="http://www.scriptbasic.org/"
license=('unknown')
depends=('postgresql-libs')
install=".install"
source=("http://www.scriptbasic.org/download/SB_${pkgver}_Linux.tar.gz"
        "scriptbasic_arch.patch"
        "configure.save")
noextract=()
md5sums=('374a37fff435d26c08cfe2ed8d694a8e'
         'f026797fd8e695a797e1eee2f04e264a'
         'fc077e744f5000c5e508243b35f348f2')
validpgpkeys=()

prepare() {
#       perl jamal.pl -i        
        sudo chmod -R 755 "scriptbasic"
        cp configure.save scriptbasic/
        patch -p0 -i "scriptbasic_arch.patch"
}

build() {
	cd "scriptbasic"
	./setup
        make clean
        ./setup
        ./setup --install --load
}

package() {
	cd "scriptbasic"
        sudo ./install.sh
}
