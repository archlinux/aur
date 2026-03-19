# Maintainer: Astro Benzene <universebenzene at sina dot com>

#pkgbase=python-properdocs
pkgbase=properdocs
_pyname=${pkgbase}
#pkgname=("python-${_pyname}")
pkgname=("${_pyname}")
#"python-${_pyname}-doc")
pkgver=1.6.6
pkgrel=1
pkgdesc="Project documentation with Markdown."
arch=('any')
url="https://properdocs.org"
license=('BSD-2-Clause')
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
#            'python-click'
#            'python-jinja'
#            'python-markdown'
#            'python-mergedeep'
#            'python-pyyaml-env-tag'
#           )
# needs themes
#checkdepends=('python-click'
#              'python-dateutil'
#              'python-jinja'
#              'python-markdown'
#              'python-mergedeep'
#              'python-pyyaml-env-tag'
#              'python-watchdog')
#source=("https://github.com/oprypin/markdown-callouts/archive/refs/tags/v${pkgver}.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('bc0225ff2d7a9797130fded0a9c223b3')

get_pyinfo() {
    [[ $1 == "site" ]] && python -c "import site; print(site.getsitepackages()[0])" || \
        python -c "import sys; print('$1'.join(map(str, sys.version_info[:2])))"
}

#prepare() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    cp -r properdocs/tests .
#    for tpy in $(ls tests/[a-z]*.py); do mv tests/{,test_}${tpy#tests/}; done
#}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python -m build --wheel --no-isolation

#   msg "Building Docs"
#   python -m installer --destdir=tmp_install dist/*.whl
#   PATH="${srcdir}/${_pyname}-${pkgver}/tmp_install/usr/bin:${PATH}" \
#       PYTHONPATH="${srcdir}/${_pyname}-${pkgver}/tmp_install/$(get_pyinfo site)" properdocs build
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    python -m unittest -v
#}

package_properdocs() {
    depends=('python>=3.9'
             'python-click>=7.0'
             'python-jinja>=2.11.1'
             'python-markupsafe>=2.0.1'
             'python-markdown>=3.3.6'
             'python-yaml>=5.1'
             'python-watchdog>=2.0'
             'python-ghp-import>=1.0'
             'python-pyyaml-env-tag>=0.1'
             'python-packaging>=20.5'
             'python-mergedeep>=1.3.4'
             'python-pathspec>=0.11.1'
             'python-platformdirs>=2.2.0')
    optdepends=('python-properdocs-doc: Documentation for ProperDocs')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}

#package_python-pytkdocs-doc() {
#    pkgdesc="Documentation for markdown-callouts"
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a site "${pkgdir}/usr/share/doc/${pkgbase}"
#}
