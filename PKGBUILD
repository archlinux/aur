# Maintainer: 0fflineuser <0fflineuser@cock.li>

pkgname="openrecall-git"
_name="OpenRecall"
pkgver=0.1
pkgrel=1
pkgdesc="A fully open-source, privacy-first alternative to proprietary solutions like Microsoft's Windows Recall. You can easily access your digital history, enhancing your memory and productivity without compromising your privacy."
arch=('any')
url="https://pypi.org/project/OpenRecall/"
license=('GPL3')
provides=(python-openrecall)
depends=(
  python
  python-flask
  python-numpy
  python-mss
  python-pytorch
  python-torchvision
  python-shapely
  python-h5py
  python-rapidfuzz
  python-pillow
  #AUR
  python-sentence-transformers
)
optdepends=(python-pytorch-cuda python-pytorch-rocm)
makedepends=(python-build python-installer python-wheel)
checkdepends=()
source=("$_name-$pkgver-py3-none-any.whl::https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl")
sha256sums=('dc8c0d71be283e9cacb0c794fc4992da41eb39a8fe25976d652d903740598817')

package() {
  python -m installer --prefix="/usr" --destdir="${pkgdir}" *.whl
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/openrecall" <<EOF
#!/bin/bash
exec python3 -m openrecall.app "\$@"
EOF
}
