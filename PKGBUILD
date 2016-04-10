# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Joshua Hardy <joshinsilico@gmail.com>
pkgname=relion
pkgver=1.4
pkgrel=1
pkgdesc="REgularised LIkelihood OptimisatioN: employs an empirical Bayesian approach to refinement of 3D reconstructions or 2D class averages in electron cryo-microscopy"
arch=(x86_64)
url="http://www2.mrc-lmb.cam.ac.uk/relion/index.php/Main_Page"
license=('GPL')
depends=('libxinerama' 'glu' 'libjpeg-turbo' 'fftw' 'tcsh' 'alsa-lib' 'libxft' 'openmpi')
source=("http://www2.mrc-lmb.cam.ac.uk/groups/scheres/1sep15/$pkgname-$pkgver.tar.bz2" 
'relion.sh' 'relion.csh')
md5sums=('9897d73f405d11e0cceb740c2f7a6d29' 'SKIP' 'SKIP')

build() {
	cd "$pkgname-$pkgver"
	./INSTALL.sh -j 8
}

package() {
	cd "$pkgname-$pkgver"
	install -d $pkgdir/opt/relion $pkgdir/etc/profile.d/
	cp -r * $pkgdir/opt/relion/.
	install -D -m755 $srcdir/relion.* $pkgdir/etc/profile.d/.
	source /etc/profile.d/relion.sh
}
