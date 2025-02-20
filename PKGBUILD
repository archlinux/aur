# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name3=pydantic-graph
_name2=pydantic-ai-slim
_name1=pydantic-ai-examples
_name0=pydantic-ai
pkgbase=python-${_name0}
pkgname=(python-${_name3} python-${_name2} python-${_name1} python-${_name0})
pkgver=0.0.24
pkgrel=2
arch=('any')
url='https://github.com/pydantic/pydantic-ai/tree/main/pydantic_graph'
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name3::1}/${_name3}/${_name3//-/_}-${pkgver}.tar.gz"
        "https://files.pythonhosted.org/packages/source/${_name2::1}/${_name2}/${_name2//-/_}-${pkgver}.tar.gz"
        "https://files.pythonhosted.org/packages/source/${_name1::1}/${_name1}/${_name1//-/_}-${pkgver}.tar.gz"
        "https://files.pythonhosted.org/packages/source/${_name0::1}/${_name0}/${_name0//-/_}-${pkgver}.tar.gz")
sha256sums=('40550e2310002f411b1fc0636206222caa5459ede7c44da5c856b3526b3096cd'
            'c82d5ffed6d3a149e64701d0e4cfa09256a8ef9feb296281f908af19050d2bf1'
            'aee9f6df07f5285ee517806a8c42315d5138a6d27d414ce90663e9edd9fab0e1'
            '7af076cbdb5f4c6ac8fae5273f02b67130b69d1cdaed87a022f79f42449f83a9')
depends=('python>=3.9')
makedepends=('python-hatchling'  'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-anyio' 'python-devtools' 'python-coverage' 'python-dirty-equals' 'python-inline-snapshot' 'python-pytest' 'python-pytest-examples' 'python-pytest-mock' 'python-pytest-pretty' 'python-diff-cover')

build() {
  cd "${srcdir}"/${_name3//-/_}-${pkgver}
  python -m build --wheel --no-isolation
  cd "${srcdir}"/${_name2//-/_}-${pkgver}
  python -m build --wheel --no-isolation
  cd "${srcdir}"/${_name1//-/_}-${pkgver}
  python -m build --wheel --no-isolation
  cd "${srcdir}"/${_name0//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}"/${_name0//-/_}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer ../${_name3//-/_}-${pkgver}/dist/*.whl
  test-env/bin/python -m installer ../${_name2//-/_}-${pkgver}/dist/*.whl
  test-env/bin/python -m installer ../${_name1//-/_}-${pkgver}/dist/*.whl
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package_python-pydantic-graph() {
  pkgdesc='Graph and state machine librarys.'
  depends+=('python-httpx' 'python-logfire-api' 'python-pydantic')
  url='https://github.com/pydantic/pydantic-ai/tree/main/pydantic_graph'
  cd "${srcdir}"/${_name3//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

package_python-pydantic-ai-slim() {
  pkgdesc='Agent Framework / shim to use Pydantic with LLMs, slim package.'
  depends+=('python-eval-type-backport' 'python-griffe' 'python-httpx' 'python-logfire-api' 'python-pydantic' 'pydantic-graph')
  optdepends=('python-logfire: logfire' 'python-openai: openai' 'python-cohere: cohere' 'python-google-auth: vertexai' 'python-requests: vertexai' 'python-anthropic: anthropic' 'python-groq: groq' 'python-mistralai: mistral')
  url='https://github.com/pydantic/pydantic-ai/tree/main/pydantic_ai_slim'
  cd "${srcdir}"/${_name2//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

package_python-pydantic-ai-examples() {
  pkgdesc='Examples of how to use PydanticAI and what it can do.'
  depends+=('pydantic-ai-slim' 'python-openai' 'python-google-auth' 'python-requests' 'python-groq' 'python-anthropic' 'python-asyncpg' 'python-fastapi' 'python-logfire' 'python-opentelemetry-instrumentation-asyncpg' 'python-opentelemetry-instrumentation-fastapi' 'python-opentelemetry-instrumentation-sqlite3' 'python-python-multipart' 'python-rich' 'python-uvicorn' 'python-devtools' 'python-gradio')
  url='https://github.com/pydantic/pydantic-ai/tree/main/examples'
  cd "${srcdir}"/${_name1//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

package_python-pydantic-ai() {
  pkgdesc='Agent Framework / shim to use Pydantic with LLMs.'
  depends+=('pydantic-ai-slim' 'python-openai' 'python-google-auth' 'python-requests' 'python-groq' 'python-anthropic' 'python-mistralai' 'python-cohere')
  optdepends=('pydantic-ai-examples: examples' 'python-logfire: logfire')
  url='https://github.com/pydantic/pydantic-ai/'
  cd "${srcdir}"/${_name0//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
