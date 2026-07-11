# Maintainer: lalala <lalala_233@qq.com>

_prefix="/opt/comfyui"
pkgname=comfyui-system
pkgver=0.27.0
pkgrel=1
pkgdesc="The most powerful and modular diffusion model GUI, api and backend with a graph/nodes interface (use system dependencies)"
arch=('any')
url="https://github.com/Comfy-Org/ComfyUI"
license=('GPL-3.0')
conflicts=('comfyui')
depends=(
    'python'
    'python-pytorch'
    'python-torchsde'
    'python-torchvision'
    'python-torchaudio'
    'python-numpy'
    'python-einops'
    'python-transformers'
    'python-tokenizers'
    'python-sentencepiece'
    'python-safetensors'
    'python-aiohttp'
    'python-yarl'
    'python-yaml'
    'python-pillow'
    'python-scipy'
    'python-tqdm'
    'python-psutil'
    'python-alembic'
    'python-sqlalchemy'
    'python-filelock'
    'python-av'
    'python-requests'
    'python-simpleeval'
    'python-blake3'

    'python-comfyui-frontend-package'
    'python-comfyui-workflow-templates'
    'python-comfyui-embedded-docs'
    'python-comfy-kitchen'
    'python-comfy-aimdo'
    'python-comfy-angle'

    # non-essential, but can remove warings
    'python-kornia'
    'python-kornia-rs' # kornia depends on kornia rs but current aur package forget to add it.
    'python-spandrel'
    'python-pydantic'
    'python-pydantic-settings'
    'python-opengl'
)
optdepends=(
    'python-pytorch-cuda: NVIDIA GPU acceleration'
    'python-torchvision-cuda: NVIDIA GPU acceleration'
    'python-pytorch-rocm: AMD GPU acceleration'
)
makedepends=()

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/Comfy-Org/ComfyUI/archive/refs/tags/v$pkgver.tar.gz"
    'comfyui.sh'
    'extra_model_paths.yaml'
)

sha256sums=('6d1ff35963ce0259f8b645b3eef5e71d56c36d28c27df0b4057c65792c80efed'
            'edda27b534912b97049c38233488c7154c652485b41a9c49fe5b996fb72740d6'
            'd37f7739f9a927ec5aa73cf78ce8dd01cc4febb3a5b27ed458d9966710d1addf')

package() {
    install -dm755 "$pkgdir/$_prefix"
    cp -a "ComfyUI-$pkgver"/. "$pkgdir/$_prefix/"
    rm -rf "$pkgdir/$_prefix"/{.git,.github,.ci,tests,tests-unit,pytest.ini,.coderabbit.yaml,.gitattributes,.gitignore}
    install -Dm755 "$srcdir/comfyui.sh" "$pkgdir/usr/bin/comfyui"
    install -Dm644 "$srcdir/extra_model_paths.yaml" \
        "$pkgdir/usr/share/comfyui/extra_model_paths.yaml.default"
}

post_install() {
    echo ":: ComfyUI (system deps) installed successfully."
    echo ":: Run 'comfyui' to start the server."
    echo ":: All data will be stored in:"
    echo "::   ~/.cache/comfyui/   (inputs, outputs, models)"
    echo "::   ~/.config/comfyui/  (extra_model_paths.yaml)"
    echo ":: For GPU acceleration, install python-torch-cuda or python-torch-rocm."
}
