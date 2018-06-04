# Maintainer: Gunnar Waterstraat <gunnar.waterstraat@gmx.de>
pkgname=python2-mne-git
pkgver=0.2.r13098.g05a09f7e5
pkgrel=2
pkgdesc="Open-source Python software for exploring, visualizing, and analyzing human neurophysiological data: MEG, EEG, sEEG, ECoG, and more."
arch=('any')
url="https://www.martinos.org/mne/stable/index.html"
license=('BSD')
depends=('python2>=2.7' 'python2-numpy>=1.8' 'python2-scipy>=0.12')
optdepends=('python2-matplotlib' 'mayavi' 'python2-scikit-learn' 'python2-nibabel' 'python2-pandas' 'picard')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('mne-python::git+http://github.com/mne-tools/mne-python.git')
md5sums=('SKIP')

pkgver() {
  cd mne-python
  git describe --long | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "mne-python"
	python2 setup.py build
}

package() {
	cd "mne-python"
	python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
