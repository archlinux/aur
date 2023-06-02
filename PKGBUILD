# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="spleeter2"
_name="spleeter"
pkgver=2.3.2
pkgrel=1
# from github
#pkgdesc="The Deezer source separation library with pretrained models based on tensorflow"
#url="https://github.com/deezer/spleeter"
# from research paper
pkgdesc="The Deezer fast and efficient music source separation tool with pre-trained models"
url="https://research.deezer.com/projects/spleeter.html"
license=("MIT")
arch=("any")
provides=("spleeter")
conflicts=("spleeter")
depends=("tensorflow>=2.5.0"
         "python<3.11"
         "python-ffmpeg"
         "python-h2"
         "python-httpx"
         "python-importlib-metadata"
         "python-importlib-resources"
         "python-librosa"
         "python-llvmlite"
         "python-norbert"
         "python-numpy"
         "python-pandas"
         "python-protobuf"
         "python-tensorflow"
         "python-typer")
makedepends=("python-poetry" "python-build" "python-installer" "python-wheel")
optdepends=("python-musdb: source separation evaluation"
            "python-museval: source separation evaluation")
options=("!strip")
#source=("spleeter-$pkgver.tar.gz::https://github.com/deezer/spleeter/archive/refs/tags/v$pkgver.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('a871a1d7b7a915cbac34d5cc63d60a1d45d06d1fcd07bc19318c83556d4de897')
install="$pkgname.install"

build(){
 cd "spleeter-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "spleeter-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
 # https://wiki.archlinux.org/title/PKGBUILD#license
 install -D -m 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
