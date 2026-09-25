# Maintainer: lalala <lalala_233@qq.com>

_prefix="/opt/comfyui"
pkgname=comfyui-system
install=$pkgname.install
pkgver=0.37.0
pkgrel=1
pkgdesc="The most powerful and modular diffusion model GUI, api and backend with a graph/nodes interface. (use system dependencies)"
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

    'python-comfyui-frontend-package>=1.52.7'
    'python-comfyui-workflow-templates>=0.11.66'
    'python-comfyui-embedded-docs>=0.5.12'
    'python-comfy-kitchen>=0.2.35'
    'python-comfy-aimdo>=0.5.5'
    'python-comfy-angle>=0.1.1'

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
    'python-opengl-accelerate: OpenGL acceleration'
)
makedepends=()

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/Comfy-Org/ComfyUI/archive/refs/tags/v$pkgver.tar.gz"
    'comfyui.sh'
    'extra_model_paths.yaml'
)

sha256sums=('40348d8f0b0fa25b532fdf216dccbeda6d98022c6b60cd623dbafc21be1dcdd4'
            '3ab61291d91ec7111f3bbbb9ec83f12503d0e33d0d3e2ca150416559a586696b'
            '6c259a120202e252fcaceac13739d1c847b353120d56b6b1c240ebe5fd2a1a85')

package() {
    install -dm755 "$pkgdir/$_prefix"
    cp -a "ComfyUI-$pkgver"/. "$pkgdir/$_prefix/"
    rm -rf "$pkgdir/$_prefix"/{.git,.github,.ci,tests,tests-unit,pytest.ini,.coderabbit.yaml,.gitattributes,.gitignore}
    install -Dm755 "$srcdir/comfyui.sh" "$pkgdir/usr/bin/comfyui"
    install -Dm644 "$srcdir/extra_model_paths.yaml" \
        "$pkgdir/usr/share/comfyui/extra_model_paths.yaml.default"
}
