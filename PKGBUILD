# Contributor: Nafis <mnabid.25@outlook.com>
# Contributor: Porous3247 <pqtb3v7t at jasonyip1 dot anonaddy dot me>

_pkgname=animdl
pkgname="${_pkgname}-git"
pkgver=r366.fd3277f
pkgrel=1
pkgdesc="highly efficient anime downloader and streamer"
arch=('any')
url="https://github.com/justfoolingaround/animdl"
license=('GPL3')
depends=('anitopy'
         'python'
         'python-anchor-kr'
         'python-click'
         'python-cssselect'
         'python-httpx'
         'python-lxml'
         'python-packaging'
         'python-pkginfo'
         'python-pycryptodomex'
         'python-regex'
         'python-requests'
         'python-rich'
         'python-tqdm'
         'python-yaml'
         'python-yarl')
makedepends=('git'
             'python-poetry-core'
             'python-build'
             'python-installer'
             'python-wheel')
optdepends=(
    'mpv: streaming support'
    'vlc: streaming support'
    'fzf: fuzzy finder support'
    'python-pypresence: Discord RPC'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build () {
    cd "${_pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
