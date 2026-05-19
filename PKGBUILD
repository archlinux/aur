# Maintainer: Peter Jackson <pete@peteonrails.com>
pkgname=voxtype-bin
pkgver=0.7.3
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
    'gtk4-layer-shell: runtime for the GTK4 on-screen mic visualizer (voxtype-osd-gtk4)'
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
    "voxtype-$pkgver-onnx-cuda-12::$_github/voxtype-$pkgver-linux-x86_64-onnx-cuda-12"
    "voxtype-$pkgver-onnx-cuda-12.asc::$_github/voxtype-$pkgver-linux-x86_64-onnx-cuda-12.asc"
    "voxtype-$pkgver-onnx-cuda-12.libonnxruntime_providers_cuda.so::$_github/voxtype-$pkgver-linux-x86_64-onnx-cuda-12.libonnxruntime_providers_cuda.so"
    "voxtype-$pkgver-onnx-cuda-12.libonnxruntime_providers_shared.so::$_github/voxtype-$pkgver-linux-x86_64-onnx-cuda-12.libonnxruntime_providers_shared.so"
    # ONNX CUDA 13 binary + companion shared libs (CUDA 13.x hosts: Arch, rolling distros, requires driver 580+)
    # v0.7.3+: cu13 dlopens ORT at runtime (ort/load-dynamic) because Microsoft's
    # prebuilt is the only ORT 1.24.4 build with Blackwell sm_120 coverage and
    # is distributed as .so only. The runtime ships alongside the binary; the
    # install step below symlinks libonnxruntime.so to this versioned name.
    "voxtype-$pkgver-onnx-cuda-13::$_github/voxtype-$pkgver-linux-x86_64-onnx-cuda-13"
    "voxtype-$pkgver-onnx-cuda-13.asc::$_github/voxtype-$pkgver-linux-x86_64-onnx-cuda-13.asc"
    "voxtype-$pkgver-onnx-cuda-13.libonnxruntime_providers_cuda.so::$_github/voxtype-$pkgver-linux-x86_64-onnx-cuda-13.libonnxruntime_providers_cuda.so"
    "voxtype-$pkgver-onnx-cuda-13.libonnxruntime_providers_shared.so::$_github/voxtype-$pkgver-linux-x86_64-onnx-cuda-13.libonnxruntime_providers_shared.so"
    "voxtype-$pkgver-onnx-cuda-13.libonnxruntime.so.1.24.4::$_github/voxtype-$pkgver-linux-x86_64-onnx-cuda-13.libonnxruntime.so.1.24.4"
    # ONNX MIGraphX binary + companion shared libs (AMD GPU EP, replaces ROCm in v0.7.0)
    "voxtype-$pkgver-onnx-migraphx::$_github/voxtype-$pkgver-linux-x86_64-onnx-migraphx"
    "voxtype-$pkgver-onnx-migraphx.asc::$_github/voxtype-$pkgver-linux-x86_64-onnx-migraphx.asc"
    "voxtype-$pkgver-onnx-migraphx.libonnxruntime_providers_migraphx.so::$_github/voxtype-$pkgver-linux-x86_64-onnx-migraphx.libonnxruntime_providers_migraphx.so"
    "voxtype-$pkgver-onnx-migraphx.libonnxruntime_providers_shared.so::$_github/voxtype-$pkgver-linux-x86_64-onnx-migraphx.libonnxruntime_providers_shared.so"
    # OSD launcher + GTK4 frontend (engine-agnostic, built once in Dockerfile.onnx).
    # The launcher resolves /proc/self/exe, follows the /usr/bin symlink, and
    # probes its parent dir for voxtype-osd-gtk4 / voxtype-osd-native.
    "voxtype-$pkgver-osd::$_github/voxtype-$pkgver-linux-x86_64-osd"
    "voxtype-$pkgver-osd.asc::$_github/voxtype-$pkgver-linux-x86_64-osd.asc"
    "voxtype-$pkgver-osd-gtk4::$_github/voxtype-$pkgver-linux-x86_64-osd-gtk4"
    "voxtype-$pkgver-osd-gtk4.asc::$_github/voxtype-$pkgver-linux-x86_64-osd-gtk4.asc"
    # Config and support files
    "config-$pkgver.toml::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/config/default.toml"
    "voxtype-$pkgver.service::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/packaging/systemd/voxtype.service"
    "voxtype-$pkgver.bash::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/packaging/completions/voxtype.bash"
    "voxtype-$pkgver.zsh::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/packaging/completions/voxtype.zsh"
    "voxtype-$pkgver.fish::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/packaging/completions/voxtype.fish"
    "LICENSE-$pkgver::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/LICENSE"
    "README-$pkgver.md::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/README.md"
    # Desktop entry + terminal launcher for `voxtype configure` (TUI surfaced in walker/rofi/etc.)
    "voxtype-configure-$pkgver.desktop::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/packaging/voxtype-configure.desktop"
    "voxtype-configure-launcher-$pkgver::https://raw.githubusercontent.com/peteonrails/voxtype/v$pkgver/packaging/scripts/voxtype-configure-launcher"
)
sha256sums=(
    # Whisper binaries
    '095191715ee18d320f319332d47ed98841a09e1927e2d2276634ba7a2d16e4e5'  # voxtype-avx2
    'SKIP'  # voxtype-avx2.asc
    'ae72d9105f1e521dfcf2ddf6742a96b8af56b655023d51952b274e11faa2c5d8'  # voxtype-avx512
    'SKIP'  # voxtype-avx512.asc
    '3b59c0621de48109c1a63cf5af92ed085bba9d9f7d0a623082d792a2d6c15f6f'  # voxtype-vulkan
    'SKIP'  # voxtype-vulkan.asc
    # ONNX CPU binaries
    '792da58000d692bef61b5255740a098b152ad226366682be7a6e139388a68c12'  # voxtype-onnx-avx2
    'SKIP'  # voxtype-onnx-avx2.asc
    '1c55d0ff24d8eb45bff4e88d94f30900ff97fbc908c2a677befb5f5ab46a6c63'  # voxtype-onnx-avx512
    'SKIP'  # voxtype-onnx-avx512.asc
    # ONNX CUDA 12
    '72c3b291760c6ccf3a46793da440dda36cd4de8210101196163d492f0c58becf'  # voxtype-onnx-cuda-12
    'SKIP'  # voxtype-onnx-cuda-12.asc
    'a8584727d51ba646ac63fc991c2f36ad6cd5b8cc8b1141896e46938700b888d0'  # voxtype-onnx-cuda-12.libonnxruntime_providers_cuda.so
    '1b028afc079628d76a28d7eb09700a4baead4a27f9634ba82c35398486134114'  # voxtype-onnx-cuda-12.libonnxruntime_providers_shared.so
    # ONNX CUDA 13
    '4e765462ab4a985acbf6e73385af1d9e40aea1873d407239ae6f495588315a36'  # voxtype-onnx-cuda-13
    'SKIP'  # voxtype-onnx-cuda-13.asc
    'b6cb7744d0efd2faced5c83ead374c13e7f2630b5a249ffaf393cdb1e092c92b'  # voxtype-onnx-cuda-13.libonnxruntime_providers_cuda.so
    'c6a12593396095f5670160e284c35d1700b7708cf3037b7042e2a5200ccae772'  # voxtype-onnx-cuda-13.libonnxruntime_providers_shared.so
    '1aacefdf0b4afa145d410b2381bbc3db3d978c485fb182c42a2b0b09f91f5310'  # voxtype-onnx-cuda-13.libonnxruntime.so.1.24.4
    # ONNX MIGraphX
    '87b966bc1303048ab019a559839f829031005da96938a81c0f232602e923573a'  # voxtype-onnx-migraphx
    'SKIP'  # voxtype-onnx-migraphx.asc
    'ddd67e6193ade819ee21f1706d1b03b9151f1d2d2843701e2d19d8b183631707'  # voxtype-onnx-migraphx.libonnxruntime_providers_migraphx.so
    '17f7cf47ad0d7b5ac895ae588fd62c7f85a13842588161b6a24c7d480f062be4'  # voxtype-onnx-migraphx.libonnxruntime_providers_shared.so
    # OSD launcher + GTK4 frontend
    '3bdbcc84a5fb1853da75377dd199aad2e151f5e7bf59bfdb9a3e20632d3b96d8'  # voxtype-osd
    'SKIP'  # voxtype-osd.asc
    '7d8eda8e4511577cf4bebb5ef56d1a09f7eea9419a5af1da97870289e180ad60'  # voxtype-osd-gtk4
    'SKIP'  # voxtype-osd-gtk4.asc
    # Config and support files
    'aaa36cb5f382e66b2d385c657450629209c5875e29c82370cc190202616a8cbe'  # config.toml
    '531c3658e229619e56bb01659fb81f401767b85e1d6e2acd1ac67ee3414a168c'  # voxtype.service
    '65c95805d9b03ccc2fadb9d63a03ab79974b00091df8457ee8ef290ec6bd5b12'  # voxtype.bash
    'e5e63b3c7f48238cf719e4f2ef90c1f9c5c7e8cd25eaebc9f78bdd34b24b6605'  # voxtype.zsh
    'f720ddd24ee97c105b448323899c36bca7c63d00c2d42c4a3da70c3d157dccbb'  # voxtype.fish
    '31123c45b4ff9cb5fd9e01083350fea6ccaf14969013fd48e4c95fdf89e6eb4b'  # LICENSE
    '744134f77ac3d2134682fef0bf2734aee9a36c6bbbac3c5b633ac500fa06273e'  # README.md
    '32144a4a5210092b0aa909f6de7a43ebe8bbf82fa3dfb1f3519787512fdf8e4b'  # voxtype-configure.desktop
    '2001788ae3c087ff2589ff69c9598160da1c783025cc52ca3382736694a97090'  # voxtype-configure-launcher
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

    # ONNX CUDA 13 (locked to libcudart.so.13 ABI, requires driver 580+).
    # v0.7.3+: dlopens ORT at runtime. Install Microsoft's libonnxruntime
    # under its SONAME plus a libonnxruntime.so symlink that ort/load-dynamic
    # expects (resolved relative to /proc/self/exe, see ort src/lib.rs:96-109).
    install -Dm755 "$srcdir/voxtype-$pkgver-onnx-cuda-13" \
        "$pkgdir/usr/lib/voxtype/cuda-13/voxtype-onnx-cuda-13"
    install -Dm644 "$srcdir/voxtype-$pkgver-onnx-cuda-13.libonnxruntime_providers_cuda.so" \
        "$pkgdir/usr/lib/voxtype/cuda-13/libonnxruntime_providers_cuda.so"
    install -Dm644 "$srcdir/voxtype-$pkgver-onnx-cuda-13.libonnxruntime_providers_shared.so" \
        "$pkgdir/usr/lib/voxtype/cuda-13/libonnxruntime_providers_shared.so"
    install -Dm644 "$srcdir/voxtype-$pkgver-onnx-cuda-13.libonnxruntime.so.1.24.4" \
        "$pkgdir/usr/lib/voxtype/cuda-13/libonnxruntime.so.1.24.4"
    ln -sf "libonnxruntime.so.1.24.4" \
        "$pkgdir/usr/lib/voxtype/cuda-13/libonnxruntime.so"
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

    # OSD launcher + GTK4 frontend. The launcher resolves /proc/self/exe and
    # probes its parent directory, so it finds /usr/lib/voxtype/voxtype-osd-gtk4
    # without needing it on PATH. Only the launcher gets a /usr/bin symlink.
    install -Dm755 "$srcdir/voxtype-$pkgver-osd" "$pkgdir/usr/lib/voxtype/voxtype-osd"
    install -Dm755 "$srcdir/voxtype-$pkgver-osd-gtk4" "$pkgdir/usr/lib/voxtype/voxtype-osd-gtk4"
    install -d "$pkgdir/usr/bin"
    ln -sf /usr/lib/voxtype/voxtype-osd "$pkgdir/usr/bin/voxtype-osd"

    # Desktop entry for the TUI configure command, surfaced in walker/rofi/fuzzel/etc.
    # The launcher discovers a terminal emulator and runs `voxtype configure` inside it.
    install -Dm755 "$srcdir/voxtype-configure-launcher-$pkgver" \
        "$pkgdir/usr/bin/voxtype-configure-launcher"
    install -Dm644 "$srcdir/voxtype-configure-$pkgver.desktop" \
        "$pkgdir/usr/share/applications/voxtype-configure.desktop"

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
