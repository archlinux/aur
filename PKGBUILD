# Maintainer: Peter Jackson <pete@peteonrails.com>
pkgname=voxtype-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Push-to-talk voice-to-text for Linux (pre-built binaries)"
arch=('x86_64')
url="https://voxtype.io"
license=('MIT')
depends=(
    'alsa-lib'
    'curl'
    'gcc-libs'
    'glibc'
)
optdepends=(
    'wtype: keyboard simulation for Wayland (recommended, best CJK support)'
    'dotool: keyboard simulation with layout support (KDE/GNOME compatible)'
    'ydotool: keyboard simulation fallback (X11/TTY support)'
    'wl-clipboard: clipboard support'
    'libnotify: desktop notifications'
    'pipewire: audio server (recommended)'
    'pipewire-alsa: ALSA compatibility for PipeWire (required if using PipeWire)'
    'pulseaudio: audio server (alternative to PipeWire)'
    'vulkan-icd-loader: GPU acceleration via Vulkan for Whisper (enable with: voxtype setup gpu --enable)'
    'cuda: GPU acceleration via CUDA 13 for ONNX engines (NVIDIA GPUs, requires driver 580+)'
    'cuda12.6: GPU acceleration via CUDA 12 for ONNX engines (older NVIDIA setups)'
    'rocm-hip-runtime: GPU acceleration via MIGraphX for ONNX engines (AMD GPUs)'
    'ollama: local AI summarization for meeting mode'
)
provides=('voxtype')
conflicts=('voxtype')
backup=('etc/voxtype/config.toml')
install=voxtype-bin.install
validpgpkeys=('E79F5BAF8CD51A806AA27DBB7DA2709247D75BC6')  # Peter Jackson <pete@peteonrails.com>
_github="https://github.com/peteonrails/voxtype/releases/download/v$pkgver"
source=(
    # Whisper binaries
    "voxtype-$pkgver-avx2::$_github/voxtype-$pkgver-linux-x86_64-avx2"
    "voxtype-$pkgver-avx2.asc::$_github/voxtype-$pkgver-linux-x86_64-avx2.asc"
    "voxtype-$pkgver-avx512::$_github/voxtype-$pkgver-linux-x86_64-avx512"
    "voxtype-$pkgver-avx512.asc::$_github/voxtype-$pkgver-linux-x86_64-avx512.asc"
    "voxtype-$pkgver-vulkan::$_github/voxtype-$pkgver-linux-x86_64-vulkan"
    "voxtype-$pkgver-vulkan.asc::$_github/voxtype-$pkgver-linux-x86_64-vulkan.asc"
    # ONNX CPU binaries (all ONNX engines: Parakeet, Moonshine, SenseVoice, Paraformer, Dolphin, Omnilingual)
    "voxtype-$pkgver-onnx-avx2::$_github/voxtype-$pkgver-linux-x86_64-onnx-avx2"
    "voxtype-$pkgver-onnx-avx2.asc::$_github/voxtype-$pkgver-linux-x86_64-onnx-avx2.asc"
    "voxtype-$pkgver-onnx-avx512::$_github/voxtype-$pkgver-linux-x86_64-onnx-avx512"
    "voxtype-$pkgver-onnx-avx512.asc::$_github/voxtype-$pkgver-linux-x86_64-onnx-avx512.asc"
    # ONNX CUDA 12 binary + companion shared libs (CUDA 12.x hosts: Ubuntu LTS, Debian, older Fedora)
    # ort 2.0.0-rc.12's CUDA EP dlopen's libonnxruntime_providers_*.so at runtime via /proc/self/exe;
    # without them co-located, EP registration fails and ort silently falls back to CPU.
    "voxtype-$pkgver-onnx-cuda-12::$_github/voxtype-$pkgver-linux-x86_64-onnx-cuda-12"
    "voxtype-$pkgver-onnx-cuda-12.asc::$_github/voxtype-$pkgver-linux-x86_64-onnx-cuda-12.asc"
    "voxtype-$pkgver-onnx-cuda-12.libonnxruntime_providers_cuda.so::$_github/voxtype-$pkgver-linux-x86_64-onnx-cuda-12.libonnxruntime_providers_cuda.so"
    "voxtype-$pkgver-onnx-cuda-12.libonnxruntime_providers_shared.so::$_github/voxtype-$pkgver-linux-x86_64-onnx-cuda-12.libonnxruntime_providers_shared.so"
    # ONNX CUDA 13 binary + companion shared libs (CUDA 13.x hosts: Arch, rolling distros, requires driver 580+)
    "voxtype-$pkgver-onnx-cuda-13::$_github/voxtype-$pkgver-linux-x86_64-onnx-cuda-13"
    "voxtype-$pkgver-onnx-cuda-13.asc::$_github/voxtype-$pkgver-linux-x86_64-onnx-cuda-13.asc"
    "voxtype-$pkgver-onnx-cuda-13.libonnxruntime_providers_cuda.so::$_github/voxtype-$pkgver-linux-x86_64-onnx-cuda-13.libonnxruntime_providers_cuda.so"
    "voxtype-$pkgver-onnx-cuda-13.libonnxruntime_providers_shared.so::$_github/voxtype-$pkgver-linux-x86_64-onnx-cuda-13.libonnxruntime_providers_shared.so"
    # ONNX MIGraphX binary + companion shared libs (AMD GPU EP, replaces ROCm in v0.7.0)
    "voxtype-$pkgver-onnx-migraphx::$_github/voxtype-$pkgver-linux-x86_64-onnx-migraphx"
    "voxtype-$pkgver-onnx-migraphx.asc::$_github/voxtype-$pkgver-linux-x86_64-onnx-migraphx.asc"
    "voxtype-$pkgver-onnx-migraphx.libonnxruntime_providers_migraphx.so::$_github/voxtype-$pkgver-linux-x86_64-onnx-migraphx.libonnxruntime_providers_migraphx.so"
    "voxtype-$pkgver-onnx-migraphx.libonnxruntime_providers_shared.so::$_github/voxtype-$pkgver-linux-x86_64-onnx-migraphx.libonnxruntime_providers_shared.so"
    # Config and support files
    "config-$pkgver.toml::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/config/default.toml"
    "voxtype-$pkgver.service::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/packaging/systemd/voxtype.service"
    "voxtype-$pkgver.bash::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/packaging/completions/voxtype.bash"
    "voxtype-$pkgver.zsh::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/packaging/completions/voxtype.zsh"
    "voxtype-$pkgver.fish::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/packaging/completions/voxtype.fish"
    "LICENSE-$pkgver::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/LICENSE"
    "README-$pkgver.md::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/README.md"
)
# TODO: Update SHA256 sums from final release artifacts before pushing to AUR.
# Run after release build:
#   cd releases/$pkgver && sha256sum voxtype-$pkgver-linux-x86_64-* | sort
sha256sums=(
    # Whisper binaries
    'SKIP'  # voxtype-avx2
    'SKIP'  # voxtype-avx2.asc
    'SKIP'  # voxtype-avx512
    'SKIP'  # voxtype-avx512.asc
    'SKIP'  # voxtype-vulkan
    'SKIP'  # voxtype-vulkan.asc
    # ONNX CPU binaries
    'SKIP'  # voxtype-onnx-avx2
    'SKIP'  # voxtype-onnx-avx2.asc
    'SKIP'  # voxtype-onnx-avx512
    'SKIP'  # voxtype-onnx-avx512.asc
    # ONNX CUDA 12
    'SKIP'  # voxtype-onnx-cuda-12
    'SKIP'  # voxtype-onnx-cuda-12.asc
    'SKIP'  # voxtype-onnx-cuda-12.libonnxruntime_providers_cuda.so
    'SKIP'  # voxtype-onnx-cuda-12.libonnxruntime_providers_shared.so
    # ONNX CUDA 13
    'SKIP'  # voxtype-onnx-cuda-13
    'SKIP'  # voxtype-onnx-cuda-13.asc
    'SKIP'  # voxtype-onnx-cuda-13.libonnxruntime_providers_cuda.so
    'SKIP'  # voxtype-onnx-cuda-13.libonnxruntime_providers_shared.so
    # ONNX MIGraphX
    'SKIP'  # voxtype-onnx-migraphx
    'SKIP'  # voxtype-onnx-migraphx.asc
    'SKIP'  # voxtype-onnx-migraphx.libonnxruntime_providers_migraphx.so
    'SKIP'  # voxtype-onnx-migraphx.libonnxruntime_providers_shared.so
    # Config and support files
    'SKIP'  # config.toml
    'SKIP'  # voxtype.service
    'SKIP'  # voxtype.bash
    'SKIP'  # voxtype.zsh
    'SKIP'  # voxtype.fish
    'SKIP'  # LICENSE
    'SKIP'  # README.md
)

