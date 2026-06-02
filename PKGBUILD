# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-lm-eval
_pkgname=lm_eval
pkgver=0.4.12
pkgrel=1
pkgdesc="A framework for few-shot evaluation of language models (EleutherAI lm-evaluation-harness)"
arch=('any')
url="https://github.com/EleutherAI/lm-evaluation-harness"
license=('MIT')
depends=(
    'python'
    'python-datasets'
    'python-numpy'
    'python-evaluate'
    'python-jinja'
    'python-pytablewriter'
    'python-rouge-score'
    'python-sacrebleu'
    'python-scikit-learn'
    'python-sqlitedict'
    'python-dill'
    'python-word2number'
    'python-more-itertools'
    'python-typing_extensions'
    'python-tqdm'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
    'python-requests: for API model backends'
    'python-aiohttp: for API model backends'
    'python-tenacity: for API model backends'
    'python-tiktoken: for API model backends'
    'python-jsonlines: for the archiver extra'
    'python-zstandard: for the archiver extra'
    'python-transformers: for HuggingFace model support'
    'python-pytorch: for HuggingFace model support'
    'python-accelerate: for HuggingFace model support'
    'python-peft: for HuggingFace model support'
    'python-vllm: for vLLM model backend'
    'litellm: for the LiteLLM model backend'
    'python-sentencepiece: for SentencePiece tokenizers'
    'python-nltk: for the ifeval/ruler tasks'
    'python-langdetect: for the ifeval task'
    'python-immutabledict: for the ifeval task'
    'python-sympy: for the math task'
    'python-scipy: for the ruler task'
    'python-wandb: for Weights & Biases logging'
    'python-pandas: for Weights & Biases / zeno logging'
)
source=("$_pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('45938d7c8024d5eee5c8a0da36abe7cc09c252413c577cf81666f0fcd28b4345')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    PYTHONPATH="$PWD:$PYTHONPATH" python -c "import lm_eval; print(lm_eval.__version__)"
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
