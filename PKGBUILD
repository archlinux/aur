# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-ffsubsync
_name=${pkgname#python-}
pkgver=0.4.20
pkgrel=1
pkgdesc="Language-agnostic automatic synchronization of subtitles with video."
url="https://github.com/smacke/ffsubsync"
depends=(
    'python'
    'python-argparse'
    'python-auditok'
    'python-cchardet'
    'python-ffmpeg'
    'python-future-annotations'
    'python-numpy'
    'python-six'
    'python-srt'
    'python-tqdm'
    'python-typing_extensions'
    'python-webrtcvad'
    'python-pysubs2'
    'python-rich'
)
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "https://raw.githubusercontent.com/smacke/ffsubsync/$pkgver/requirements.txt"

)
sha256sums=('d48d241bec6a2ab03a3d61e1ab2e277e6cab270f746ec626c819337a5bb64cf9'
            '443b1afc077044c41fb1442dc36e4bba595a8895178847d9bc956b485246c018')

build() {
	cp "$srcdir/requirements.txt" "$srcdir/$_name-$pkgver"
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
