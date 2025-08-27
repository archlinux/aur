# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: entriphy <t4ils.dev@gmail.com>

_name="asyncpraw"
pkgname="python-${_name}"
pkgver=7.8.1
pkgrel=1
pkgdesc="Asynchronous Python Reddit API wrapper"
arch=('any')
url="https://asyncpraw.readthedocs.io/en/stable/"
_url="https://github.com/praw-dev/${_name}"
license=('BSD-2-Clause')
depends=(
  'python>=3.8'
  'python-aiofiles'
  'python-aiohttp'
  'python-aiosqlite'
  'python-asyncprawcore>=2.4'
  # 'python-defusedxml'
  'python-update-checker>=0.18'
)
makedepends=(
  'python-build'
  'python-flit-core>=3.4'
  'python-installer'
  'python-typing_extensions'
  'python-wheel'
)
# checkdepends=(
#   'python-pytest'
#   'python-pytest-asyncio'
#   'python-pytest-vcr'
#   'python-vcrpy'
# )
_pkgsrc="${_name}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bcab59c279c0bb696439e4ee3fcfbfc15763041c1aa36510e3cf084321b5197e')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -i 's/ <.*"/"/g' 'pyproject.toml'
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  python -m build --wheel --no-isolation
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   pytest
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
