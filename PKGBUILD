# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=uberwriter-git
pkgver=2.2.0.beta1.4.r14.gb9e2720
pkgrel=1
pkgdesc='A distraction free Markdown editor for GNU/Linux made with GTK+'
arch=(any)
url="http://uberwriter.github.io/uberwriter/"
license=(GPL3)
depends=(gtk3
         python-pyenchant
         python-pypandoc
         webkit2gtk)
makedepends=(python-setuptools)
optdepends=("texlive-core: Export as PDF files"
            "otf-fira-mono: Recommended font (OTF)"
            "ttf-fira-mono: Recommended font (TTF)")
provides=(uberwriter)
conflicts=(uberwriter)
source=("git+https://github.com/UberWriter/uberwriter.git")
sha256sums=(SKIP)

pkgver() {
    cd uberwriter
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd uberwriter
    python setup.py build
}

package() {
    cd uberwriter
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
}
