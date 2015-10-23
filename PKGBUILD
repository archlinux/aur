# Maintainer: Antoine Carpentier <antoine.carpentier.info@gmail.com>
pkgname=pointcarrefs
pkgver=r4.226c5bb
pkgrel=1
pkgdesc="Mount pointcarre.vub.ac.be with fuse"
arch=('any')
url="chaaaaateau.noip.me/shitgotreal/MagicToon.jpg"
license='GPL'
groups=()
depends=(fuse python2 python2-requests python2-beautifulsoup4 python2-pip python2-fusepy)
makedepends=('git')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
replaces=()
backup=()
options=(!emptydirs)
install=()
source=('pointcarrefs::git+https://github.com/t00n/PointCarreFS#branch=packagable')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir ~/.pointcarrefs
    echo "NETID=''" >> ~/.pointcarrefs/local_config.py
    echo "PASSWORD=''" >> ~/.pointcarrefs/local_config.py
    echo "Fill in your netid and password in ~/.pointcarrefs/local_config.py"
	cd "$srcdir/$pkgname"
	python2 setup.py install --root="$pkgdir/" --optimize=1
    sudo install -m 644 pointcarrefs.service /etc/systemd/system/
}
