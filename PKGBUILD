# Maintainer: Gesh <gesh@gesh.uni.cx>
# Contributor: JP-Ellis <josh@jpellis.me>

pkgname=python-habanero
pkgver=2.9.2
pkgrel=2
_name=${pkgname#python-}
_name="${_name//-/_}"
_src_folder="${_name}-${pkgver}"
pkgdesc="A low level client for Crossref's Search API"
url="https://github.com/sckott/habanero"
depends=(
  'python'
  'python-httpx2'
  'python-packaging'
  'python-tqdm'
  'python-urllib3'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-hatchling'
)
checkdepends=(
  # Only needed to test integration of the optdep, uncomment this if using
  # 'python-bibtexparser>=2.0.0b5'
  'python-pytest'
  'python-pytest-recording'
  'python-pyyaml'
)
optdepends=(
  'python-bibtexparser: attempt to fix misformatted bibtex'
)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('efcdfecec965c413e0f1ee9034fbe955d42e6b815b0784aa0c4a3df2cc272019')

build() {
    cd "$_src_folder"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_src_folder"

    python -m pytest --disable-plugin-autoload \
      -p recording
}

package() {
    cd "$_src_folder"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/"$pkgname"/
}

# vim:set ts=2 sw=2 et:
