# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-langchain-community
pkgver=0.0.20
pkgrel=2
pkgdesc="Community contributed LangChain integrations."
url="https://pypi.org/project/langchain-community"
depends=(python
    python-aiohttp
    python-dataclasses-json
    python-langchain-core
    python-langsmith
    python-numpy
    python-yaml
    python-requests
    python-sqlalchemy
    python-tenacity
    python-tiktoken
    python-lxml
    python-steam
    python-google-auth
    python-psycopg2
    python-feedparser
    python-pytube
    python-beautifulsoup4
    python-redis
    python-html2text
    python-pychm
    python-google-auth-oauthlib
    python-scikit-learn
    python-reportlab
    python-pyparsing
    python-websocket-client
    python-google-api-python-client
    python-googleapis-common-protos
    python-pillow
    python-chardet
    python-xmltodict
    python-magic
    python-joblib
    yt-dlp
    python-grpcio
    python-selenium
    python-google-api-core
    python-pygithub
    python-protobuf
    python-pytz
    python-openai
    python-packaging
    python-tqdm
    python-jsonpatch
    python-tomli
    python-typing_extensions
    python-pandas
    python-httpx
    python-urllib3
    python-psutil
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core')
license=('MIT')
arch=('any')
_module=${pkgname#python-}
_src_folder="${_module/-/_}-${pkgver}"
source=("https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module/-/_}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/langchain-ai/langchain/v0.1.7/LICENSE")
sha256sums=('c56c48bc77d24e1fc399a9ee9a637d96e3b2ff952e3a080b5a41820d9d00fb3c'
            '4ec67e4ca6e6721dba849b2ca82261597c86a61ee214bbf21416006b7b2d0478')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
