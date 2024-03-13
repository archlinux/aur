# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-langchain-community
_pkgname=${pkgname#python-}
pkgver=0.0.28
pkgrel=1
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
_src_name="${_pkgname/-/_}-${pkgver}"
source=("https://pypi.org/packages/source/${_pkgname::1}/${_pkgname}/${_src_name}.tar.gz"
        "https://github.com/langchain-ai/langchain/raw/v0.1.12/LICENSE")
sha256sums=('8664d243a90550fc5ddc137b712034e02c8d43afc8d4cc832ba5842b44c864ce'
            '4ec67e4ca6e6721dba849b2ca82261597c86a61ee214bbf21416006b7b2d0478')

build() {
    cd "${_src_name}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_src_name}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
