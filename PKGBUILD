# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgname="mkdocs-git-revision-date-localized-plugin"
pkgver=1.4.0
pkgrel=1
pkgdesc="MkDocs plugin to add a last updated date to your site pages"
url="https://github.com/timvink/mkdocs-git-revision-date-localized-plugin/"
license=('MIT')
arch=("any")
conflicts=("python-mkdocs-git-revision-date-localized-plugin")
replaces=("python-mkdocs-git-revision-date-localized-plugin")
depends=("mkdocs" "python-gitpython" "python-babel>=2.7.0" "python-pytz")
makedepends=('python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('7e7b2fadb1b03409ad81c8a4d70e3a84e41a0b616f10d9ccb0eeed43e31e762478de5a598e5b1afa3466659fe60e9687b9fd2c5ad4ebd2ff3dc42e8d7005a66f')

#prepare(){
#    cd ${srcdir}/${pkgname}-${pkgver}
#
#    sed -i 's:>=70.0::' pyproject.toml
#}

build(){
    cd ${srcdir}/${pkgname}-${pkgver}

    python -m build --wheel --no-isolation
}

package(){
    cd ${srcdir}/${pkgname}-${pkgver}

    install -D -m 644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m 644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
