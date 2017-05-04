# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

pkgbase=python-abjad
pkgname=(python-abjad python2-abjad)
pkgver=2.20
pkgrel=2
pkgdesc="Formalized music score control. Package for Python"
arch=('any')
url="https://github.com/Abjad/abjad"
license=('GPL 3')
optdepends=('graphviz: to create rhythm-trees graphs and other tree structures')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('c8ba4ea9707ba87e9a2ede40c97d14d6b6c701ae884667dcd44c828a50c97cb0')

prepare() {
	cp -rup $srcdir/abjad-$pkgver $srcdir/abjad-$pkgver-python2
}

package_python-abjad() {
	depends=('python' 'lilypond' 'python-ply')
	makedepends=('python-setuptools')
	pkgdesc+=" 3"

	cd $srcdir/abjad-$pkgver

	#optimize option causes build errors, so it is commented
	python setup.py install --root="$pkgdir/" #--optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-abjad() {
	depends=('python2' 'lilypond' 'python2-ply')
	makedepends=('python2-setuptools')
	pkgdesc+=" 2"

	cd $srcdir/abjad-$pkgver-python2

	python2 setup.py install --root="$pkgdir/" #--optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

