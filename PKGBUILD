# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

pkgbase=python-abjad
pkgname=(python-abjad python2-abjad)
pkgver=2.21
pkgrel=1
pkgdesc="Tool for formalized music score control. Package for Python"
arch=('any')
url="https://github.com/Abjad/abjad"
license=('GPL 3')
depends=('lilypond')
optdepends=('graphviz: to create rhythm-trees graphs and other tree structures'
            'timidity++: to play generated MIDI files'
            'jupyter: browser-based interactive notebook for programming')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('5fc1fc977b9521d4b9ce1aa8bdea1aa07306e313bd03feea15e8c680b4f27c5b')

prepare() {
    cp -rup $srcdir/abjad-$pkgver $srcdir/abjad-$pkgver-python2
}

package_python-abjad() {
    depends+=('python' 'python-ply' 'python-six')
    makedepends=('python-setuptools')
    optdepends+=(   'ipython: an enhanced Python console'
                    'python-ipywidgets: IPython widgets for Jupyter notebook'
                    'python-pypdf2: PDF toolkit')
    pkgdesc+=" 3"

    cd $srcdir/abjad-$pkgver

    #optimize option causes build errors, so it is commented
    python setup.py install --root="$pkgdir/" #--optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-abjad() {
    depends+=('python2' 'python2-ply' 'python2-six')
    makedepends=('python2-setuptools')
    optdepends+=(   'ipython2: an enhanced Python 2 console'
                    'python2-ipykernel: Python 2 support for Jupyter'
                    'python2-ipywidgets: IPython2 widgets for Jupyter notebook'
                    'python2-pypdf2: PDF toolkit')
    pkgdesc+=" 2"

    cd $srcdir/abjad-$pkgver-python2

    python2 setup.py install --root="$pkgdir/" #--optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

