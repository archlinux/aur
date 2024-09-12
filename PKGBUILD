# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgname="mkdocs-git-revision-date-localized-plugin"
pkgver=1.2.9
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
b2sums=('a6f57eceeb2ff2c0e489848bb5c85717472dc39a5b49c464c497ae8ff78b1f0e1830b3a1fa5043aa0f2653460d6f783e9c92cf063552bc184c6c38fb47aa1fe4')

prepare(){
    cd ${srcdir}/${pkgname}-${pkgver}

    sed -i 's:>=70.0::' pyproject.toml
}

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
