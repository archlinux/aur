# Maintainer: Nikos Toutoutzoglou <nikos dot toutou at gmail dot com>

pkgname=python-iptvtools-git
_gitpkgname=iptvtools
pkgver=0.2.10.r0.g9c92f34
pkgrel=1
pkgdesc="Provides iptv-filter script tool to maintain IPTV lists."
arch=('any')
url="https://github.com/huxuan/iptvtools"
license=('MIT')
depends=('ffmpeg')
provides=('python-iptvtools')
conflicts=('python-iptvtools')
makedepends=('python' 'python-setuptools')
source=("git+https://github.com/huxuan/iptvtools.git")
sha256sums=('SKIP')

pkgver() {
    git -C "$srcdir/$_gitpkgname" describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_gitpkgname"
    python setup.py build
}

package() {
    cd "$_gitpkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
