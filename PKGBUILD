# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Astro Benzene <universebenzene at sina dot com>

pkgname="mkdocs-git-revision-date-localized-plugin"
pkgver=1.5.0
pkgrel=1
pkgdesc="MkDocs plugin to add a last updated date to your site pages"
url="https://github.com/timvink/mkdocs-git-revision-date-localized-plugin/"
license=('MIT')
arch=("any")
conflicts=("python-mkdocs-git-revision-date-localized-plugin")
replaces=("python-mkdocs-git-revision-date-localized-plugin")
depends=("mkdocs>=1.0" "python-gitpython>=3.1.44" "python-babel>=2.7.0")
makedepends=('python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('344d0744b26fb7667ac486b6e1fb8295df29bed798f6b34e193463c00fc5585bf5365330150bea5178f4f1d96fa8b3233b125362fbb9846a9354104437cc9a18')

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
