# Maintainer: Lyra Vhess <auxilliary.email@protonmail.com>
pkgname=vsrvrt-git
_pkgname=vs-rvrt
pkgver=1.0.0.r0.g57a5c5f
pkgrel=1
pkgdesc="Vapoursynth plugin for RVRT (Recurrent Video Restoration Transformer) video restoration"
arch=('x86_64')
url="https://github.com/Lyra-Vhess/vs-rvrt"
license=('CC-BY-NC-4.0')
depends=(
    'python'
    'python-einops'
    'python-torchvision'
    'python-numpy'
    'python-requests'
    'python-tqdm'
    'vapoursynth'
    'python-packaging'
)
optdepends=(
    'cuda: For GPU acceleration'
    'ffmpeg: For video encoding/decoding'
)
makedepends=('git' 'git-lfs' 'python-setuptools' 'python-wheel')
provides=('vsrvrt')
conflicts=('vsrvrt')
source=("git+https://github.com/Lyra-Vhess/vs-rvrt.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    git lfs fetch --all
    git lfs checkout
}

build() {
    cd "$_pkgname"
    python setup.py build
}

package() {
    cd "$_pkgname"
    python setup.py install --root="$pkgdir" --optimize=1
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
