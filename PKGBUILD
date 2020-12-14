# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=soupsieve
pkgname=python-${_pyname}-doc
pkgver=2.1
pkgrel=1
pkgdesc="Documentation for SoupSieve"
arch=('i686' 'x86_64')
url="https://facelessuser.github.io/soupsieve"
license=('MIT')
makedepends=("python-${_pyname}=${pkgver}.0"
             'mkdocs-pymdownx-material-extras'
             'python-mkdocs-material-extensions'
             'python-mkdocs-git-revision-date-localized-plugin')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('0194a795d6073b4336e7b95e42e5292f')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e '/-\ git-rev/a \      fallback_to_build_date: true' \
           -e '/-\ git-rev/s/$/:/' -e '$a use_directory_urls: false' mkdocs.yml
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    mkdocs build
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a site "${pkgdir}/usr/share/doc/${pkgname%-doc}"
}