package() {
    # Install Whisper CPU binaries to /usr/lib/voxtype/
    install -Dm755 "$srcdir/voxtype-$pkgver-avx2" "$pkgdir/usr/lib/voxtype/voxtype-avx2"
    install -Dm755 "$srcdir/voxtype-$pkgver-avx512" "$pkgdir/usr/lib/voxtype/voxtype-avx512"

    # Install Whisper Vulkan GPU binary
    install -Dm755 "$srcdir/voxtype-$pkgver-vulkan" "$pkgdir/usr/lib/voxtype/voxtype-vulkan"

    # Install ONNX CPU binaries (no GPU EP, no companion .so files)
    install -Dm755 "$srcdir/voxtype-$pkgver-onnx-avx2" "$pkgdir/usr/lib/voxtype/voxtype-onnx-avx2"
    install -Dm755 "$srcdir/voxtype-$pkgver-onnx-avx512" "$pkgdir/usr/lib/voxtype/voxtype-onnx-avx512"

    # GPU-using ONNX binaries each live in their own subdirectory alongside
    # the EP companion shared libs they dlopen at runtime. ort 2.0.0-rc.12's
    # CUDA/MIGraphX EPs resolve their .so files via /proc/self/exe; if they
    # aren't co-located, EP registration fails and ort silently falls back
    # to CPU. /proc/self/exe follows symlinks, so the user-facing names at
    # /usr/lib/voxtype/voxtype-onnx-* are symlinks into these subdirs.

    # ONNX CUDA 12 (locked to libcudart.so.12 ABI)
    install -Dm755 "$srcdir/voxtype-$pkgver-onnx-cuda-12" \
        "$pkgdir/usr/lib/voxtype/cuda-12/voxtype-onnx-cuda-12"
    install -Dm644 "$srcdir/voxtype-$pkgver-onnx-cuda-12.libonnxruntime_providers_cuda.so" \
        "$pkgdir/usr/lib/voxtype/cuda-12/libonnxruntime_providers_cuda.so"
    install -Dm644 "$srcdir/voxtype-$pkgver-onnx-cuda-12.libonnxruntime_providers_shared.so" \
        "$pkgdir/usr/lib/voxtype/cuda-12/libonnxruntime_providers_shared.so"
    ln -sf "cuda-12/voxtype-onnx-cuda-12" \
        "$pkgdir/usr/lib/voxtype/voxtype-onnx-cuda-12"

    # ONNX CUDA 13 (locked to libcudart.so.13 ABI, requires driver 580+)
    install -Dm755 "$srcdir/voxtype-$pkgver-onnx-cuda-13" \
        "$pkgdir/usr/lib/voxtype/cuda-13/voxtype-onnx-cuda-13"
    install -Dm644 "$srcdir/voxtype-$pkgver-onnx-cuda-13.libonnxruntime_providers_cuda.so" \
        "$pkgdir/usr/lib/voxtype/cuda-13/libonnxruntime_providers_cuda.so"
    install -Dm644 "$srcdir/voxtype-$pkgver-onnx-cuda-13.libonnxruntime_providers_shared.so" \
        "$pkgdir/usr/lib/voxtype/cuda-13/libonnxruntime_providers_shared.so"
    ln -sf "cuda-13/voxtype-onnx-cuda-13" \
        "$pkgdir/usr/lib/voxtype/voxtype-onnx-cuda-13"

    # ONNX MIGraphX (AMD GPU EP, replaces ROCm in v0.7.0)
    install -Dm755 "$srcdir/voxtype-$pkgver-onnx-migraphx" \
        "$pkgdir/usr/lib/voxtype/migraphx/voxtype-onnx-migraphx"
    install -Dm644 "$srcdir/voxtype-$pkgver-onnx-migraphx.libonnxruntime_providers_migraphx.so" \
        "$pkgdir/usr/lib/voxtype/migraphx/libonnxruntime_providers_migraphx.so"
    install -Dm644 "$srcdir/voxtype-$pkgver-onnx-migraphx.libonnxruntime_providers_shared.so" \
        "$pkgdir/usr/lib/voxtype/migraphx/libonnxruntime_providers_shared.so"
    ln -sf "migraphx/voxtype-onnx-migraphx" \
        "$pkgdir/usr/lib/voxtype/voxtype-onnx-migraphx"

    # Compatibility symlink for users with scripts referencing the old
    # voxtype-onnx-rocm name. The AMD GPU EP changed from ROCm to MIGraphX
    # in v0.7.0; ship one release with both names to soften the transition.
    # Drop in v0.8.0.
    ln -sf "voxtype-onnx-migraphx" "$pkgdir/usr/lib/voxtype/voxtype-onnx-rocm"

    # /usr/bin/voxtype symlink and the unversioned voxtype-onnx-cuda symlink
    # are created by the .install script's post_install/post_upgrade hooks
    # so they can pick the right CUDA variant for the host.

    # Install default configuration
    install -Dm644 "$srcdir/config-$pkgver.toml" "$pkgdir/etc/voxtype/config.toml"

    # Install systemd user service
    install -Dm644 "$srcdir/voxtype-$pkgver.service" "$pkgdir/usr/lib/systemd/user/voxtype.service"

    # Install documentation
    install -Dm644 "$srcdir/README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Install license
    install -Dm644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install shell completions
    install -Dm644 "$srcdir/voxtype-$pkgver.bash" "$pkgdir/usr/share/bash-completion/completions/voxtype"
    install -Dm644 "$srcdir/voxtype-$pkgver.zsh" "$pkgdir/usr/share/zsh/site-functions/_voxtype"
    install -Dm644 "$srcdir/voxtype-$pkgver.fish" "$pkgdir/usr/share/fish/vendor_completions.d/voxtype.fish"
}
