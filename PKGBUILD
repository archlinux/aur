pkgname=python-get-video-properties
_name=${pkgname#python-}
_name2=${_name//-/_}
pkgver=0.1.1
pkgrel=1
pkgdesc="Get video properties"
url="https://github.com/mvasilkov/python-get-video-properties"
depends=(
    ffmpeg
    python
)
makedepends=(
    python-installer
)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name2}-$pkgver-py3-none-any.whl")
sha256sums=('04d4f478a5211917e2a7e87ddfcb1c17734cddf8374494c3993bf825b7ad4192')

package() {
    python -m installer --destdir="$pkgdir" "${_name2}-$pkgver-py3-none-any.whl"

    local site_packages
    site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    rm -rf "$pkgdir/$site_packages/videoprops/binary_dependencies"

    install -Dm644 "${_name2}-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
