# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <superchief@evertvorster.com>
pkgname=python-sam2-git
pkgver=r76.2b90b9f
pkgrel=1
pkgdesc="Facebook Research AI to Segment Anything in Images and Videos"
arch=('x86_64')
url="https://github.com/facebookresearch/sam2"
license=('Apache-2.0')
groups=()
depends=('python-fsspec' 'python-pytorch' 'python-sympy' 
	'cuda' 'python-torchvision' 'python-numpy' 'python-tqdm' 
	'python-hydra-core' 'python-iopath' 'python-pillow'
	'python-opencv-cuda' 'google-glog')
makedepends=('git' 'python-build' 'python-setuptools') 
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/facebookresearch/sam2.git')
noextract=()
sha256sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/sam2"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/sam2"
}

build() {
echo "Building phase"
	cd "$srcdir/sam2"
	CUDA_HOME=/opt/cuda python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
	cd "$srcdir/sam2"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
