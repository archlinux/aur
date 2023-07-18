# Maintainer: Andrej Radović <r.andrej@gmail.com>
pkgname=python-ffsubsync
_name=${pkgname#python-}
pkgver=0.4.25
pkgrel=1
pkgdesc="Language-agnostic automatic synchronization of subtitles with video."
url="https://github.com/smacke/ffsubsync"
depends=(
    'python'
    'python-auditok'
    'python-cchardet'
    'python-chardet'
    'python-charset-normalizer'
    'python-ffmpeg'
    'python-future'
    'python-numpy'
    'python-pysubs2'
    'python-rich'
    'python-six'
    'python-srt'
    'python-tqdm'
    'python-typing_extensions'
    'python-webrtcvad'
)
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=(
    "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
    "https://raw.githubusercontent.com/smacke/ffsubsync/$pkgver/requirements.txt"
)
sha256sums=('2a7cea5105030da4785a49ad2c139cbcd677c5cb57b5af8e1d859026fa74a2db'
            '67491bab58c1b38bfd2e63f0bcddecb12660104474cb1fab229d8abc1c322d03')

build() {
	cp "$srcdir/requirements.txt" "$srcdir/$_name-$pkgver"
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
