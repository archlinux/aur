# Maintainer: Aiden Isik <aidenisik+aur@member.fsf.org>
pkgname=super-bombinhas-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="A 2D platformer written in Ruby."
arch=('any')
url="https://github.com/victords/super-bombinhas"
license=('GPL3')
makedepends=('tar' 'pkg-config' 'binutils')
depends=('ruby>=2.0' 'pango' 'sdl2' 'sdl2_ttf')
source=(https://github.com/victords/super-bombinhas/releases/download/v${pkgver}/super-bombinhas-${pkgver}.deb)
b2sums=('f2db0a8bc99c0173646cc8f68399a1817777e519f452911cb9c821e0b9f0e2d4290fc12a47eab39c83815445424ff62dfb038d8ccf2d38e77286087f3291221b')

package() {
	# Get required gems
	gem install gosu -v 1.4.6 --conservative
	gem install minigl -v 2.4.3 --conservative
	
	# Extract to correct place
	ar -xvf ${srcdir}/super-bombinhas-${pkgver}.deb
	mkdir data
	tar -xvf ${srcdir}/data.tar.xz -C data
	chmod -R 755 data # Match Arch system directory permissions
	cp -a data/* ${pkgdir}
}
