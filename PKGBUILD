# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-langchain
pkgver=0.1.11
pkgrel=3
pkgdesc='Build context-aware reasoning applications'
arch=('any')
url='https://pypi.org/project/langchain'
license=('MIT')
_module="${pkgname#python-}"
_src_name="${_module/-/_}-${pkgver}"
source=("https://pypi.org/packages/source/${_module::1}/${_module}/${_src_name}.tar.gz"
        "https://raw.githubusercontent.com/langchain-ai/langchain/v${pkgver}/LICENSE")
sha256sums=('03f08cae7cd3f341c54f1042b3fe24d88f39eba7b7eda942735d8ced13fe6da9'
            '4ec67e4ca6e6721dba849b2ca82261597c86a61ee214bbf21416006b7b2d0478')
depends=(python
    python-aiohttp
    python-dataclasses-json
    python-jsonpatch
    python-numpy
    python-pydantic
    python-yaml
    python-requests
    python-sqlalchemy
    python-tenacity
    python-jsonschema
    python-rapidfuzz
    python-lark-parser
    python-lxml
    python-pandas
    python-mypy_extensions
    python-regex
    python-typing_extensions
    python-async-timeout
    python-redis
    python-beautifulsoup4
    python-tiktoken
    python-openai
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')

build() {
    cd "${_src_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_src_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    cd ${srcdir}
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
