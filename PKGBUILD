# Maintainer: Robert Kubosz <kubosz.robert@gmail.com>

pkgbase=python-abjad
pkgname=(python-abjad python2-abjad)
pkgver=2.21
pkgrel=4
pkgdesc="Tool for formalized music score control."
arch=("any")
url="https://github.com/Abjad/abjad"
license=("GPL 3")
depends=("lilypond")
makedepends=("python-setuptools" "python2-setuptools")
conflicts=("python2-abjad")
optdepends=(
    "fluidsynth: to play generated MIDI files (instead of timidity++)"
    "timidity++: to play generated MIDI files (instead of fluidsynth)"
    "graphviz: to create rhythm-trees graphs and other tree structures"
    )
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=("5fc1fc977b9521d4b9ce1aa8bdea1aa07306e313bd03feea15e8c680b4f27c5b")

prepare () {
    cp -rup $srcdir/abjad-$pkgver $srcdir/abjad-$pkgver-python2
}

build() {
    cd $srcdir/abjad-$pkgver
    python setup.py build

    cd $srcdir/abjad-$pkgver-python2
    python2 setup.py build
}

package_python-abjad() {
    depends+=(
        "python"
        "python-ply"
        "python-six"
        )
    conflicts=("python2-abjad")

    cd $srcdir/abjad-$pkgver
    python setup.py install --root="$pkgdir/" --no-compile
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-abjad() {
    depends+=(
        "python2"
        "python2-ply"
        "python2-six"
        "python2-mock"
        "python2-funcsigs"
        "python2-enum34"
        "python2-pathlib2"
        "python2-scandir"
        )
    conflicts=("python-abjad")
    provides=("python-abjad")

    cd $srcdir/abjad-$pkgver-python2
    python2 setup.py install --root="$pkgdir/" --no-compile
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

