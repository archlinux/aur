# Maintainer: Hezekiah Michael <spiritomb at protonmail dot com>

pkgbase='python-pymkv'
pkgname=('python-pymkv')
_module=${pkgname#python-}
pkgver='1.0.8'
pkgrel=2
pkgdesc="A Python wrapper for mkvmerge that provides support for muxing, splitting, linking, chapters, tags, and attachments."
url="https://github.com/sheldonkwoodward/pymkv"
depends=('python' 'mkvtoolnix-cli' 'python-iso639' 'python-bitmath')
makedepends=('python-build' 'python-installer' 'python-setuptools-scm')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('194abf99a8f43eef89103c09529af6e73f9c143fe0b54fa7634d49943408442b')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licences/${pkgname}/LICENSE.txt"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
