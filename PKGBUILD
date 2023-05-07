# Maintainer: Anakojm <https://anakojm.net/a-propos/#contact>

pkgname='mov-cli-git'
pkgver=1.3.8.r596.6d05915
pkgrel=3
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
        printf "%s.r%s.%s" "${pkgver%.r*}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
