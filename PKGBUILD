# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="pix2tex"
pkgver=0.0.31
pkgrel=2
pkgdesc="Using a ViT to convert images of equations into LaTeX code"
url="https://github.com/lukas-blecher/LaTeX-OCR"
license=("MIT")
arch=("any")
provides=("pix2tex" "python-pix2tex" "latexocr")
replaces=("python-pix2tex")
conflicts=("python-pix2tex")
depends=("pyside6" # gui
         "python"
         "python-albumentations"
         "python-einops"
         #"python-fastapi" # api
         #"python-imagesize" # train
         #"python-levenshtein" # train
         #"python-multipart" # api
         "python-munch"
         "python-numpy"
         "python-opencv"
         "python-pandas"
         "python-pillow"
         #"python-pygments" # highlight
         "python-pynput" #gui
         "python-pyqt6" # gui
         "python-pyqt6-webengine" # gui
         "python-pytorch"
         "python-requests"
         "python-screeninfo" # gui
         #"python-streamlit" # api
         "python-timm"
         "python-tokenizers"
         #"python-torchtext" # train
         "python-tqdm"
         "python-transformers"
         #"python-uvicorn" # api
         "python-x-transformers"
         "python-yaml")
optdepends=("gnome-screenshot: X11 screenshots"
            "grim: wayland screenshots"
            "slurp: wayland screenshots")
makedepends=("python-wheel" "findutils")
source=(
  "https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/${pkgname//-/_}-$pkgver-py3-none-any.whl"
  "https://github.com/lukas-blecher/LaTeX-OCR/releases/download/v0.0.1/image_resizer.pth"
  "https://github.com/lukas-blecher/LaTeX-OCR/releases/download/v0.0.1/weights.pth"
)
b2sums=('6a4448f7c4bc30105652bce17fbb8235e786f141534a023918397c8e5f776f9abba4282f45d038961306051c94fcb882fa1c6f7df8145875a3511d8c6b7d0004'
        'f969b612ff8d45cd01818b1239d27443a672b6b88affbb471cac656e968296de29301faf6a793c62c268ad043f7e38f52341bfe3095ea403119f2b057bd7665d'
        '64377f93393e0e321abb45ab158016213e292090fdba7579ea4147df880252a260715488fbc379c83c330df50209758a1939700ea874c14c73bbe5afacc9051c')
noextract=("${pkgname//-/_}-$pkgver-py3-none-any.whl")
options=("!strip")

package(){
 cd "$srcdir"
 python -m installer --destdir="$pkgdir" *.whl
 _checkpoints_dir="$(find "$pkgdir/usr/lib" -type "d" -name "checkpoints" -print -quit)"
 install -D -m 644 "$srcdir/image_resizer.pth" -t "$_checkpoints_dir"
 install -D -m 644 "$srcdir/weights.pth" -t "$_checkpoints_dir"
}
