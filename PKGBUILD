# Maintainer: Anakojm <https://anakojm.net/a-propos/#contact>

pkgname='mov-cli-git'
pkgver=1.4.3.r0.g0b52f87
pkgrel=1
pkgdesc="A cli tool to browse and watch movies/shows."
arch=('any')
url="https://github.com/${pkgname%-git}/${pkgname%-git}"
license=('GPL3')
depends=('ffmpeg' 'mpv' 'fzf' 'python-beautifulsoup4' 'python-lxml' 'python-httpx' 'python-pycryptodome' 'python-six' 'python-tldextract' 'python-krfzf')
optdepends=('iina: Player used for MacOS')
makedepends=('git' 'python-build' 'python-installer' 'python-poetry' 'python-wheel')
provides=("${pkgname%-git}")
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/${pkgname%-git}"
        git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
        python -m build --no-isolation --wheel "$srcdir/${pkgname%-git}"
}

package() {
        cd "$srcdir/${pkgname%-git}"
        _py=$(python --version)
        _py=${_py%%.*}
        _pkgname=${pkgname%-git}

        python -m installer --destdir="$pkgdir" \
                "$srcdir/${pkgname%-git}/dist/${_pkgname/-/_}-${pkgver%.r*}-py${_py##* }-none-any.whl"
}
